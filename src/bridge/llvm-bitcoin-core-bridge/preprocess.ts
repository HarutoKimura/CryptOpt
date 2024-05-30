/**
 * Copyright 2023 University of Adelaide
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { groupBy } from "lodash-es";

import { matchArgPrefix } from "@/helper";
import Logger from "@/helper/Logger.class";
import type { Fiat } from "@/types";

import { getArguments } from "./helpers";
import type { raw_T, SSA } from "./raw.type";
import {
  transformAdd,
  transformAnd,
  transformAshr,
  transformIcmp,
  transformLshr,
  transformMul,
  transformOr,
  transformShl,
  transformTrunc,
  transformXor,
  transformZext,
} from "./transformations";
import type { Intermediate } from "./transformations/intermediate.type";
import { zextR } from "./transformations/reducers";
// type fixedArgs = Omit<raw_T, "arguments"> & { arguments: Fiat.FuncArgument };

type A = Fiat.FiatFunction["arguments"][number];
type R = Fiat.FiatFunction["returns"][number];
type B = Fiat.FiatFunction["body"];
export class BCBPreprocessor {
  public preprocessRaw(raw: Readonly<raw_T>): Fiat.FiatFunction {
    Logger.log(`BCB: preprocessRaw'ing ${raw.operation}`);
    const fixed = this.fixArguments(raw);
    let body = fixed.body;

    // Transform the arguments of each instruction to an array
    body = body.map((instr) => {
      if (typeof instr !== 'string' && typeof instr.arguments === 'string') {
        instr.arguments = instr.arguments.split(',').map((arg) => arg.trim());
      }
      return instr;
    });

    const grouped = groupBy(raw.body, "operation");

    const otherInstrs = Object.entries({
      add: transformAdd,
      and: transformAnd,
      ashr: transformAshr,
      lshr: transformLshr,
      mul: transformMul,
      or: transformOr,
      xor: transformXor,
      shl: transformShl,
      trunc: transformTrunc,
      zext: transformZext,
      icmp: transformIcmp,
    }).reduce((acc, [op, func]) => {
      if (grouped[op]) {
        acc.push(
          ...grouped[op].map((i) => {
            try {
              return func(i);
            } catch (e) {
              console.error(JSON.stringify(i));
              throw e;
            }
          }),
        );
      }
      return acc;
    }, [] as Intermediate[]);

    body = body.concat(otherInstrs as Fiat.DynArgument[]);

    body = zextR(body);

    // fix up the %x1=arg1 statements (we need them to resolve them, but not anymore)
    body = body.filter(
      (o) =>
        !(o.arguments.length === 1 && typeof o.arguments[0] === "string" && matchArgPrefix(o.arguments[0])),
    );
    return {
      operation: raw.operation,
      arguments: fixed.args,
      returns: fixed.returns,
      body: body,
    };
  }

  private fixArguments(raw: Readonly<raw_T>): {
    args: A[];
    returns: R[];
    body: B;
  } {
    // transform the arguments
    const args_ND = raw.arguments[0]
      .split(",")
      .filter((a) => a.length > 0)
      .map((s) => s.trim())
      .map((g) => ({
        name: g.split(" ")[1],
        datatype: g.split(" ")[0],
      }));

    // now rename them, make %x, %y to arg1, arg2 and add the required =-operations to the body
    const body = [] as Fiat.DynArgument[];
    const args: A[] = args_ND.reduce((acc, arg, i) => {
      const expectedXdd = `%${arg.name}` as Fiat.VarName;
      const desiredArgN = `arg${i + 1}` as Fiat.ArgName;
      body.push({
        name: [expectedXdd],
        datatype: "u64",
        operation: "=",
        arguments: [desiredArgN],
      });
      acc.push({
        name: desiredArgN,
        datatype: "u64",
        lbound: "0x0" as Fiat.HexConstant,
        ubound: "0xffffffffffffffff" as Fiat.HexConstant,
      });
      return acc;
    }, [] as A[]);
    
    const returns = [] as R[];
    if (raw.returns[0].name == "%x0") {
      returns.push({
        name: "out1",
        datatype: "u64",
        lbound: "0x0" as Fiat.HexConstant,
        ubound: "0xffffffffffffffff" as Fiat.HexConstant,
      });
      body.push({
        name: ["%x0"],
        datatype: "u64",
        operation: "=",
        arguments: ["out1"] as unknown as Fiat.Argument[],
      });
    }
  }
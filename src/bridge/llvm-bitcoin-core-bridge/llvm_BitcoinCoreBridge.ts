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
import { execSync } from "child_process";
import { readFileSync } from "fs";
import { resolve } from "path";

import { errorOut, ERRORS } from "@/errors";
import { datadir, env, preprocessFunction } from "@/helper";
import Logger from "@/helper/Logger.class";
import type { CryptOpt } from "@/types";

import { lockAndRunOrReturn } from "../bridge.helper";
import { Bridge } from "../bridge.interface";
import { AVAILABLE_METHODS, METHOD_DETAILS, METHOD_T } from "./constants";
import { BCBPreprocessor } from "./preprocess";
import type { raw_T } from "./raw.type";

const { CC, LLC } = env;

const cwd = resolve(datadir, "llvm-bitcoin-core-bridge");

const filepathIR = resolve(cwd, "fucn2.ll");

const createExecOpts = () => {
  const c = { env, cwd, shell: "/usr/bin/bash" };
  c.env.CFLAGS = `-DUSE_ASM_X86_64 ${c.env.CFLAGS}`;
  return c;
};

export class llvm_BitcoinCoreBridge implements Bridge {
  public getCryptOptFunction(method: METHOD_T, _curve?: string): CryptOpt.Function {
    if (!(method in METHOD_DETAILS)) {
      throw new Error(`unsupported method '${method}'. Choose from ${AVAILABLE_METHODS.join(", ")}.`);
    }

    const raw = JSON.parse(readFileSync(resolve(cwd, "func2.json")).toString()) as Array<raw_T>;

    const found = raw.find(({ operation }) => operation == METHOD_DETAILS[method].name);

    if (!found) {
      throw new Error(
        `${METHOD_DETAILS[method].name} not found. TSNH. Available '#${raw.length}':${raw.map(
          ({ operation }) => operation,
        )}`,
      );
    }

    // raw preprocessing (i.e. llvm->fiat)
    const fiat = new BCBPreprocessor().preprocessRaw(found);

    // 'normal' preprocessing (fiat-> cryptopt)
    const cryptOpt = preprocessFunction(fiat);
    return cryptOpt;
  }

  public machinecode(filename: string, method: METHOD_T): string {
    if (!filename.endsWith(".so")) {
      throw Error(`filename must end with .so, but instead is '${filename}'`);
    }
    const opts = createExecOpts();

    // 1. Compile LLVM IR to Object File
    const objectFile = resolve(filename, "..", "temp.o"); // Create a temporary object file
    const compileIRCommand = `${LLC} ${filepathIR} -o ${objectFile}`;
    Logger.log(`Compiling LLVM IR to object file: ${compileIRCommand}`);
    try {
      execSync(compileIRCommand, opts);
    } catch (e) {
      errorOut(ERRORS.llvmIRCompilationFail);
    }

  
    // 2. Link Object File into Shared Object
    const linkCommand = `${CC} -shared -o ${filename} ${objectFile}`;
    Logger.log(`Linking object file into shared object: ${linkCommand}`);
    try {
      lockAndRunOrReturn(cwd, linkCommand, opts);
    } catch (e) {
      errorOut(ERRORS.linkingFail);
    }
  
    // Cleanup temporary files (optional)
    execSync(`rm ${objectFile}`, opts);
  
    return METHOD_DETAILS[method].name;
  }

  public argnumin(m: METHOD_T): number {
    switch (m) {
      case "square":
        return 1;

      case "mul":
        return 2;
    }
  }

  public argnumout(_m: METHOD_T): number {
    return 1;
  }

  public argwidth(_c: string, m: METHOD_T): number {
    switch (m) {
      case "mul":
      case "square":
        return 5;

      // case "scmul": // more like out:8, in0:8
      // case "reduce": // more like out:8, in0:4, in1:4
      // return 8;
    }
  }
  public bounds(_c: string, m: METHOD_T): CryptOpt.HexConstant[] {
    // from https://github.com/bitcoin-core/secp256k1/blob/423b6d19d373f1224fd671a982584d7e7900bc93/src/field_5x52_int128_impl.h#L162

    let bits = [] as number[]; // for field's
    if (m == "mul" || m == "square") {
      bits = [56, 56, 56, 56, 52]; // for field's
    }

    return bits.map((bitwidth) => {
      if (bitwidth % 4 !== 0) {
        throw new Error("unsuppoted bitwidth");
      }
      bitwidth /= 4;
      return `0x${Array(bitwidth).fill("f").join("")}` as CryptOpt.HexConstant;
    });
  }
}

// new BitcoinCoreBridge().getFiatFunction("square");



// import { cloneDeep,groupBy } from "lodash-es";

// import { matchArgPrefix } from "@/helper";
// import Logger from "@/helper/Logger.class";
// import type { Fiat } from "@/types";

// import { getArguments } from "./helpers";
// import type { raw_T, SSA } from "./raw.type";
// import {
//   transformAdd,
//   transformAnd,
//   transformAshr,
//   transformIcmp,
//   transformLshr,
//   transformMul,
//   transformOr,
//   transformShl,
//   transformTrunc,
//   transformXor,
//   transformZext,
// } from "./transformations";
// import type { Intermediate } from "./transformations/intermediate.type";
// import { zextR } from "./transformations/reducers";

// type A = Fiat.FiatFunction["arguments"][number];
// type R = Fiat.FiatFunction["returns"][number];
// type B = Fiat.FiatFunction["body"];

// export class BCBPreprocessor {
//   public preprocessRaw(raw: Readonly<raw_T>): Fiat.FiatFunction {
//     Logger.log(`BCB: preprocessRaw'ing ${raw.operation}`);
//     const fixed = this.fixArguments(raw);
//     let body = fixed.body;

//     const grouped = groupBy(raw.body, "operation");

//     const otherInstrs = Object.entries({
//       add: transformAdd,
//       and: transformAnd,
//       ashr: transformAshr,
//       lshr: transformLshr,
//       mul: transformMul,
//       or: transformOr,
//       xor: transformXor,
//       shl: transformShl,
//       trunc: transformTrunc,
//       zext: transformZext,
//       icmp: transformIcmp,
//     }).reduce((acc, [op, func]) => {
//       if (grouped[op]) {
//         acc.push(
//           ...grouped[op].map((i) => {
//             try {
//               return func(i);
//             } catch (e) {
//               console.error(JSON.stringify(i));
//               throw e;
//             }
//           }),
//         );
//       }
//       return acc;
//     }, [] as Intermediate[]);

//     body = body.concat(otherInstrs as Fiat.DynArgument[]);

//     body = zextR(body);

//     // fix up the x1=arg1 statements (we need them to resolve them, but not anymore)
//     body = body.filter(
//       (o) =>
//         !(o.arguments.length === 1 && typeof o.arguments[0] === "string" && matchArgPrefix(o.arguments[0])),
//     );
//     return {
//       operation: raw.operation,
//       arguments: fixed.args,
//       returns: fixed.returns,
//       body: body,
//     };
//   }

//   private fixArguments(raw: Readonly<raw_T>): {
//     args: A[];
//     returns: R[];
//     body: B;
//   } {
//     const args_ND = raw.arguments[0]
//       .split(",")
//       .filter((a) => a.length > 0)
//       .map((s) => s.trim())
//       .map((g) => ({
//         name: g.split(" ")[1],
//         datatype: g.split(" ")[0],
//       }));
  
//     // now rename them, make x, y to arg1, arg2 and add the required =-operations to the body
//     const body = [] as Fiat.DynArgument[];
//     const args: A[] = args_ND.reduce((acc, arg, i) => {
//       const expectedXdd = `%${arg.name}` as Fiat.VarName;
//       const desiredArgN = `arg${i + 1}` as Fiat.ArgName;
//       body.push({
//         name: [expectedXdd],
//         datatype: "u64",
//         operation: "=",
//         arguments: [desiredArgN],
//       });
//       acc.push({
//         name: desiredArgN,
//         datatype: "u64",
//         lbound: "0x0" as Fiat.HexConstant,
//         ubound: "0xffffffffffffffff" as Fiat.HexConstant,
//       });
//       return acc;
//     }, [] as A[]);
  
//     const returns = [] as R[];
//     if (raw.returns[0].name == "%x0" as Fiat.VarName) {
//       returns.push({
//         name: "out1",
//         datatype: "u64",
//         lbound: "0x0" as Fiat.HexConstant,
//         ubound: "0xffffffffffffffff" as Fiat.HexConstant,
//       });
//       body.push({
//         name: ["%x0"],
//         datatype: "u64",
//         operation: "=",
//         arguments: ["out1"] as unknown as Fiat.Argument[],
//       });
//     }
//     return {
//       args,
//       body,
//       returns,
//     };
//   }
// }
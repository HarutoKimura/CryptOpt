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
import { llvmBCBPreprocessor } from "./preprocess";
import type { raw_T } from "./raw.type";

const cwd = resolve(datadir, "llvm-bitcoin-core-bridge");

const createExecOpts = () => {
  const c = { env, cwd, shell: "/usr/bin/bash" };
  c.env.CFLAGS = `-DUSE_ASM_X86_64 ${c.env.CFLAGS}`;
  return c;
};

export class llvm_BitcoinCoreBridge implements Bridge {
  public getCryptOptFunction(method: METHOD_T, _curve?: string): CryptOpt.Function {
    console.log('Entering getCryptOptFunction', { method, _curve });
    if (!(method in METHOD_DETAILS)) {
      throw new Error(`unsupported method '${method}'. Choose from ${AVAILABLE_METHODS.join(", ")}.`);
    }

    const raw = JSON.parse(readFileSync(resolve(cwd, "field_wrapp_test2.json")).toString()) as Array<raw_T>;
    //const raw = JSON.parse(readFileSync("/home/harutok/CryptOpt/src/bridge/bitcoin-core-bridge/data/field.json").toString()) as Array<raw_T>;
    console.log("Input Json file", raw);

    //  "operation": "secp256k1_fe_mul_inner" would be the name of the function
    //  if that operation is found in the raw json file, then we can proceed
    const found = raw.find(({ operation }) => operation == METHOD_DETAILS[method].name);
    console.log("Found", found);

    if (!found) {
      throw new Error(
        `${METHOD_DETAILS[method].name} not found. TSNH. Available '#${raw.length}':${raw.map(
          ({ operation }) => operation,
        )}`,
      );
    }

    console.log("before preprocessRaw", found);
    // raw preprocessing (i.e. llvm->fiat)
    // input the raw json file to preprocessRaw and output the fiat json file.
    const fiat = new llvmBCBPreprocessor().preprocessRaw(found);
    console.log("after preprocessRaw", fiat);

    // 'normal' preprocessing (fiat-> cryptopt)
    const cryptOpt = preprocessFunction(fiat);
    return cryptOpt;
  }

  public machinecode(filename: string, method: METHOD_T): string {
    if (!filename.endsWith(".so")) {
      throw Error(`filename must end with .so, but instead is '${filename}'`);
    }
  
    const opts = createExecOpts();
    const llvmFile = filename.replace(".so", ".ll");
  
    try {
      // So far, I generated the shared object file from the LLVM-IR file direclty. I don't need to generate the LLVM-IR file.
      // Generate LLVM IR file
      // const llvmCommand = `make -C ${cwd} ${llvmFile}`;
      // Logger.log(`cmd to generate LLVM IR: ${llvmCommand} w opts: ${JSON.stringify(opts)}`);
      // lockAndRunOrReturn(cwd, llvmCommand, opts);
  
      // Generate shared object file
      const soCommand = `make -C ${cwd} ${filename}`;
      Logger.log(`cmd to generate shared object file: ${soCommand} w opts: ${JSON.stringify(opts)}`);
      execSync(soCommand, opts);
    } catch (e) {
      errorOut(ERRORS.bcbMakeFail);
    }
  
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

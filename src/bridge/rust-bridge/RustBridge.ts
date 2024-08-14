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
import { readFileSync, existsSync } from "fs";
import { resolve } from "path";

import { errorOut, ERRORS } from "@/errors";
import { datadir, env, preprocessFunction } from "@/helper";
import Logger from "@/helper/Logger.class";
import type { CryptOpt } from "@/types";

import { lockAndRunOrReturn } from "../bridge.helper";
import { Bridge } from "../bridge.interface";
import { AVAILABLE_METHODS, METHOD_DETAILS, METHOD_T } from "./constants";
import { RustPreprocessor } from "./preprocess";
import type { raw_T } from "./raw.type";
import { lock } from "proper-lockfile";

const cwd = resolve(datadir, "rust-bridge");

// so far there are only two json files: demangled_field_mul.json and demangled_field_sqr.json
const target_json = "demangled_bls12_mul.json";

const createExecOpts = () => {
  const c = { env, cwd, shell: "/usr/bin/bash" };
  c.env.CFLAGS = `-DUSE_ASM_X86_64 ${c.env.CFLAGS}`;
  return c;
};

export class RustBridge implements Bridge {
  private getTargetName(method: METHOD_T): string {

    const methodToTarget = {
      mul: 'bls12_mul',
      square: 'bls12_square',
    };
    return methodToTarget[method];
  }

  private generateJsonFile(method: METHOD_T): void {
    const targetName = this.getTargetName(method);
    const jsonFileName = `demangled_${targetName}.json`;
    const jsonFilePath = resolve(cwd, jsonFileName);

    if (!existsSync(jsonFilePath)) {
      console.log(`Generating ${jsonFileName}...`);
      try {
        execSync(`make -C ${cwd} TARGET_NAME=${targetName} ${jsonFileName}`, {
          stdio: 'inherit',
          env: { ...process.env, CFLAGS: `-DUSE_ASM_X86_64 ${process.env.CFLAGS || ''}` }
        });
      } catch (error) {
        console.error(`Error generating ${jsonFileName}:`, error);
        throw error;
      }
    }
  }


  public getCryptOptFunction(method: METHOD_T, _curve?: string): CryptOpt.Function {
    console.log('Entering getCryptOptFunction', { method, _curve });
    if (!(method in METHOD_DETAILS)) {
      throw new Error(`unsupported method '${method}'. Choose from ${AVAILABLE_METHODS.join(", ")}.`);
    }

    this.generateJsonFile(method);

    const targetName = this.getTargetName(method);
    const target_json = `demangled_${targetName}.json`;
    const raw = JSON.parse(readFileSync(resolve(cwd, target_json)).toString()) as Array<raw_T>;
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
    const fiat = new RustPreprocessor().preprocessRaw(found);
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
    const command = `make -C ${cwd} all`; // to get LLVM-IR file
    Logger.log(`cmd to generate machinecode: ${command} w opts: ${JSON.stringify(opts)}`);
    const targetName = this.getTargetName(method);
    try {
  
      lockAndRunOrReturn(cwd, command, opts);
      // Generate shared object file
      const soCommand = `make -C ${cwd} TARGET_NAME=${targetName} ${filename}`;
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
        return 6;
      case "square":
        return 6;

      // case "scmul": // more like out:8, in0:8
      // case "reduce": // more like out:8, in0:4, in1:4
      // return 8;
    }
  }
  public bounds(_c: string, m: METHOD_T): CryptOpt.HexConstant[] {
    // from https://github.com/bitcoin-core/secp256k1/blob/423b6d19d373f1224fd671a982584d7e7900bc93/src/field_5x52_int128_impl.h#L162

    let bits = [] as number[]; // for field's
    if (m == "mul" || m == "square") {
      bits = [64,64,64,64,64,64]; // for field's
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

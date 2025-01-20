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
import { RUST_AVAILABLE_METHODS, RUST_AVAILABLE_CURVES, METHOD_T, CURVE_T, RUST_CURVE_DETAILS, RUST_SYMBOLS} from "./constants";
import { RustPreprocessor } from "./preprocess";
import type { raw_T } from "./raw.type";
import { lock } from "proper-lockfile";

const cwd = resolve(datadir, "rust-bridge");

const createExecOpts = () => {
  const c = { env, cwd, shell: "/usr/bin/bash" };
  c.env.RUSTC = `-DUSE_ASM_X86_64 ${c.env.RUSTC}`;
  return c;
};

export class RustBridge implements Bridge {

  public getCryptOptFunction(method: METHOD_T, curve: CURVE_T): CryptOpt.Function {
    // Some basic checks
    if (!RUST_AVAILABLE_METHODS.includes(method)) {
      throw new Error(`unsupported method '${method}'. Choose from ${RUST_AVAILABLE_METHODS.join(", ")}.`);
    }
    if (!RUST_AVAILABLE_CURVES.includes(curve)) {
      throw new Error(`unsupported curve '${curve}'. Choose from ${RUST_AVAILABLE_CURVES.join(", ")}`);
    }

    // 1) figure out which JSON file to read
    const { rustFnName, jsonFile } = RUST_SYMBOLS[curve][method];
    const fullPath = resolve(cwd, jsonFile);

    // 2) Possibly generate the .json file if it doesn't exist:
    if (!existsSync(fullPath)) {
      // call `make -C ...` or whatever we do to generate it
      const makeCmd = `make -C ${cwd} CURVE=${curve} METHOD=${method} JSON=${jsonFile}`;
      Logger.log(`Generating JSON via: ${makeCmd}`);
      lockAndRunOrReturn(fullPath, makeCmd, { shell: "/usr/bin/bash", env });
    }

    // 3) read the file
    const rawAll = JSON.parse(readFileSync(fullPath, "utf8")) as raw_T[];
    // find the block that has "operation" == rustFnName
    const found = rawAll.find(({ operation }) => operation === rustFnName);
    if (!found) {
      throw new Error(
        `Operation '${rustFnName}' not found in '${jsonFile}'. We have: ${rawAll.map((x) => x.operation)}`,
      );
    }

    // 4) run our "RustPreprocessor", turning that single raw block → "Fiat JSON"
    const fiat = new RustPreprocessor().preprocessRaw(found);

    // 5) run the "Fiat → CryptOpt" pass
    const cryptOpt = preprocessFunction(fiat);
    return cryptOpt;
  }



  public machinecode(filename: string, method: METHOD_T, curve: CURVE_T): string {
    if (!filename.endsWith(".so")) {
      throw Error(`filename must end with .asm, but instead is '${filename}'`);
    }

    console.log(`Generating machinecode for ${method}...`);
  

    const opts = createExecOpts();

    console.log(`opts: ${JSON.stringify(opts)}`);

    const command = `make -C ${cwd} all`; // to get LLVM-IR file

    const { rustFnName } = RUST_SYMBOLS[curve][method];

    console.log(`cmd to generate machinecode: ${command} w opts: ${JSON.stringify(opts)}`);
    Logger.log(`cmd to generate machinecode: ${command} w opts: ${JSON.stringify(opts)}`);
    try {
  
      lockAndRunOrReturn(cwd, command, opts);
      // Generate shared object file
      const soCommand = `make -C ${cwd} TARGET_NAME=${rustFnName} ${filename}`;
      console.log(`cmd to generate shared object file: ${soCommand} w opts: ${JSON.stringify(opts)}`);
      Logger.log(`cmd to generate shared object file: ${soCommand} w opts: ${JSON.stringify(opts)}`);
      execSync(soCommand, opts);
      console.log(`Shared object file generated: ${filename}`);
    } catch (e) {
      console.log(`Error generating machinecode: ${e}`);
      errorOut(ERRORS.bcbMakeFail);
    }
  
    return rustFnName;
  }

  public argnumin(m: METHOD_T): number {
    return m === "square" ? 1 : 2;
  }

  public argnumout(_m: METHOD_T): number {
    return 1;
  }

  /**
   * Looks up the curve details in our RUST_CURVE_DETAILS. 
   * Just like FiatBridge.
   */
  public argwidth(curve: CURVE_T, _method: METHOD_T): number {
    return RUST_CURVE_DETAILS[curve].argwidth;
  }

  public bounds(curve: CURVE_T, _method: METHOD_T): CryptOpt.HexConstant[] {
    return RUST_CURVE_DETAILS[curve].bounds as CryptOpt.HexConstant[];
  }
}
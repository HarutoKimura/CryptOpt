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
import { RUST_AVAILABLE_METHODS, RUST_AVAILABLE_CURVES, METHOD_T, CURVE_T, RUST_CURVE_DETAILS, RUST_SYMBOLS, AVAILABLE_LANGUAGES, LANGUAGE_T} from "./constants";
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
  private language: LANGUAGE_T;

  constructor(language: LANGUAGE_T = "rust") {
    if (!AVAILABLE_LANGUAGES.includes(language)) {
      throw new Error(`Unsupported language '${language}'. Choose from ${AVAILABLE_LANGUAGES.join(", ")}.`);
    }
    this.language = language;
  }

  public getCryptOptFunction(method: METHOD_T, curve: CURVE_T): CryptOpt.Function {
    // Some basic checks
    if (!RUST_AVAILABLE_METHODS.includes(method)) {
      throw new Error(`unsupported method '${method}'. Choose from ${RUST_AVAILABLE_METHODS.join(", ")}.`);
    }
    if (!RUST_AVAILABLE_CURVES.includes(curve)) {
      throw new Error(`unsupported curve '${curve}'. Choose from ${RUST_AVAILABLE_CURVES.join(", ")}`);
    }

    // 1) figure out which JSON file to read
    const { fnName, jsonFile } = RUST_SYMBOLS[curve][method][this.language];
    const fullPath = resolve(cwd, jsonFile);

    // 2) Possibly generate the .json file if it doesn't exist:
    if (!existsSync(fullPath)) {
      // call `make -C ...` or whatever we do to generate it
      const makeCmd = `make -C ${cwd} CURVE=${curve} METHOD=${method} JSON=${jsonFile} LANGUAGE=${this.language}`;
      Logger.log(`Generating JSON via: ${makeCmd}`);
      lockAndRunOrReturn(fullPath, makeCmd, { shell: "/usr/bin/bash", env });
    }

    // 3) read the file
    const rawAll = JSON.parse(readFileSync(fullPath, "utf8")) as raw_T[];
    
    // Special handling for different curve types
    let found: raw_T | undefined;
    
    if (curve === "curve25519_dalek") {
      // For curve25519_dalek, we might need to find a specific function name pattern
      found = rawAll.find(({ operation }) => operation === fnName || operation.includes(fnName));
    } else if (curve === "secp256k1_ec") {
      // For secp256k1_ec, there might be special handling required
      found = rawAll.find(({ operation }) => operation === fnName || operation.includes("secp256k1") && operation.includes(method));
    } else {
      // Standard handling for other curves
      found = rawAll.find(({ operation }) => operation === fnName);
    }
    
    if (!found) {
      throw new Error(
        `Operation '${fnName}' not found in '${jsonFile}'. We have: ${rawAll.map((x) => x.operation)}`,
      );
    }

    // 4) run our "RustPreprocessor", turning that single raw block → "Fiat JSON"
    const fiat = new RustPreprocessor().preprocessRaw(found);

    console.log(`Fiat-like IR: ${JSON.stringify(fiat)}`);

    // 5) run the "Fiat → CryptOpt" pass
    const cryptOpt = preprocessFunction(fiat);
    console.log(`cryptOpt IR: ${JSON.stringify(cryptOpt)}`);
    return cryptOpt;
  }

  public machinecode(filename: string, method: METHOD_T, curve: CURVE_T): string {
    if (!filename.endsWith(".so")) {
      throw Error(`filename must end with .so, but instead is '${filename}'`);
    }

    const { fnName } = RUST_SYMBOLS[curve][method][this.language];
    
    console.log(`Generating machinecode for ${method} (${fnName}) using ${this.language}...`);

    const opts = createExecOpts();

    console.log(`Working directory: ${cwd}`);
    
    // Check if source files exist
    const sourceExt = this.language === "rust" ? ".rs" : ".c";
    let sourceFile = `${fnName}${sourceExt}`;
    
    // Special handling for curve25519_dalek and secp256k1_ec
    if (curve === "curve25519_dalek" && !existsSync(resolve(cwd, sourceFile))) {
      if (method === "mul") {
        sourceFile = `curve25519_dalek_u64_mul${sourceExt}`;
      } else if (method === "square") {
        sourceFile = `curve25519_dalek_u64_square${sourceExt}`;
      }
    }
    
    const sourceFilePath = resolve(cwd, sourceFile);
    
    console.log(`Looking for source file: ${sourceFilePath}`);
    if (!existsSync(sourceFilePath)) {
      console.error(`Source file ${sourceFilePath} not found. Please make sure it exists.`);
    } else {
      console.log(`Source file found: ${sourceFilePath}`);
    }

    // Command to initialize environment
    const command = `make -C ${cwd} all LANGUAGE=${this.language}`; 

    console.log(`cmd to generate machinecode: ${command} w opts: ${JSON.stringify(opts)}`);
    Logger.log(`cmd to generate machinecode: ${command} w opts: ${JSON.stringify(opts)}`);
    
    try {
      lockAndRunOrReturn(cwd, command, opts);
      
      // Generate shared object file with the correct source file name
      const actualTargetName = sourceFile.replace(sourceExt, "");
      const soCommand = `make -C ${cwd} TARGET_NAME=${actualTargetName} ${filename} LANGUAGE=${this.language}`;
      
      console.log(`cmd to generate shared object file: ${soCommand} w opts: ${JSON.stringify(opts)}`);
      Logger.log(`cmd to generate shared object file: ${soCommand} w opts: ${JSON.stringify(opts)}`);
      execSync(soCommand, opts);
      console.log(`Shared object file generated: ${filename}`);
    } catch (e) {
      console.log(`Error generating machinecode: ${e}`);
      console.error(`Failed to compile ${fnName} with language ${this.language}`);
      errorOut(ERRORS.bcbMakeFail);
    }
  
    return fnName;
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

  public setLanguage(language: LANGUAGE_T): void {
    if (!AVAILABLE_LANGUAGES.includes(language)) {
      throw new Error(`Unsupported language '${language}'. Choose from ${AVAILABLE_LANGUAGES.join(", ")}.`);
    }
    this.language = language;
  }

  public getLanguage(): LANGUAGE_T {
    return this.language;
  }
}
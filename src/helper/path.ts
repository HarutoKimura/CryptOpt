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

import { existsSync, mkdirSync } from "fs";
import { resolve } from "path";

import Logger from "@/helper/Logger.class";
import type { OptimizerArgs } from "@/types";

import { padSeed } from "./lamdas";

export function generateResultFilename(
  {
    resultDir,
    bridge,
    seed,
    symbolname,
    totalEvals,
    scheduleRatio,
  }: Pick<OptimizerArgs, "resultDir" | "bridge" | "seed" | "totalEvals"> & {
    symbolname: string;
    scheduleRatio?: number;
  },
  suff = [".json"],
): string[] {
  // Build path: resultDir/bridge/symbolname/evals_X/p_X_d_Y
  let path =
    resultDir && resultDir !== ""
      ? resolve(resultDir, bridge, symbolname)
      : resolve(`${process.cwd()}/results`, bridge, symbolname);

  // Add evals subfolder if provided (uses original totalEvals, not phase-specific evals)
  if (totalEvals) {
    path = resolve(path, `evals_${totalEvals}`);
  }

  // Add ratio subfolder if scheduleRatio is provided
  if (scheduleRatio !== undefined) {
    path = resolve(path, `p_${scheduleRatio}_d_${100 - scheduleRatio}`);
  }

  if (!existsSync(path)) {
    Logger.log(`${path} does not exist. Trying to create it.`);
    try {
      mkdirSync(path, { recursive: true });
    } catch (e) {
      const msg = `${path} does not exist. And could not be created due to Error:${e}. Create that folder manually and re-run. Exiting.`;
      console.error(msg);
      process.exit(2);
    }
  }

  const padded = padSeed(seed);
  return suff.map((s) => resolve(path, `seed${padded}${s}`).toString());
}

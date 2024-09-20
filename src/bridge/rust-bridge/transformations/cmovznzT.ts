import type { CryptOpt } from "@/types";

import { getScalarsAndImmMappedAsConstArg } from "../helpers";
import type { SSA } from "../raw.type";
import type { Intermediate } from "./intermediate.type";

export function transformCmovznz(input: SSA): Intermediate {
  if (input.operation !== "cmovznz") {
    throw new Error("unsupported operation while transformAnd.");
  }


  const args = getScalarsAndImmMappedAsConstArg(input.arguments);

  return {
    name: input.name,
    datatype: "u64", // so far the data type is always i64 in the cmovznz operation so I changed to u64
    operation: "cmovznz",
    arguments: [
      ...args,
    ],
  };
}
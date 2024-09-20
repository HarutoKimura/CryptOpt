import { getScalarsAndImmMappedAsConstArgForSub } from "../helpers";
import type { SSA } from "../raw.type";
import type { Intermediate } from "./intermediate.type";

export function transformSub(input: SSA): Intermediate {
  if (input.operation !== "sub") {
    throw new Error("unsupported operation while transform sub.");
  }
  if (!["i128", "i64"].includes(input.datatype)) {
    throw new Error("unsupported datatype while transform sub.");
  }

  const args = getScalarsAndImmMappedAsConstArgForSub(input.arguments);

  return {
    name: input.name,
    datatype: input.datatype == "i128" ? "u128" : "u64",
    operation: "-",
    arguments: args,
  };
}

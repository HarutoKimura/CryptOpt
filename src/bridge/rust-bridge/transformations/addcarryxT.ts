import { getScalarsAndImmMappedAsConstArg } from "../helpers";
import type { SSA } from "../raw.type";
import type { Intermediate } from "./intermediate.type";

export function transformAddcarryx(input: SSA): Intermediate {
  if (input.operation !== "addcarryx") {
    throw new Error("unsupported operation while transform addcarryx.");
  }
  if (!["i64"].includes(input.datatype)) {
    throw new Error("unsupported datatype while transform addcarryx.");
  }

  const args = getScalarsAndImmMappedAsConstArg(input.arguments);

  return {
    name: input.name,
    datatype: "u64",
    operation: "addcarryx",
    arguments: args,
  };
}

import { getScalarsAndImmMappedAsConstArg } from "../helpers";
import type { SSA } from "../raw.type";
import type { Intermediate } from "./intermediate.type";

export function transformSub(input: SSA): Intermediate {
  if (input.operation !== "sub") {
    throw new Error("unsupported operation while transform sub.");
  }
  if (!["i128", "i64", "i8"].includes(input.datatype)) {
    throw new Error("unsupported datatype while transform sub.");
  }

  const args = getScalarsAndImmMappedAsConstArg(input.arguments);

  // rust_fiat_p224_mul uses i8, i64 and i128
  if (input.datatype === "i8") { // after that i8 is zero extended to i128 so we can specify u64 first
    return {
      name: input.name,
      datatype: "u64",
      operation: "-",
      arguments: args,
    };
  }

  else if (input.datatype === "i128") {
    return {
      name: input.name,
      datatype: "u128",
      operation: "-",
      arguments: args,
    };
  }
  else { //i64 case
    return {
      name: input.name,
      datatype: "u64",
      operation: "-",
      arguments: args,
    };
  }
}
  // rust_fiat_p224_mul uses i8, i64 and i128

//   return {
//     name: input.name,
//     datatype: input.datatype,
//     operation: "-",
//     arguments: args,
//   };
// 

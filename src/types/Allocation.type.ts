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

import { AllocationFlags, ByteRegister, Flags, Register, XmmRegister } from "@/enums";

import type { imm, mem } from "./Storage.type";

export interface AllocationReq {
  oReg: string[];
  in: string[]; // if nothing needs to be read, this is an empty array
  allocationFlags?: AllocationFlags;
}
export interface AllocationRes {
  oReg: Register[];
  in: Array<XmmRegister | Register | mem | imm | Flags>;
}

/*u1*/
export type U1MemoryAllocation = {
  datatype: "u1";
  store: mem;
};
export type U1RegisterAllocation = {
  datatype: "u1";
  store: ByteRegister;
};
export type U1FlagAllocation = {
  datatype: "u1";
  store: Flags;
};
export type U1XmmRegisterAllocation = {
  datatype: "u1";
  store: XmmRegister;
};

/*u64*/
export type U64MemoryAllocation = {
  datatype: "u64";
  store: mem;
};

export type U64RegisterAllocation = {
  datatype: "u64";
  store: Register;
};

export type U64XmmRegisterAllocation = {
  datatype: "u64";
  store: XmmRegister;
};

export type U1Allocation =
  | U1MemoryAllocation
  | U1RegisterAllocation
  | U1XmmRegisterAllocation
  | U1FlagAllocation;
export type U64Allocation = U64MemoryAllocation | U64RegisterAllocation | U64XmmRegisterAllocation;
export type U128Allocation = { datatype: "u128"; store?: undefined };
export type MemoryAllocation = U1MemoryAllocation | U64MemoryAllocation;
export type RegisterAllocation = U1RegisterAllocation | U64RegisterAllocation;
export type PointerAllocation = {
  datatype: string; // "u64[]";
  store: mem | Register;
};
export type ValueAllocation = U1Allocation | U64Allocation;
// probably add auto as store mem as well
export type Allocation = ValueAllocation | PointerAllocation | U128Allocation;
export type Allocations = { [key: string]: Allocation };

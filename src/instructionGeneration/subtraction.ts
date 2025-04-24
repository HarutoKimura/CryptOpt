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

import { Flags, FlagState, ByteRegister, Register } from "@/enums";
import { getByteRegFromQwReg, isByteRegister, isRegister, isImm, isMem, isSafeImm32, limbify, delimbify, TEMP_VARNAME } from "@/helper";
import { Model } from "@/model";
import { Paul } from "@/paul";
import { RegisterAllocator } from "@/registerAllocator";
import type { asm, CryptOpt } from "@/types";
import { s } from "vitest/dist/reporters-5f784f42";
import { registerConsoleShortcuts } from "vitest/node";

export function sub(c: CryptOpt.StringOperation): asm[] {
  if (c.datatype === "u64") {
    return sub64(c);
  } else if (c.datatype === "u128") {
    return sub128(c);
  } else {
    throw new Error("Unsupported datatype. Abort.");
  }
}


function sub128(c: CryptOpt.StringOperation): asm[] {

    const [collector, ...tail] = c.arguments;

    const [resLo, resHi] = limbify(c.name);
    // console.log("resLo: ", resLo);
    // console.log("resHi: ", resHi);
    if (!resHi){
      throw new Error("resHi is undefined. Abort.");
    }

    const ra = RegisterAllocator.getInstance();
    // console.log("ra: ", ra);

    function zeroIfNotAllocced<T extends CryptOpt.ArgumentWithStringArguments["arguments"][number]>([lo, hi]: [
      T,
      T?,
    ]): [T, T | CryptOpt.HexConstant] {
      if (!hi) {
        throw Error("unexpected call from zeroIfNotAllocced");
      }
      const allocs = ra.getCurrentAllocations();
      const d_lo = delimbify(lo) as T;

      if (allocs[d_lo]?.datatype == "u64") {
        // console.log("yes 1");
        // if lo is alloced as u64
        return [lo, "0x0"];
      }
      if (allocs[d_lo] && allocs[lo] && allocs[hi]) {
        // console.log("yes 2");
        // if hi+lo and delimbified is alloced
        return [lo, hi];
      }
      if (allocs[d_lo]?.datatype == "u128" && allocs[lo]) {
        // console.log("yes 3");
        // console.log("lo: ", lo);
        // console.log("allocs: ", allocs);
        // u128 is alloced and lo, but not hi (otherwise we woulnt be here)
        // this is if we add u128 to a u128 (which has been zext'ed)(lo is alloced but hi is not)
        return [lo, "0x0"];
      }
      // now it SHOULD not be a u128 anymore.
      if (allocs[d_lo]?.datatype == "u128") {
        // console.log("yes 4");
        console.warn(ra.getCurrentAllocations());
        throw new Error(`${d_lo} is alloced as u128 but neither lo+hi nor lo is. TSNH.`);
      }
      // now it CANNOT be a u128 anymore, thus return a u64
      return [d_lo, "0x0"];
    }

    const alloclist = ra.getCurrentAllocations();

    let arg1Lo = c.arguments[0];
    let arg1Hi: CryptOpt.ConstArgument = "0x0";  
    // console.log("datatype check arg0: ", alloclist[c.arguments[0]]?.datatype);


    if (alloclist[c.arguments[0]]?.datatype == "u128"){
      // console.log("yes 5");
      [arg1Lo, arg1Hi] = zeroIfNotAllocced(limbify(c.arguments[0]));
      // console.log("arg1Lo: ", arg1Lo);
      // console.log("arg1Hi: ", arg1Hi);
    } else {
      arg1Lo = c.arguments[0];
      arg1Hi = "0x0";
    }

    // console.log("arg1Lo: ", arg1Lo);
    // console.log("arg1Hi: ", arg1Hi);

    Model.hardDependencies.add(arg1Lo);
    const  all = tail.reduce((acc, summand) => {

    let arg2Lo = summand;
    let arg2Hi: CryptOpt.ConstArgument = "0x0";


    const alloclist2 = ra.getCurrentAllocations();
    // console.log("alloclist2: ", alloclist2);  

    if (alloclist[c.arguments[1]]?.datatype == "u128") {
      [arg2Lo, arg2Hi] = zeroIfNotAllocced(limbify(summand));
    }else {
      arg2Lo = summand;
      arg2Hi = "0x0";
    }

    // console.log("arg2Lo: ", arg2Lo);
    // console.log("arg2Hi: ", arg2Hi);

    if (!arg1Hi || !arg2Hi){
      throw new Error("arg1Hi or arg2Hi is undefined. Abort.");
    }

    // Pattern 1: Both high bits are zero
    if (arg1Hi === "0x0" && arg2Hi === "0x0") {
      // Single subtraction with borrow out to handle carry to high word
      // u128 = u64 - u64
      const cLo: CryptOpt.StringOperation = {
        name: [resLo, resHi], // Store result and borrow
        arguments: ["0x0", arg1Lo, arg2Lo],
        operation: "subborrowx",
        datatype: "u64",
        decisions: c.decisions,
        decisionsHot: c.decisionsHot,
      };
      Paul.currentInstruction = cLo;

      // console.log("cLo: ", cLo);
      
      const asmlo = sub(cLo);
      console.log("sub cLo-1: ", cLo); 
      console.log("sub asmlo-1: ", asmlo);
      // console.log("asmlo: ", asmlo);
      // console.log("cLo done");
      asmlo.unshift(...RegisterAllocator.getInstance().pres);
      // //and now, since the destination is a u128, we want to set the carry to a u64
      ra.loadVarToReg(resHi, "movzx");
      // asmlo.push(...RegisterAllocator.getInstance().pres);
      asmlo.push(`;; spill ${resHi} to reg, that would case slower performance.`);
      asmlo.push(";;;done with asmlo, there is no asmhi");
      acc.push(...asmlo);

      return acc;
    }

    // otherwise, (i.e. there is at least one hi limb)
    // we need at least two addition ops:
    // the first one, is cLo, saving the intermediate hi-limb in TEMP_VARNAME

    const cLo: CryptOpt.StringOperation = {
      name: [resLo, TEMP_VARNAME],
      arguments: ["0x0", arg1Lo, arg2Lo],
      operation: "subborrowx",
      datatype: "u64",
      decisions: c.decisions,
      decisionsHot: c.decisionsHot,
    };
    Paul.currentInstruction = cLo;

    const asmlo = sub64(cLo);
    console.log("sub cLo-2: ", cLo);
    console.log("sub asmlo-2: ", asmlo);
    asmlo.unshift(...RegisterAllocator.getInstance().pres);
    asmlo.push(";;;done with asmlo");

    acc.push(...asmlo);

    // if there is two hi-limbs
    if (arg1Hi !== "0x0" && arg2Hi !== "0x0") {
      const cHi: CryptOpt.StringOperation = {
        name: [resHi, "_"],
        arguments: [TEMP_VARNAME, arg1Hi, arg2Hi],
        operation: "subborrowx",
        datatype: "u64",
        decisions: c.decisions,
        decisionsHot: c.decisionsHot,
      };
      Paul.currentInstruction = cHi;
      const asmhi = sub64(cHi);
      console.log("sub cHi-1: ", cHi);
      console.log("sub asmhi-1: ", asmhi);
      asmhi.unshift(...RegisterAllocator.getInstance().pres);
      asmhi.push(";;;done with asmhi-1");
      acc.push(...asmhi);
      return acc;
    }
    // there is only one hi-limb
    const hi = [arg1Hi, arg2Hi].find((h) => h !== "0x0");

    if (!hi) {
      throw new Error("Corrupt flow. Either A or B should be 0x0 at this point.");
    }

    const cHi: CryptOpt.StringOperation = {
      name: [resHi],
      arguments: [TEMP_VARNAME, hi as CryptOpt.ConstArgument],
      operation: "-",
      datatype: "u64",
      decisions: c.decisions,
      decisionsHot: c.decisionsHot,
    };
    Paul.currentInstruction = cHi;
    console.log("sub cHi-2: ", cHi);
    const asmhi = sub64(cHi);
    console.log("sub asmhi-2: ", asmhi);
    asmhi.unshift(...RegisterAllocator.getInstance().pres);
    asmhi.push(";done with asmhi-2");
    acc.push(...asmhi);

    return acc;
  }, [] as string[]);

  Model.hardDependencies.clear();
  ra.declare128(c.name[0]);
  return all;
}

function sub64(c: CryptOpt.StringOperation): asm[] {
  console.log("sub64 c: ", c);
if (c.datatype !== "u64") {
  throw new Error(" op - is only supported, if datatype is u64. Abort.");
}

if (c.operation === "-") {
  if (c.name.length != 1) {
    throw new Error(`- needs one name-symbol. It has not. Abort.`);
  }
  if (c.arguments.length != 2) {
    throw new Error(`- needs two arguments-symbol. It has not. Abort.`);
  }
}

if (c.operation === "subborrowx") {
  if (c.name.length != 2) {
    throw new Error(`Subborrowx needs two name-symbols. It has not. Abort.`);
  }
  if (c.arguments.length != 3) {
    throw new Error(`- needs three arguments-symbol. It has not. Abort.`);
  }
}


// static void fiat_p384_subborrowx_u64(uint64_t* out1, fiat_p384_uint1* out2, fiat_p384_uint1 arg1, uint64_t arg2, uint64_t arg3) {
//   x1 = ((arg2 - (fiat_p384_int128)arg1) - arg3);
//   *out1 = (uint64_t)(x1 & UINT64_C(0xffffffffffffffff));
//   *out2 = (fiat_p384_uint1)(0x0 - (fiat_p384_int1)(x1 >> 64));
//   sub arg2, arg1
//   sbb arg2, arg3
// }
// u64l = ((arg2 - (fiat_p256_int128)arg1) - arg3);
// carryu1 = -CF
// uint64_t u64lo = (uint64_t)(x1 & UINT64_C(0xffffffffffffffff));
// minuend − subtrahend = difference Example: in 8 − 3 = 5, 8 is the minuend.
//

const [resVarname, carryoutVarname] = c.operation == "subborrowx" ? c.name : [c.name[0], "_"];
console.log("resVarname: ", resVarname);
console.log("carryoutVarname: ", carryoutVarname);
const [carryinVarname, minuendVarname, subtrahend] =
  c.operation == "subborrowx" ? c.arguments : (["0x0", ...c.arguments] as string[]);
console.log("carryinVarname: ", carryinVarname);
console.log("minuendVarname: ", minuendVarname);
console.log("subtrahend: ", subtrahend);

const ra = RegisterAllocator.getInstance();
ra.spillFlag(Flags.OF); // because they will be destroyed after in any case.
ra.spillFlag(Flags.CF);

// const minuend = ra.getCurrentAllocations()[minuendVarname];
// if (!minuend) {
//   throw new Error(`Minuend ${minuendVarname} is not allocated. Abort.`);
// }
// const subtrahendAlloc = ra.getCurrentAllocations()[subtrahend];

// console.log("minuend: ", minuend);
// console.log("subtrahendAlloc: ", subtrahendAlloc);

// if (minuendVarname === "0x0" && subtrahendAlloc?.datatype === "u1" ){
//   ra.loadVarToReg(subtrahend);
// }

let instr: "sub" | "sbb";
if (carryinVarname === "0x0") {
  instr = "sub";
} else {
  // we do have a carry in
  instr = "sbb";

  // if cin is not in CF, mov to CF

  const allocations = ra.getCurrentAllocations();
  let cin = allocations[carryinVarname]?.store;

  if (cin == Flags.OF) {
    cin = ra.loadVarToReg(carryinVarname);
    allocations[carryinVarname].store = cin;
  }

  if (cin !== Flags.CF) {
    ra.spillFlag(Flags.CF); // if there was one before, should be saved

    // load cin to CF
    const r = ra.loadImmToReg64("-0x1");

    if (isMem(cin)) {
      ra.addToPreInstructions(`add ${getByteRegFromQwReg(r)}, byte ${cin}; load to CF<-${carryinVarname}`);
    } else if (isByteRegister(cin)) {
      ra.addToPreInstructions(`add ${getByteRegFromQwReg(r)}, ${cin}; load to CF<-${carryinVarname}`);
    } else {
      ra.addToPreInstructions(`add ${r}, ${cin}; load to CF<-${carryinVarname}`);
    }
    ra.declareHavoc(r);
  }
}

// MINUEND MUST BE IN REGISTER
if (isImm(minuendVarname)) {
  ra.loadImmToReg64(minuendVarname);
} else {
  ra.loadVarToReg(minuendVarname, "movzx");
}

const allocations = ra.getCurrentAllocations();
let sub = allocations[subtrahend]?.store;
if (!sub) {
  // subtrahend could be imm
  if (isImm(subtrahend)) {
    if (!isSafeImm32(subtrahend)) {
      sub = ra.loadImmToReg64(subtrahend);
    } else {
      sub = subtrahend; // safe imm
    }
  }
}

if (typeof carryoutVarname !== "undefined" && carryoutVarname !== "_") {
  ra.declareVarForFlag(Flags.CF, carryoutVarname);
} else {
  ra.declareFlagState(Flags.CF, FlagState.KILLED);
}
const min = ra.backupIfVarHasDependencies(minuendVarname, resVarname);

return [`${instr} ${min}, ${sub}`];
}
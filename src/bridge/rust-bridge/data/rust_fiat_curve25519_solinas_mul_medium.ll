[
  {
    "operation": "rust_fiat_curve25519_solinas_mul_medium",
    "arguments": [
      "x0, x1, x2"
    ],
    "returns": [
      {
        "datatype": "i64*",
        "name": "x0"
      }
    ],
    "body": [
      {
        "name": [
          "x3"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x1, i64 3"
      },
      {
        "name": [
          "x4"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x3"
      },
      {
        "name": [
          "x5"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x2, i64 3"
      },
      {
        "name": [
          "x6"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x5"
      },
      {
        "name": [
          "x7"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x4 to i128"
      },
      {
        "name": [
          "x8"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x6 to i128"
      },
      {
        "name": [
          "x9"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x8, x7"
      },
      {
        "name": [
          "x10"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x9, 64"
      },
      {
        "name": [
          "x11"
        ],
        "operation": "trunc",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x10 to i64"
      },
      {
        "name": [
          "x12"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x2, i64 2"
      },
      {
        "name": [
          "x13"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x12"
      },
      {
        "name": [
          "x14"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x13 to i128"
      },
      {
        "name": [
          "x15"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x14, x7"
      },
      {
        "name": [
          "x16"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x15, 64"
      },
      {
        "name": [
          "x17"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x2, i64 1"
      },
      {
        "name": [
          "x18"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x17"
      },
      {
        "name": [
          "x19"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x18 to i128"
      },
      {
        "name": [
          "x20"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x19, x7"
      },
      {
        "name": [
          "x21"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x20, 64"
      },
      {
        "name": [
          "x22"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x2"
      },
      {
        "name": [
          "x23"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x22 to i128"
      },
      {
        "name": [
          "x24"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x23, x7"
      },
      {
        "name": [
          "x25"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x24, 64"
      },
      {
        "name": [
          "x26"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x1, i64 2"
      },
      {
        "name": [
          "x27"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x26"
      },
      {
        "name": [
          "x28"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x27 to i128"
      },
      {
        "name": [
          "x29"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x28, x8"
      },
      {
        "name": [
          "x30"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x29, 64"
      },
      {
        "name": [
          "x31"
        ],
        "operation": "trunc",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x30 to i64"
      },
      {
        "name": [
          "x32"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x28, x14"
      },
      {
        "name": [
          "x33"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x32, 64"
      },
      {
        "name": [
          "x34"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x28, x19"
      },
      {
        "name": [
          "x35"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x34, 64"
      },
      {
        "name": [
          "x36"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x28, x23"
      },
      {
        "name": [
          "x37"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x36, 64"
      },
      {
        "name": [
          "x38"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x1, i64 1"
      },
      {
        "name": [
          "x39"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x38"
      },
      {
        "name": [
          "x40"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x39 to i128"
      },
      {
        "name": [
          "x41"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x40, x8"
      },
      {
        "name": [
          "x42"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x41, 64"
      },
      {
        "name": [
          "x43"
        ],
        "operation": "trunc",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x42 to i64"
      },
      {
        "name": [
          "x44"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x40, x14"
      },
      {
        "name": [
          "x45"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x44, 64"
      },
      {
        "name": [
          "x46"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x40, x19"
      },
      {
        "name": [
          "x47"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x46, 64"
      },
      {
        "name": [
          "x48"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x40, x23"
      },
      {
        "name": [
          "x49"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x48, 64"
      },
      {
        "name": [
          "x50"
        ],
        "operation": "load",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 ptr x1"
      },
      {
        "name": [
          "x51"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x50 to i128"
      },
      {
        "name": [
          "x52"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x51, x8"
      },
      {
        "name": [
          "x53"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x52, 64"
      },
      {
        "name": [
          "x54"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x51, x14"
      },
      {
        "name": [
          "x55"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x54, 64"
      },
      {
        "name": [
          "x56"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x51, x19"
      },
      {
        "name": [
          "x57"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x56, 64"
      },
      {
        "name": [
          "x58"
        ],
        "operation": "mul",
        "modifiers": "nuw",
        "datatype": "i128",
        "arguments": "i128 x51, x23"
      },
      {
        "name": [
          "x59"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x58, 64"
      },
      {
        "name": [
          "x60"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x24, 18446744073709551615"
      },
      {
        "name": [
          "x61",
          "x62"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x55, x60"
      },
      {
        "name": [
          "x63"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x20, 18446744073709551615"
      },
      {
        "name": [
          "x64",
          "x65"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x62, x53, x63"
      },
      {
        "name": [
          "x66"
        ],
        "operation": "add",
        "modifiers": "nuw",
        "datatype": "i64",
        "arguments": "i64 x65, x43"
      },
      {
        "name": [
          "x67"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x34, 18446744073709551615"
      },
      {
        "name": [
          "x68",
          "x69"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x61, x67"
      },
      {
        "name": [
          "x70",
          "x71"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x64, x69, x25"
      },
      {
        "name": [
          "x73",
          "x74"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x71, x66"
      },
      {
        "name": [
          "x75"
        ],
        "operation": "add",
        "modifiers": "nuw",
        "datatype": "i64",
        "arguments": "i64 x74, x31"
      },
      {
        "name": [
          "x76"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x36, 18446744073709551615"
      },
      {
        "name": [
          "x77",
          "x78"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x57, x76"
      },
      {
        "name": [
          "x79",
          "x80"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x68, x78, x37"
      },
      {
        "name": [
          "x81"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x32, 18446744073709551615"
      },
      {
        "name": [
          "x82",
          "x83"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x70, x80, x81"
      },
      {
        "name": [
          "x84"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x15, 18446744073709551615"
      },
      {
        "name": [
          "x85",
          "x86"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x83, x73, x84"
      },
      {
        "name": [
          "x88",
          "x89"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x86, x75"
      },
      {
        "name": [
          "x90"
        ],
        "operation": "add",
        "modifiers": "nuw",
        "datatype": "i64",
        "arguments": "i64 x89, x11"
      },
      {
        "name": [
          "x91"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x46, 18446744073709551615"
      },
      {
        "name": [
          "x92",
          "x93"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x77, x91"
      },
      {
        "name": [
          "x94"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x44, 18446744073709551615"
      },
      {
        "name": [
          "x95",
          "x96"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x79, x93, x94"
      },
      {
        "name": [
          "x97",
          "x98"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x82, x96, x35"
      },
      {
        "name": [
          "x99",
          "x100"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x85, x98, x21"
      },
      {
        "name": [
          "x101",
          "x102"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x100, x88"
      },
      {
        "name": [
          "x103"
        ],
        "operation": "add",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x90, x102"
      },
      {
        "name": [
          "x104"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x48, 18446744073709551615"
      },
      {
        "name": [
          "x105",
          "x106"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x59, x104"
      },
      {
        "name": [
          "x107",
          "x108"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x92, x106, x49"
      },
      {
        "name": [
          "x109",
          "x110"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x95, x108, x47"
      },
      {
        "name": [
          "x111"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x41, 18446744073709551615"
      },
      {
        "name": [
          "x112",
          "x113"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x97, x110, x111"
      },
      {
        "name": [
          "x114"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x29, 18446744073709551615"
      },
      {
        "name": [
          "x115",
          "x116"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x99, x113, x114"
      },
      {
        "name": [
          "x117"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x9, 18446744073709551615"
      },
      {
        "name": [
          "x118",
          "x119"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x116, x101, x117"
      },
      {
        "name": [
          "x120"
        ],
        "operation": "add",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x103, x119"
      },
      {
        "name": [
          "x121"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x56, 18446744073709551615"
      },
      {
        "name": [
          "x122",
          "x123"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x105, x121"
      },
      {
        "name": [
          "x124"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x54, 18446744073709551615"
      },
      {
        "name": [
          "x125",
          "x126"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x107, x123, x124"
      },
      {
        "name": [
          "x127"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x52, 18446744073709551615"
      },
      {
        "name": [
          "x128",
          "x129"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x109, x126, x127"
      },
      {
        "name": [
          "x130",
          "x131"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x112, x129, x45"
      },
      {
        "name": [
          "x132",
          "x133"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x115, x131, x33"
      },
      {
        "name": [
          "x134",
          "x135"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "x118, x133, x16"
      },
      {
        "name": [
          "x136"
        ],
        "operation": "add",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x120, x135"
      },
      {
        "name": [
          "x137"
        ],
        "operation": "zext",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x136 to i128"
      },
      {
        "name": [
          "x138"
        ],
        "operation": "mul",
        "modifiers": "nuw nsw",
        "datatype": "i128",
        "arguments": "i128 x137, 38"
      },
      {
        "name": [
          "x139"
        ],
        "operation": "lshr",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x138, 64"
      },
      {
        "name": [
          "x140"
        ],
        "operation": "trunc",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x139 to i64"
      },
      {
        "name": [
          "x141"
        ],
        "operation": "mul",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x134, 38"
      },
      {
        "name": [
          "x142"
        ],
        "operation": "mul",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x132, 38"
      },
      {
        "name": [
          "x143"
        ],
        "operation": "mul",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x130, 38"
      },
      {
        "name": [
          "x145",
          "x146"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x122, x142"
      },
      {
        "name": [
          "x147"
        ],
        "operation": "add",
        "modifiers": "nuw nsw",
        "datatype": "i128",
        "arguments": "i128 x146, x125"
      },
      {
        "name": [
          "x149",
          "x150"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x147, x141"
      },
      {
        "name": [
          "x151"
        ],
        "operation": "add",
        "modifiers": "nuw nsw",
        "datatype": "i128",
        "arguments": "i128 x150, x128"
      },
      {
        "name": [
          "x152"
        ],
        "operation": "and",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x138, 18446744073709551614"
      },
      {
        "name": [
          "x153",
          "x154"
        ],
        "operation": "addcarryx",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "0, x151, x152"
      },
      {
        "name": [
          "x155"
        ],
        "operation": "add",
        "modifiers": "nuw nsw",
        "datatype": "i64",
        "arguments": "i64 x154, x140"
      },
      {
        "name": [
          "x156"
        ],
        "operation": "trunc",
        "modifiers": "",
        "datatype": "i128",
        "arguments": "i128 x58 to i64"
      },
      {
        "name": [
          "x157"
        ],
        "operation": "add",
        "modifiers": "",
        "datatype": "i64",
        "arguments": "i64 x143, x156"
      },
      {
        "name": [
          "_"
        ],
        "operation": "store",
        "datatype": "i64",
        "arguments": "i64 x149, ptr x0",
        "modifiers": "align 8"
      },
      {
        "name": [
          "x158"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x0, i64 1"
      },
      {
        "name": [
          "_"
        ],
        "operation": "store",
        "datatype": "i64",
        "arguments": "i64 x153, ptr x158",
        "modifiers": "align 8"
      },
      {
        "name": [
          "x159"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x0, i64 2"
      },
      {
        "name": [
          "_"
        ],
        "operation": "store",
        "datatype": "i64",
        "arguments": "i64 x155, ptr x159",
        "modifiers": "align 8"
      },
      {
        "name": [
          "x160"
        ],
        "operation": "getelementptr",
        "modifiers": "inbounds ",
        "datatype": "i64",
        "arguments": "i64, ptr x0, i64 3"
      },
      {
        "name": [
          "_"
        ],
        "operation": "store",
        "datatype": "i64",
        "arguments": "i64 x157, ptr x160",
        "modifiers": "align 8"
      }
    ]
  }
]
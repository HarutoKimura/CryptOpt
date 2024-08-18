SECTION .text
	GLOBAL bls12_mul_CryptOpt
bls12_mul_CryptOpt:
sub rsp, 3224
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x20 ]; saving arg2[4] in rdx.
mulx r11, r10, [ r8 + 0x10 ]; x759_1, x759_0<- arg4[2] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r10, [ r8 + 0x0 ]; x210_1, x210_0<- arg4[0] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x944 to register64
imul rdx, [ rax + 0x28 ]; lox944 = arg4[2]*arg2[5]
mov r10, [ r8 + 0x28 ]; load m64 x931 to register64
imul r10, [ rax + 0x28 ]; lox931 = arg4[5]*arg2[5]
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov rbp, rdx; preserving value of x944 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mulx r13, r12, [ r8 + 0x28 ]; x43_1, x43_0<- arg4[5] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x8 ]; load m64 x948 to register64
imul rdx, [ rax + 0x28 ]; lox948 = arg4[1]*arg2[5]
mov r12, rdx; preserving value of x948 into a new reg
mov rdx, [ r8 + 0x28 ]; saving arg4[5] in rdx.
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, [ rax + 0x28 ]; x933_1, x933_0<- arg4[5] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp - 0x50 ], r9; spilling arg5 to mem
mulx r9, r14, [ rax + 0x28 ]; x953_1, x953_0<- arg4[0] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x20 ]; load m64 x936 to register64
imul rdx, [ rax + 0x28 ]; lox936 = arg4[4]*arg2[5]
mov r14, [ r8 + 0x8 ]; load m64 x762 to register64
imul r14, [ rax + 0x20 ]; lox762 = arg4[1]*arg2[4]
mov [ rsp - 0x48 ], rcx; spilling arg3 to mem
mov rcx, rdx; preserving value of x936 into a new reg
mov rdx, [ r8 + 0x8 ]; saving arg4[1] in rdx.
mov [ rsp - 0x40 ], rsi; spilling arg1 to mem
mov [ rsp - 0x38 ], rdi; spilling out1 to mem
mulx rdi, rsi, [ rax + 0x28 ]; x949_1, x949_0<- arg4[1] * arg2[5] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp - 0x30 ], r10; spilling x931 to mem
mulx r10, rsi, [ r8 + 0x20 ]; x48_1, x48_0<- arg4[4] * arg2[0] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x28 ], rcx; spilling x936 to mem
mulx rcx, rsi, [ r8 + 0x10 ]; x202_1, x202_0<- arg4[2] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x20 ]; load m64 x378 to register64
imul rdx, [ rax + 0x10 ]; lox378 = arg4[4]*arg2[2]
mov rsi, [ r8 + 0x28 ]; load m64 x373 to register64
imul rsi, [ rax + 0x10 ]; lox373 = arg4[5]*arg2[2]
mov [ rsp - 0x20 ], rsi; spilling x373 to mem
mov rsi, rdx; preserving value of x378 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.
mov [ rsp - 0x18 ], rbp; spilling x944 to mem
mov [ rsp - 0x10 ], rdi; spilling x949_1 to mem
mulx rdi, rbp, [ rax + 0x18 ]; x573_1, x573_0<- arg4[2] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x8 ]; load m64 x390 to register64
imul rdx, [ rax + 0x10 ]; lox390 = arg4[1]*arg2[2]
mov rbp, rdx; preserving value of x390 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp - 0x8 ], rsi; spilling x378 to mem
mov [ rsp + 0x0 ], r10; spilling x48_1 to mem
mulx r10, rsi, [ r8 + 0x18 ]; x383_1, x383_0<- arg4[3] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0x8 ], rbp; spilling x390 to mem
mulx rbp, rsi, [ r8 + 0x20 ]; x379_1, x379_0<- arg4[4] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx
mov [ rsp + 0x10 ], rdi; spilling x575 to mem
mulx rdi, rsi, [ rax + 0x10 ]; x387_1, x387_0<- arg4[2] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x8 ]; arg4[1] to rdx
mov [ rsp + 0x18 ], rdi; spilling x387_1 to mem
mulx rdi, rsi, [ rax + 0x18 ]; x577_1, x577_0<- arg4[1] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x20 ], r12; spilling x948 to mem
mulx r12, rsi, [ r8 + 0x18 ]; x53_1, x53_0<- arg4[3] * arg2[0] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0x28 ], r12; spilling x53_1 to mem
mulx r12, rsi, [ r8 + 0x28 ]; x375_1, x375_0<- arg4[5] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x30 ], r14; spilling x762 to mem
mulx r14, rsi, [ r8 + 0x10 ]; x58_1, x58_0<- arg4[2] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x745 to register64
imul rdx, [ rax + 0x20 ]; lox745 = arg4[5]*arg2[4]
mov rsi, [ r8 + 0x20 ]; load m64 x193 to register64
imul rsi, [ rax + 0x8 ]; lox193 = arg4[4]*arg2[1]
mov [ rsp + 0x38 ], rdx; spilling x745 to mem
mov rdx, [ r8 + 0x20 ]; load m64 x564 to register64
imul rdx, [ rax + 0x18 ]; lox564 = arg4[4]*arg2[3]
mov [ rsp + 0x40 ], rdx; spilling x564 to mem
mov rdx, [ r8 + 0x0 ]; load m64 x580 to register64
imul rdx, [ rax + 0x18 ]; lox580 = arg4[0]*arg2[3]
mov [ rsp + 0x48 ], rsi; spilling x193 to mem
mov rsi, rdx; preserving value of x580 into a new reg
mov rdx, [ r8 + 0x8 ]; saving arg4[1] in rdx.
mov [ rsp + 0x50 ], r10; spilling x383_1 to mem
mov [ rsp + 0x58 ], rcx; spilling x203 to mem
mulx rcx, r10, [ rax + 0x10 ]; x391_1, x391_0<- arg4[1] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x559 to register64
imul rdx, [ rax + 0x18 ]; lox559 = arg4[5]*arg2[3]
mov r10, [ r8 + 0x18 ]; load m64 x51 to register64
imul r10, [ rax + 0x0 ]; lox51 = arg4[3]*arg2[0]
mov [ rsp + 0x60 ], rsi; spilling x580 to mem
mov rsi, [ r8 + 0x20 ]; load m64 x46 to register64
imul rsi, [ rax + 0x0 ]; lox46 = arg4[4]*arg2[0]
mov [ rsp + 0x68 ], r13; spilling x45 to mem
mov r13, [ r8 + 0x18 ]; load m64 x754 to register64
imul r13, [ rax + 0x20 ]; lox754 = arg4[3]*arg2[4]
mov [ rsp + 0x70 ], rsi; spilling x46 to mem
mov rsi, rdx; preserving value of x559 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.
mov [ rsp + 0x78 ], r10; spilling x51 to mem
mov [ rsp + 0x80 ], r13; spilling x754 to mem
mulx r13, r10, [ rax + 0x28 ]; x945_1, x945_0<- arg4[2] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x56 to register64
imul rdx, [ rax + 0x0 ]; lox56 = arg4[2]*arg2[0]
mov r10, [ r8 + 0x8 ]; load m64 x576 to register64
imul r10, [ rax + 0x18 ]; lox576 = arg4[1]*arg2[3]
mov [ rsp + 0x88 ], rsi; spilling x559 to mem
mov rsi, rdx; preserving value of x56 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x90 ], r10; spilling x576 to mem
mov [ rsp + 0x98 ], rbx; spilling x212 to mem
mulx rbx, r10, [ r8 + 0x20 ]; x565_1, x565_0<- arg4[4] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp + 0xa0 ], rsi; spilling x56 to mem
mulx rsi, r10, [ r8 + 0x0 ]; x395_1, x395_0<- arg4[0] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0xa8 ], r12; spilling x376 to mem
mulx r12, r10, [ r8 + 0x28 ]; x747_1, x747_0<- arg4[5] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mov [ rsp + 0xb0 ], rsi; spilling x395_1 to mem
mulx rsi, r10, [ r8 + 0x20 ]; x751_1, x751_0<- arg4[4] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x568 to register64
imul rdx, [ rax + 0x18 ]; lox568 = arg4[3]*arg2[3]
mov r10, [ r8 + 0x20 ]; load m64 x750 to register64
imul r10, [ rax + 0x20 ]; lox750 = arg4[4]*arg2[4]
mov [ rsp + 0xb8 ], rbp; spilling x381 to mem
mov rbp, rdx; preserving value of x568 into a new reg
mov rdx, [ r8 + 0x8 ]; saving arg4[1] in rdx.
mov [ rsp + 0xc0 ], r10; spilling x750 to mem
mov [ rsp + 0xc8 ], rdi; spilling x578 to mem
mulx rdi, r10, [ rax + 0x8 ]; x206_1, x206_0<- arg4[1] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0xd0 ], rbp; spilling x568 to mem
mulx rbp, r10, [ r8 + 0x18 ]; x569_1, x569_0<- arg4[3] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x382 to register64
imul rdx, [ rax + 0x10 ]; lox382 = arg4[3]*arg2[2]
mov r10, [ r8 + 0x0 ]; load m64 x766 to register64
imul r10, [ rax + 0x20 ]; lox766 = arg4[0]*arg2[4]
mov [ rsp + 0xd8 ], r10; spilling x766 to mem
mov r10, [ r8 + 0x10 ]; load m64 x386 to register64
imul r10, [ rax + 0x10 ]; lox386 = arg4[2]*arg2[2]
mov [ rsp + 0xe0 ], r15; spilling x935 to mem
mov r15, rdx; preserving value of x382 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0xe8 ], r10; spilling x386 to mem
mov [ rsp + 0xf0 ], rdi; spilling x206_1 to mem
mulx rdi, r10, [ r8 + 0x0 ]; x68_1, x68_0<- arg4[0] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x18 ]; arg4[3] to rdx
mov [ rsp + 0xf8 ], r15; spilling x382 to mem
mulx r15, r10, [ rax + 0x28 ]; x941_1, x941_0<- arg4[3] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x201 to register64
imul rdx, [ rax + 0x8 ]; lox201 = arg4[2]*arg2[1]
mov r10, [ r8 + 0x28 ]; load m64 x40 to register64
imul r10, [ rax + 0x0 ]; lox40 = arg4[5]*arg2[0]
mov [ rsp + 0x100 ], r10; spilling x40 to mem
mov r10, [ r8 + 0x8 ]; load m64 x61 to register64
imul r10, [ rax + 0x0 ]; lox61 = arg4[1]*arg2[0]
mov [ rsp + 0x108 ], rbx; spilling x567 to mem
mov rbx, rdx; preserving value of x201 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mov [ rsp + 0x110 ], r10; spilling x61 to mem
mov [ rsp + 0x118 ], rdi; spilling x69 to mem
mulx rdi, r10, [ r8 + 0x8 ]; x763_1, x763_0<- arg4[1] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x758 to register64
imul rdx, [ rax + 0x20 ]; lox758 = arg4[2]*arg2[4]
mov r10, rdx; preserving value of x758 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mov [ rsp + 0x120 ], rbx; spilling x201 to mem
mov [ rsp + 0x128 ], r13; spilling x946 to mem
mulx r13, rbx, [ r8 + 0x18 ]; x755_1, x755_0<- arg4[3] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x0 ]; load m64 x66 to register64
imul rdx, [ rax + 0x0 ]; lox66 = arg4[0]*arg2[0]
mov rbx, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x130 ], r14; spilling x59 to mem
mov r14, rdx;
imul r14, rbx; lox101 = x66*0x48669f39fb24c32
mov rbx, [ r8 + 0x0 ]; load m64 x394 to register64
imul rbx, [ rax + 0x10 ]; lox394 = arg4[0]*arg2[2]
mov [ rsp + 0x138 ], rbx; spilling x394 to mem
mov rbx, rdx; preserving value of x66 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp + 0x140 ], r14; spilling x101 to mem
mov [ rsp + 0x148 ], r10; spilling x758 to mem
mulx r10, r14, [ r8 + 0x18 ]; x198_1, x198_0<- arg4[3] * arg2[1] (_0*_0)
mov rdx, 0x4cc7c19e39811d94 ; moving imm to reg
mov r14, rbx;
imul r14, rdx; lox114 = x66*0x4cc7c19e39811d94
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp + 0x150 ], r14; spilling x114 to mem
mov [ rsp + 0x158 ], r13; spilling x755_1 to mem
mulx r13, r14, [ rax + 0x20 ]; x767_1, x767_0<- arg4[0] * arg2[4] (_0*_0)
mov rdx, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov r14, rbx;
imul r14, rdx; lox110 = x66*0x2a880aa4ed33c7c3
mov rdx, [ r8 + 0x0 ]; load m64 x952 to register64
imul rdx, [ rax + 0x28 ]; lox952 = arg4[0]*arg2[5]
mov [ rsp + 0x160 ], rdx; spilling x952 to mem
mov rdx, [ rsp + 0x50 ];
cmp rbx, 0x0
mov [ rsp + 0x168 ], r14; spilling x110 to mem
setne r14b; setCC x145 to reg (r14)
mov [ rsp + 0x170 ], rdx; spilling x384 to mem
mov rdx, r13;
add rdx, [ rsp + 0x30 ]
mov byte [ rsp + 0x178 ], r14b; spilling byte x145 to mem
mov r14, rdx; preserving value of x770 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp + 0x180 ], r11; spilling x761 to mem
mov [ rsp + 0x188 ], r9; spilling x955 to mem
mulx r9, r11, [ r8 + 0x20 ]; x194_1, x194_0<- arg4[4] * arg2[1] (_0*_0)
mov rdx, -0x760c000300030003 ; moving imm to reg
mov r11, rbx;
imul r11, rdx; lox100 = x66*-0x760c000300030003
mov rdx, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x190 ], r10; spilling x200 to mem
mov [ rsp + 0x198 ], r9; spilling x194_1 to mem
mulx r9, r10, r11; x111_1, x111_0<- x100 * 0x64774b84f38512bf (_0*_0)
mov r10, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov rdx, r11; x100 to rdx
mov [ rsp + 0x1a0 ], r15; spilling x942 to mem
mulx r15, r11, r10; x107_1, x107_0<- x100 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r11, rdx; preserving value of x100 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x1a8 ], rbp; spilling x571 to mem
mulx rbp, r10, [ r8 + 0x8 ]; x63_1, x63_0<- arg4[1] * arg2[0] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x1b0 ], rbp; spilling x63_1 to mem
mulx rbp, r10, [ r8 + 0x28 ]; x561_1, x561_0<- arg4[5] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp + 0x1b8 ], r15; spilling x107_1 to mem
mulx r15, r10, [ r8 + 0x20 ]; x937_1, x937_0<- arg4[4] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x197 to register64
imul rdx, [ rax + 0x8 ]; lox197 = arg4[3]*arg2[1]
mov r10, rdx; preserving value of x197 into a new reg
mov rdx, [ r8 + 0x0 ]; saving arg4[0] in rdx.
mov [ rsp + 0x1c0 ], rbp; spilling x563 to mem
mov [ rsp + 0x1c8 ], rsi; spilling x753 to mem
mulx rsi, rbp, [ rax + 0x18 ]; x581_1, x581_0<- arg4[0] * arg2[3] (_0*_0)
mov rdx, 0x60fec0aec070003 ; moving imm to reg
mov rbp, rbx;
imul rbp, rdx; lox118 = x66*0x60fec0aec070003
cmp r14, r13
mov r13, 0x1a0111ea397fe69a ; moving imm to reg
mov rdx, r13; 0x1a0111ea397fe69a to rdx
mov [ rsp + 0x1d0 ], r15; spilling x938 to mem
mulx r15, r13, r11; x103_1, x103_0<- x100 * 0x1a0111ea397fe69a (_0*_0)
setc r13b;
mov rdx, [ r8 + 0x8 ]; load m64 x205 to register64
imul rdx, [ rax + 0x8 ]; lox205 = arg4[1]*arg2[1]
mov [ rsp + 0x1d8 ], rbp; spilling x118 to mem
mov rbp, [ r8 + 0x10 ]; load m64 x572 to register64
imul rbp, [ rax + 0x18 ]; lox572 = arg4[2]*arg2[3]
mov [ rsp + 0x1e0 ], r12; spilling x749 to mem
mov r12, rdx; preserving value of x205 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp + 0x1e8 ], rbp; spilling x572 to mem
mov [ rsp + 0x1f0 ], r10; spilling x197 to mem
mulx r10, rbp, [ r8 + 0x28 ]; x190_1, x190_0<- arg4[5] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x940 to register64
imul rdx, [ rax + 0x28 ]; lox940 = arg4[3]*arg2[5]
mov rbp, [ rsp + 0xb0 ];
mov [ rsp + 0x1f8 ], rdx; spilling x940 to mem
mov rdx, [ r8 + 0x28 ]; load m64 x188 to register64
imul rdx, [ rax + 0x8 ]; lox188 = arg4[5]*arg2[1]
mov [ rsp + 0x200 ], rdx; spilling x188 to mem
mov rdx, [ r8 + 0x0 ]; load m64 x209 to register64
imul rdx, [ rax + 0x8 ]; lox209 = arg4[0]*arg2[1]
mov [ rsp + 0x208 ], rdx; spilling x209 to mem
mov rdx, [ rsp + 0x1b8 ];
mov byte [ rsp + 0x210 ], r13b; spilling byte x771 to mem
mov r13, 0x299338752f97f97b ; moving imm to reg
imul rbx, r13; lox106 = x66*0x299338752f97f97b
mov r13, [ rsp + 0xf0 ];
mov [ rsp + 0x218 ], r13; spilling x207 to mem
mov r13, 0xb9feffffffffaaab ; moving imm to reg
xchg rdx, r11; x100, swapping with x108, which is currently in rdx
mov [ rsp + 0x220 ], r9; spilling x113 to mem
mov [ rsp + 0x228 ], rbx; spilling x106 to mem
mulx rbx, r9, r13; x122_1, x122_0<- x100 * 0xb9feffffffffaaab (_0*_0)
mov r9, [ rsp + 0x20 ];
add r9, [ rsp + 0x188 ]
mov r13, rbp;
add r13, [ rsp + 0x8 ]
mov [ rsp + 0x230 ], r11; spilling x109 to mem
mov r11, [ rsp + 0x18 ];
cmp r13, rbp
mov rbp, [ rsp + 0x28 ];
mov [ rsp + 0x238 ], r15; spilling x105 to mem
mov r15, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x240 ], r10; spilling x190_1 to mem
mov [ rsp + 0x248 ], r9; spilling x956 to mem
mulx r9, r10, r15; x119_1, x119_0<- x100 * 0x1eabfffeb153ffff (_0*_0)
mov r10, [ rsp + 0x0 ];
mov r15, [ rsp - 0x10 ];
mov [ rsp + 0x250 ], r10; spilling x50 to mem
mov r10, [ rsp + 0x158 ];
adc rcx, 0x0; add CF to r0's alloc
mov [ rsp + 0x258 ], rbp; spilling x55 to mem
mov rbp, [ rsp + 0x1b0 ];
add rcx, [ rsp + 0xe8 ]
mov [ rsp + 0x260 ], r10; spilling x757 to mem
mov r10, [ rsp + 0x198 ];
add r12, [ rsp + 0x98 ]
mov [ rsp + 0x268 ], rbp; spilling x65 to mem
mov rbp, rsi;
add rbp, [ rsp + 0x90 ]
mov [ rsp + 0x270 ], r11; spilling x389 to mem
mov r11, [ rsp + 0x188 ]; load m64 x955 to register64
cmp [ rsp + 0x248 ], r11
adc r15, 0x0; add CF to r0's alloc
mov r11, [ rsp + 0x240 ];
mov [ rsp + 0x278 ], rcx; spilling x402 to mem
mov rcx, [ rsp + 0x228 ];
add rcx, [ rsp + 0x220 ]
cmp r12, [ rsp + 0x98 ]
mov [ rsp + 0x280 ], rcx; spilling x136 to mem
mov rcx, [ rsp - 0x18 ]; load m64 x944 to register64
lea r15, [ r15 + rcx ]; r8/64 + m8
mov [ rsp + 0x288 ], rbx; spilling x123 to mem
movzx rbx, byte [ rsp + 0x210 ]; load byte memx771 to register64
lea rdi, [ rdi + rbx ]; r64+m8
mov rbx, [ rsp + 0x148 ]; load m64 x758 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov [ rsp + 0x290 ], rbp; spilling x584 to mem
setc bpl;
cmp r15, rcx
mov rcx, [ rsp + 0x128 ];
adc rcx, 0x0; add CF to r0's alloc
mov [ rsp + 0x298 ], rdi; spilling x774 to mem
mov rdi, rcx;
add rdi, [ rsp + 0x1f8 ]
mov [ rsp + 0x2a0 ], rdi; spilling x966 to mem
movzx rdi, bpl;
add rdi, [ rsp + 0x218 ]
mov rbp, [ rsp + 0x110 ];
add rbp, [ rsp + 0x118 ]
mov [ rsp + 0x2a8 ], r11; spilling x192 to mem
mov r11, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x2b0 ], rbp; spilling x71 to mem
mov [ rsp + 0x2b8 ], rdi; spilling x216 to mem
mulx rdi, rbp, r11; x115_1, x115_0<- x100 * 0x6730d2a0f6b0f624 (_0*_0)
add r9, [ rsp + 0x150 ]
mov rdx, [ rsp + 0x140 ];
add rdx, [ rsp + 0x230 ]
mov rbp, [ rsp + 0x120 ];
add rbp, [ rsp + 0x2b8 ]
cmp [ rsp + 0x298 ], rbx
setc bl;
cmp rbp, [ rsp + 0x120 ]
movzx r11, bl;
mov [ rsp + 0x2c0 ], rdx; spilling x140 to mem
mov rdx, [ rsp + 0x180 ]; load m64 x761 to register64
lea r11, [ r11 + rdx ]; r8/64 + m8
mov rbx, [ rsp + 0x58 ];
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0x2c8 ], r9; spilling x128 to mem
mov r9, rbx;
add r9, [ rsp + 0x1f0 ]
cmp rcx, [ rsp + 0x128 ]
mov rcx, [ rsp + 0x2b0 ];
mov [ rsp + 0x2d0 ], r10; spilling x196 to mem
movzx r10, byte [ rsp + 0x178 ]; load byte memx145 to register64
lea rcx, [ rcx + r10 ]; r64+m8
setc r10b;
cmp [ rsp + 0x290 ], rsi
setc sil;
cmp rcx, [ rsp + 0x2b0 ]
mov [ rsp + 0x2d8 ], r11; spilling x777 to mem
movzx r11, sil;
mov [ rsp + 0x2e0 ], r9; spilling x223 to mem
mov r9, [ rsp + 0xc8 ]; load m64 x579 to register64
lea r11, [ r11 + r9 ]; r8/64 + m8
mov r9, [ rsp + 0x1f8 ]; load m64 x940 to register64
setc sil;
cmp [ rsp + 0x2a0 ], r9
movzx r9, r10b;
adc r9, 0x0; add CF to r0's alloc
cmp rbx, [ rsp + 0x58 ]
mov rbx, [ rsp + 0x1e8 ]; load m64 x572 to register64
lea r11, [ r11 + rbx ]; r8/64 + m8
mov r10, [ rsp + 0xe8 ]; load m64 x386 to register64
mov [ rsp + 0x2e8 ], rdi; spilling x116 to mem
setc dil;
cmp [ rsp + 0x278 ], r10
mov r10, [ rsp + 0x270 ];
adc r10, 0x0; add CF to r0's alloc
mov byte [ rsp + 0x2f0 ], sil; spilling byte x148 to mem
mov rsi, [ rsp + 0x1f0 ]; load m64 x197 to register64
cmp [ rsp + 0x2e0 ], rsi
mov rsi, [ rsp + 0x1d8 ];
mov [ rsp + 0x2f8 ], r10; spilling x405 to mem
mov r10, [ rsp + 0x288 ]; load m64 x124 to register64
lea rsi, [ rsi + r10 ]; r8/64 + m8
lea rcx, [ rcx + rsi ]
mov [ rsp + 0x300 ], rcx; spilling x150 to mem
mov rcx, [ rsp + 0x80 ];
mov [ rsp + 0x308 ], r9; spilling x969 to mem
mov r9, [ rsp + 0x2d8 ]; load m64 x777 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
mov [ rsp + 0x310 ], rcx; spilling x780 to mem
setc cl;
cmp r11, rbx
movzx rbx, cl;
movzx rdi, dil
lea rbx, [ rbx + rdi ]
mov rdi, [ rsp + 0x118 ]; load m64 x70 to register64
setc cl;
cmp [ rsp + 0x2b0 ], rdi
mov rdi, [ rsp + 0x308 ];
mov [ rsp + 0x318 ], rbx; spilling x226 to mem
mov rbx, [ rsp + 0x1a0 ]; load m64 x943 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov [ rsp + 0x320 ], rdi; spilling x970 to mem
movzx rdi, cl;
mov [ rsp + 0x328 ], rbx; spilling x943 to mem
mov rbx, [ rsp + 0x10 ]; load m64 x575 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov rcx, [ rsp + 0x318 ];
mov [ rsp + 0x330 ], rdi; spilling x591 to mem
mov rdi, [ rsp + 0x190 ]; load m64 x200 to register64
lea rcx, [ rcx + rdi ]; r8/64 + m8
setc bl;
cmp rcx, rdi
mov rdi, [ rsp + 0x328 ]; load m64 x943 to register64
mov byte [ rsp + 0x338 ], bl; spilling byte x72 to mem
setc bl;
cmp [ rsp + 0x320 ], rdi
setc dil;
cmp [ rsp + 0x300 ], rsi
mov byte [ rsp + 0x340 ], bl; spilling byte x228 to mem
mov rbx, [ rsp + 0x300 ];
mov byte [ rsp + 0x348 ], dil; spilling byte x971 to mem
mov rdi, [ rsp + 0x208 ]; load m64 x209 to register64
lea rbx, [ rbx + rdi ]; r8/64 + m8
mov rdi, [ rsp + 0xf8 ];
mov [ rsp + 0x350 ], rbx; spilling x242 to mem
mov rbx, [ rsp + 0x2f8 ]; load m64 x405 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov [ rsp + 0x358 ], rdi; spilling x408 to mem
mov rdi, -0x760c000300030003 ; moving imm to reg
setc bl;
mov [ rsp + 0x360 ], rcx; spilling x227 to mem
mov rcx, [ rsp + 0x350 ];
imul rcx, rdi; lox285 = x242*-0x760c000300030003
cmp [ rsp + 0x350 ], 0x0
setne dil; setCC x330 to reg (rdi)
mov byte [ rsp + 0x368 ], dil; spilling byte x330 to mem
mov rdi, [ rsp - 0x28 ];
add rdi, [ rsp + 0x320 ]
mov byte [ rsp + 0x370 ], bl; spilling byte x151 to mem
mov rbx, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x378 ], rdi; spilling x973 to mem
mov rdi, [ rsp + 0x350 ];
imul rdi, rbx; lox303 = x242*0x60fec0aec070003
mov rbx, 0x4b1ba7b6434bacd7 ; moving imm to reg
xchg rdx, rcx; x285, swapping with x761, which is currently in rdx
mov [ rsp + 0x380 ], rdi; spilling x303 to mem
mov [ rsp + 0x388 ], r11; spilling x588 to mem
mulx r11, rdi, rbx; x292_1, x292_0<- x285 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rdi, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov rbx, [ rsp + 0x350 ];
imul rbx, rdi; lox295 = x242*0x2a880aa4ed33c7c3
mov rdi, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x390 ], rbx; spilling x295 to mem
mov [ rsp + 0x398 ], r11; spilling x292_1 to mem
mulx r11, rbx, rdi; x307_1, x307_0<- x285 * 0xb9feffffffffaaab (_0*_0)
mov rbx, 0x48669f39fb24c32 ; moving imm to reg
mov rdi, [ rsp + 0x350 ];
imul rdi, rbx; lox286 = x242*0x48669f39fb24c32
mov rbx, [ rsp + 0x268 ];
rcr byte [ rsp + 0x338 ], 1
adc rbx, 0x0
add rbx, [ rsp + 0xa0 ]
mov [ rsp + 0x3a0 ], rdi; spilling x286 to mem
mov rdi, [ rsp + 0x378 ]; load m64 x973 to register64
cmp rdi, [ rsp - 0x28 ]
mov [ rsp + 0x3a8 ], r11; spilling x307_1 to mem
mov r11, [ rsp + 0x350 ]; load m64 x242 to register64
mov [ rsp + 0x3b0 ], rbx; spilling x75 to mem
setc bl;
cmp r11, [ rsp + 0x300 ]
movzx rdi, bl;
mov [ rsp + 0x3b8 ], rdx; spilling x285 to mem
movzx rdx, byte [ rsp + 0x348 ]; load byte memx971 to register64
lea rdi, [ rdi + rdx ]; r64+m8
mov rdx, 0x299338752f97f97b ; moving imm to reg
setc bl;
mov [ rsp + 0x3c0 ], rdi; spilling x976 to mem
mov rdi, r11;
imul rdi, rdx; lox291 = x242*0x299338752f97f97b
mov rdx, [ rsp + 0x270 ]; load m64 x389 to register64
cmp [ rsp + 0x2f8 ], rdx
setc dl;
cmp rsi, r10
mov r10, [ rsp + 0x3c0 ];
mov rsi, [ rsp + 0x1d0 ]; load m64 x939 to register64
lea r10, [ r10 + rsi ]; r8/64 + m8
mov [ rsp + 0x3c8 ], rdi; spilling x291 to mem
movzx rdi, byte [ rsp + 0x370 ];
mov byte [ rsp + 0x3d0 ], bl; spilling byte x243 to mem
movzx rbx, byte [ rsp + 0x2f0 ]; load byte memx148 to register64
lea rdi, [ rdi + rbx ]; r64+m8
setc bl;
cmp r10, rsi
mov rsi, [ rsp + 0xe0 ];
adc rsi, 0x0; add CF to r0's alloc
mov [ rsp + 0x3d8 ], rsi; spilling x983 to mem
mov rsi, [ rsp + 0x48 ];
add rsi, [ rsp + 0x360 ]
mov byte [ rsp + 0x3e0 ], bl; spilling byte x126 to mem
mov rbx, 0x4cc7c19e39811d94 ; moving imm to reg
imul r11, rbx; lox299 = x242*0x4cc7c19e39811d94
cmp rsi, [ rsp + 0x48 ]
mov rbx, [ rsp + 0x168 ];
mov [ rsp + 0x3e8 ], r11; spilling x299 to mem
mov r11, [ rsp + 0x2e8 ]; load m64 x117 to register64
lea rbx, [ rbx + r11 ]; r8/64 + m8
mov r11, [ rsp + 0x3b0 ]; load m64 x75 to register64
lea rdi, [ rdi + r11 ]; r8/64 + m8
mov [ rsp + 0x3f0 ], rbx; spilling x132 to mem
mov rbx, [ rsp + 0x358 ]; load m64 x408 to register64
mov byte [ rsp + 0x3f8 ], dl; spilling byte x406 to mem
setc dl;
cmp rbx, [ rsp + 0xf8 ]
mov byte [ rsp + 0x400 ], dl; spilling byte x231 to mem
setc dl;
cmp rdi, r11
mov byte [ rsp + 0x408 ], dl; spilling byte x409 to mem
movzx rdx, byte [ rsp + 0x400 ];
mov [ rsp + 0x410 ], rdi; spilling x154 to mem
movzx rdi, byte [ rsp + 0x340 ]; load byte memx228 to register64
lea rdx, [ rdx + rdi ]; r64+m8
mov rdi, [ rsp + 0xd0 ];
mov [ rsp + 0x418 ], rdx; spilling x233 to mem
mov rdx, [ rsp + 0x330 ]; load m64 x591 to register64
lea rdi, [ rdi + rdx ]; r8/64 + m8
mov [ rsp + 0x420 ], rdi; spilling x594 to mem
movzx rdi, byte [ rsp + 0x408 ];
movzx rdx, byte [ rsp + 0x3f8 ]; load byte memx406 to register64
lea rdi, [ rdi + rdx ]; r64+m8
mov rdx, [ rsp + 0x170 ]; load m64 x385 to register64
lea rdi, [ rdi + rdx ]; r8/64 + m8
mov [ rsp + 0x428 ], rdi; spilling x412 to mem
mov rdi, [ rsp + 0x10 ]; load m64 x575 to register64
mov [ rsp + 0x430 ], rdx; spilling x385 to mem
setc dl;
cmp [ rsp + 0x330 ], rdi
mov rdi, [ rsp + 0x418 ];
mov byte [ rsp + 0x438 ], dl; spilling byte x155 to mem
mov rdx, [ rsp + 0x2d0 ]; load m64 x196 to register64
lea rdi, [ rdi + rdx ]; r8/64 + m8
mov [ rsp + 0x440 ], rdi; spilling x234 to mem
mov rdi, [ rsp + 0x420 ]; load m64 x594 to register64
setc dl;
cmp rdi, [ rsp + 0xd0 ]
mov byte [ rsp + 0x448 ], dl; spilling byte x592 to mem
mov rdx, [ rsp + 0x440 ]; load m64 x234 to register64
setc dil;
cmp rdx, [ rsp + 0x2d0 ]
mov byte [ rsp + 0x450 ], dil; spilling byte x595 to mem
mov rdi, [ rsp + 0x428 ]; load m64 x412 to register64
setc dl;
cmp rdi, [ rsp + 0x430 ]
mov byte [ rsp + 0x458 ], dl; spilling byte x235 to mem
mov rdx, 0x1eabfffeb153ffff ; moving imm to reg
mulx rbx, rdi, [ rsp + 0x3b8 ]; x304_1, x304_0<- x285 * 0x1eabfffeb153ffff (_0*_0)
movzx rdi, byte [ rsp + 0x450 ];
movzx rdx, byte [ rsp + 0x448 ]; load byte memx592 to register64
lea rdi, [ rdi + rdx ]; r64+m8
mov rdx, [ rsp - 0x30 ]; load m64 x931 to register64
lea r10, [ r10 + rdx ]; r8/64 + m8
mov [ rsp + 0x460 ], rdi; spilling x597 to mem
mov rdi, [ rsp + 0x2c8 ];
mov [ rsp + 0x468 ], r10; spilling x980 to mem
movzx r10, byte [ rsp + 0x3e0 ]; load byte memx126 to register64
lea rdi, [ rdi + r10 ]; r64+m8
setc r10b;
cmp rdi, [ rsp + 0x150 ]
mov byte [ rsp + 0x470 ], r10b; spilling byte x413 to mem
mov r10, [ rsp + 0x398 ];
mov [ rsp + 0x478 ], r10; spilling x293 to mem
setc r10b;
cmp [ rsp + 0x468 ], rdx
setc dl;
cmp r11, [ rsp + 0xa0 ]
mov r11, [ rsp + 0x3e8 ]; load m64 x299 to register64
lea rbx, [ rbx + r11 ]; r8/64 + m8
mov byte [ rsp + 0x480 ], dl; spilling byte x981 to mem
mov rdx, [ rsp + 0x310 ]; load m64 x780 to register64
mov [ rsp + 0x488 ], rbx; spilling x313 to mem
setc bl;
cmp rdx, [ rsp + 0x80 ]
mov byte [ rsp + 0x490 ], r10b; spilling byte x130 to mem
mov r10, [ rsp + 0x460 ];
mov byte [ rsp + 0x498 ], bl; spilling byte x76 to mem
mov rbx, [ rsp + 0x1a8 ]; load m64 x571 to register64
lea r10, [ r10 + rbx ]; r8/64 + m8
mov rbx, r10;
mov rdx, [ rsp + 0x40 ]; load m64 x564 to register64
lea rbx, [ rbx + rdx ]; r8/64 + m8
mov [ rsp + 0x4a0 ], rbx; spilling x601 to mem
setc bl;
cmp r9, rcx
mov rcx, [ rsp + 0x440 ];
mov r9, [ rsp + 0x200 ]; load m64 x188 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
mov [ rsp + 0x4a8 ], rcx; spilling x237 to mem
movzx rcx, bl;
adc rcx, 0x0; add CF to r0's alloc
add rcx, [ rsp + 0x260 ]
movzx rbx, byte [ rsp + 0x498 ];
add rbx, [ rsp + 0x130 ]
mov [ rsp + 0x4b0 ], rbx; spilling x78 to mem
mov rbx, [ rsp - 0x8 ];
add rbx, [ rsp + 0x428 ]
cmp rbx, [ rsp - 0x8 ]
mov [ rsp + 0x4b8 ], rcx; spilling x784 to mem
setc cl;
cmp r10, [ rsp + 0x1a8 ]
mov r10, [ rsp + 0xc0 ];
mov byte [ rsp + 0x4c0 ], cl; spilling byte x416 to mem
mov rcx, [ rsp + 0x4b8 ]; load m64 x784 to register64
lea r10, [ r10 + rcx ]; r8/64 + m8
mov [ rsp + 0x4c8 ], r10; spilling x787 to mem
mov r10, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, r10; 0x6730d2a0f6b0f624, swapping with x564, which is currently in rdx
mov [ rsp + 0x4d0 ], rbx; spilling x415 to mem
mulx rbx, rcx, [ rsp + 0x3b8 ]; x300_1, x300_0<- x285 * 0x6730d2a0f6b0f624 (_0*_0)
mov rcx, [ rsp + 0x78 ];
mov rdx, [ rsp + 0x4b0 ]; load m64 x78 to register64
lea rcx, [ rcx + rdx ]; r8/64 + m8
mov [ rsp + 0x4d8 ], rcx; spilling x81 to mem
setc cl;
cmp rdx, [ rsp + 0x130 ]
movzx rdx, byte [ rsp + 0x4c0 ];
mov byte [ rsp + 0x4e0 ], cl; spilling byte x599 to mem
movzx rcx, byte [ rsp + 0x470 ]; load byte memx413 to register64
lea rdx, [ rdx + rcx ]; r64+m8
setc cl;
cmp [ rsp + 0x4a8 ], r9
mov r9, 0x1a0111ea397fe69a ; moving imm to reg
mov byte [ rsp + 0x4e8 ], cl; spilling byte x79 to mem
mov rcx, rdx; preserving value of x418 into a new reg
mov rdx, [ rsp + 0x3b8 ]; saving x285 in rdx.
mov [ rsp + 0x4f0 ], rbx; spilling x300_1 to mem
mulx r10, rbx, r9; x288_1, x288_0<- x285 * 0x1a0111ea397fe69a (_0*_0)
mov rbx, rdi;
mov r9, [ rsp + 0x410 ]; load m64 x154 to register64
lea rbx, [ rbx + r9 ]; r8/64 + m8
mov r9, [ rsp + 0x40 ]; load m64 x564 to register64
mov [ rsp + 0x4f8 ], rcx; spilling x418 to mem
setc cl;
cmp [ rsp + 0x4a0 ], r9
mov r9, rbx;
mov byte [ rsp + 0x500 ], cl; spilling byte x238 to mem
movzx rcx, byte [ rsp + 0x3d0 ]; load byte memx243 to register64
lea r9, [ r9 + rcx ]; r64+m8
setc cl;
cmp rbx, rdi
mov rdi, [ rsp + 0x4f0 ];
mov byte [ rsp + 0x508 ], cl; spilling byte x602 to mem
mov rcx, [ rsp + 0x3f0 ];
mov [ rsp + 0x510 ], r9; spilling x245 to mem
movzx r9, byte [ rsp + 0x490 ]; load byte memx130 to register64
lea rcx, [ rcx + r9 ]; r64+m8
mov r9, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x518 ], r10; spilling x290 to mem
mov [ rsp + 0x520 ], rcx; spilling x133 to mem
mulx rcx, r10, r9; x296_1, x296_0<- x285 * 0x64774b84f38512bf (_0*_0)
mov rdx, [ rsp + 0x390 ]; load m64 x295 to register64
lea rdi, [ rdi + rdx ]; r8/64 + m8
mov r10, [ rsp + 0x78 ]; load m64 x51 to register64
setc r9b;
cmp [ rsp + 0x4d8 ], r10
movzx r10, byte [ rsp + 0x458 ];
mov byte [ rsp + 0x528 ], r9b; spilling byte x158 to mem
mov r9, [ rsp + 0x2a8 ]; load m64 x192 to register64
lea r10, [ r10 + r9 ]; r8/64 + m8
movzx r9, byte [ rsp + 0x500 ]; load byte memx238 to register64
lea r10, [ r10 + r9 ]; r64+m8
movzx r9, byte [ rsp + 0x4e8 ];
adc r9, 0x0; add CF to r0's alloc
mov [ rsp + 0x530 ], r10; spilling x241 to mem
mov r10, [ rsp + 0x4f8 ];
add r10, [ rsp + 0xb8 ]
add r9, [ rsp + 0x258 ]
mov [ rsp + 0x538 ], rdi; spilling x317 to mem
mov rdi, r10;
add rdi, [ rsp - 0x20 ]
mov [ rsp + 0x540 ], rdi; spilling x422 to mem
mov rdi, [ rsp + 0x520 ]; load m64 x133 to register64
cmp rdi, [ rsp + 0x168 ]
mov [ rsp + 0x548 ], r9; spilling x85 to mem
mov r9, [ rsp + 0x280 ];
adc r9, 0x0; add CF to r0's alloc
mov [ rsp + 0x550 ], r9; spilling x137 to mem
mov r9, r12;
add r9, [ rsp + 0x510 ]
mov [ rsp + 0x558 ], r9; spilling x248 to mem
mov r9, [ rsp + 0x3a8 ];
cmp [ rsp + 0x510 ], rbx
mov rbx, r9;
mov [ rsp + 0x560 ], rcx; spilling x298 to mem
mov rcx, [ rsp + 0x380 ]; load m64 x303 to register64
lea rbx, [ rbx + rcx ]; r8/64 + m8
mov rcx, [ rsp + 0x550 ]; load m64 x137 to register64
mov [ rsp + 0x568 ], rbx; spilling x310 to mem
setc bl;
cmp rcx, [ rsp + 0x228 ]
mov byte [ rsp + 0x570 ], bl; spilling byte x246 to mem
setc bl;
cmp [ rsp + 0x568 ], r9
mov r9, [ rsp + 0x4b8 ]; load m64 x784 to register64
mov byte [ rsp + 0x578 ], bl; spilling byte x138 to mem
setc bl;
cmp r9, [ rsp + 0x260 ]
setc r9b;
cmp r10, [ rsp + 0xb8 ]
mov r10, [ rsp + 0xc0 ]; load m64 x750 to register64
mov byte [ rsp + 0x580 ], bl; spilling byte x311 to mem
setc bl;
cmp [ rsp + 0x4c8 ], r10
movzx r10, r9b;
adc r10, 0x0; add CF to r0's alloc
movzx r9, bl;
add r9, [ rsp + 0xa8 ]
mov rbx, [ rsp + 0x2c0 ];
rcr byte [ rsp + 0x578 ], 1
adc rbx, 0x0
add r10, [ rsp + 0x1c8 ]
mov [ rsp + 0x588 ], r9; spilling x425 to mem
mov r9, r10;
add r9, [ rsp + 0x38 ]
mov [ rsp + 0x590 ], r9; spilling x794 to mem
mov r9, [ rsp + 0x488 ];
rcr byte [ rsp + 0x580 ], 1
adc r9, 0x0
mov [ rsp + 0x598 ], rbx; spilling x141 to mem
mov rbx, [ rsp + 0x548 ]; load m64 x85 to register64
cmp rbx, [ rsp + 0x258 ]
setc bl;
cmp r9, r11
mov r11, [ rsp + 0x538 ];
adc r11, 0x0; add CF to r0's alloc
mov [ rsp + 0x5a0 ], r11; spilling x318 to mem
mov r11, [ rsp + 0x598 ]; load m64 x141 to register64
cmp r11, [ rsp + 0x140 ]
mov byte [ rsp + 0x5a8 ], bl; spilling byte x86 to mem
mov rbx, [ rsp + 0x558 ];
movzx r11, byte [ rsp + 0x368 ]; load byte memx330 to register64
lea rbx, [ rbx + r11 ]; r64+m8
mov r11, [ rsp + 0x238 ];
adc r11, 0x0; add CF to r0's alloc
cmp r10, [ rsp + 0x1c8 ]
setc r10b;
cmp [ rsp + 0x558 ], r12
movzx r12, byte [ rsp + 0x508 ];
mov [ rsp + 0x5b0 ], r11; spilling x144 to mem
movzx r11, byte [ rsp + 0x4e0 ]; load byte memx599 to register64
lea r12, [ r12 + r11 ]; r64+m8
mov r11, [ rsp + 0x108 ]; load m64 x567 to register64
lea r12, [ r12 + r11 ]; r8/64 + m8
mov [ rsp + 0x5b8 ], rbx; spilling x332 to mem
movzx rbx, r10b;
mov [ rsp + 0x5c0 ], r12; spilling x605 to mem
mov r12, [ rsp + 0x1e0 ]; load m64 x749 to register64
lea rbx, [ rbx + r12 ]; r8/64 + m8
mov r12, [ rsp + 0x70 ];
mov r10, [ rsp + 0x548 ]; load m64 x85 to register64
lea r12, [ r12 + r10 ]; r8/64 + m8
mov r10, [ rsp + 0x38 ]; load m64 x745 to register64
mov [ rsp + 0x5c8 ], r12; spilling x88 to mem
setc r12b;
cmp [ rsp + 0x590 ], r10
adc rbx, 0x0; add CF to r0's alloc
cmp [ rsp + 0x5c0 ], r11
mov r10, [ rsp + 0x5c8 ]; load m64 x88 to register64
setc r11b;
cmp r10, [ rsp + 0x70 ]
mov [ rsp + 0x5d0 ], rbx; spilling x798 to mem
movzx rbx, byte [ rsp + 0x5a8 ];
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0x5d8 ], rbx; spilling x91 to mem
mov rbx, [ rsp + 0x540 ]; load m64 x422 to register64
cmp rbx, [ rsp - 0x20 ]
mov byte [ rsp + 0x5e0 ], r12b; spilling byte x249 to mem
movzx r12, r11b;
mov rbx, [ rsp + 0x1c0 ]; load m64 x563 to register64
lea r12, [ r12 + rbx ]; r8/64 + m8
movzx rbx, byte [ rsp + 0x5e0 ];
movzx r11, byte [ rsp + 0x570 ]; load byte memx246 to register64
lea rbx, [ rbx + r11 ]; r64+m8
mov r11, [ rsp + 0x588 ];
adc r11, 0x0; add CF to r0's alloc
mov [ rsp + 0x5e8 ], r11; spilling x426 to mem
mov r11, [ rsp + 0x5d8 ];
add r11, [ rsp + 0x250 ]
mov [ rsp + 0x5f0 ], rbx; spilling x251 to mem
mov rbx, [ rsp + 0x3c8 ];
add rbx, [ rsp + 0x560 ]
mov [ rsp + 0x5f8 ], r12; spilling x611 to mem
mov r12, r11;
add r12, [ rsp + 0x100 ]
cmp r11, [ rsp + 0x250 ]
setc r11b;
cmp [ rsp + 0x5a0 ], rdx
mov rdx, [ rsp + 0x5c0 ];
mov byte [ rsp + 0x600 ], r11b; spilling byte x93 to mem
mov r11, [ rsp + 0x88 ]; load m64 x559 to register64
lea rdx, [ rdx + r11 ]; r8/64 + m8
adc rbx, 0x0; add CF to r0's alloc
cmp rdx, r11
mov r11, [ rsp + 0x5b8 ];
mov [ rsp + 0x608 ], r12; spilling x95 to mem
mov r12, [ rsp + 0x568 ]; load m64 x310 to register64
lea r11, [ r11 + r12 ]; r8/64 + m8
mov [ rsp + 0x610 ], rbx; spilling x322 to mem
mov rbx, [ rsp + 0x5b8 ]; load m64 x332 to register64
mov [ rsp + 0x618 ], r11; spilling x335 to mem
setc r11b;
cmp rbx, [ rsp + 0x558 ]
setc bl;
cmp [ rsp + 0x618 ], r12
movzx r12, byte [ rsp + 0x528 ];
mov byte [ rsp + 0x620 ], r11b; spilling byte x609 to mem
movzx r11, byte [ rsp + 0x438 ]; load byte memx155 to register64
lea r12, [ r12 + r11 ]; r64+m8
movzx r11, bl;
adc r11, 0x0; add CF to r0's alloc
mov rbx, [ rsp + 0x5f8 ];
rcr byte [ rsp + 0x620 ], 1
adc rbx, 0x0
add r12, [ rsp + 0x4d8 ]
mov [ rsp + 0x628 ], rbx; spilling x612 to mem
mov rbx, [ rsp + 0x3a0 ];
add rbx, [ rsp + 0x478 ]
mov [ rsp + 0x630 ], r11; spilling x338 to mem
mov r11, [ rsp + 0x610 ]; load m64 x322 to register64
cmp r11, [ rsp + 0x3c8 ]
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0x638 ], r12; spilling x161 to mem
mov r12, [ rsp + 0x608 ]; load m64 x95 to register64
cmp r12, [ rsp + 0x100 ]
setc r12b;
cmp rbx, [ rsp + 0x3a0 ]
mov byte [ rsp + 0x640 ], r12b; spilling byte x96 to mem
mov r12, [ rsp + 0x518 ];
adc r12, 0x0; add CF to r0's alloc
mov [ rsp + 0x648 ], r12; spilling x329 to mem
mov r12, rdi;
add r12, [ rsp + 0x638 ]
mov [ rsp + 0x650 ], r12; spilling x164 to mem
mov r12, [ rsp + 0x618 ];
add r12, [ rsp + 0x138 ]
mov [ rsp + 0x658 ], rbx; spilling x326 to mem
mov rbx, -0x760c000300030003 ; moving imm to reg
mov r11, r12;
imul r11, rbx; lox471 = x427*-0x760c000300030003
cmp r12, [ rsp + 0x618 ]
mov rbx, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x660 ], r11; spilling x471 to mem
setc r11b;
mov [ rsp + 0x668 ], rdx; spilling x608 to mem
mov rdx, r12;
imul rdx, rbx; lox489 = x427*0x60fec0aec070003
mov rbx, 0x1eabfffeb153ffff ; moving imm to reg
mov byte [ rsp + 0x670 ], r11b; spilling byte x428 to mem
mov r11, rdx; preserving value of x489 into a new reg
mov rdx, [ rsp + 0x660 ]; saving x471 in rdx.
mov [ rsp + 0x678 ], r12; spilling x427 to mem
mulx r10, r12, rbx; x490_1, x490_0<- x471 * 0x1eabfffeb153ffff (_0*_0)
mov r12, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov rbx, [ rsp + 0x678 ];
imul rbx, r12; lox481 = x427*0x2a880aa4ed33c7c3
mov r12, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x680 ], rbx; spilling x481 to mem
mov [ rsp + 0x688 ], r11; spilling x489 to mem
mulx r11, rbx, r12; x493_1, x493_0<- x471 * 0xb9feffffffffaaab (_0*_0)
mov rbx, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x690 ], r10; spilling x491 to mem
mulx r10, r12, rbx; x478_1, x478_0<- x471 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r12, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x698 ], r10; spilling x478_1 to mem
mulx r10, rbx, r12; x486_1, x486_0<- x471 * 0x6730d2a0f6b0f624 (_0*_0)
movzx rbx, byte [ rsp + 0x600 ];
add rbx, [ rsp + 0x68 ]
mov r12, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x6a0 ], r11; spilling x494 to mem
mov [ rsp + 0x6a8 ], r10; spilling x486_1 to mem
mulx r10, r11, r12; x482_1, x482_0<- x471 * 0x64774b84f38512bf (_0*_0)
rcr byte [ rsp + 0x640 ], 1
adc rbx, 0x0
mov r11, 0x4cc7c19e39811d94 ; moving imm to reg
mov r12, [ rsp + 0x678 ];
imul r12, r11; lox485 = x427*0x4cc7c19e39811d94
mov r11, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x6b0 ], rbx; spilling x99 to mem
mov rbx, [ rsp + 0x678 ];
imul rbx, r11; lox477 = x427*0x299338752f97f97b
mov r11, 0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0x6b8 ], rbx; spilling x477 to mem
mov [ rsp + 0x6c0 ], r12; spilling x485 to mem
mulx r12, rbx, r11; x474_1, x474_0<- x471 * 0x1a0111ea397fe69a (_0*_0)
mov rdx, [ rsp + 0x5f0 ];
add rdx, [ rsp + 0x650 ]
cmp [ rsp + 0x650 ], rdi
mov rdi, rdx;
lea rdi, [ rdi + rbp ]
mov rbx, rdi;
mov r11, [ rsp + 0x630 ]; load m64 x338 to register64
lea rbx, [ rbx + r11 ]; r8/64 + m8
mov r11, rbx;
lea r11, [ r11 + r9 ]
mov [ rsp + 0x6c8 ], r10; spilling x482_1 to mem
mov r10, r11;
mov [ rsp + 0x6d0 ], r12; spilling x474_1 to mem
movzx r12, byte [ rsp + 0x670 ]; load byte memx428 to register64
lea r10, [ r10 + r12 ]; r64+m8
setc r12b;
cmp rdx, [ rsp + 0x650 ]
mov rdx, [ rsp + 0x6a8 ];
mov byte [ rsp + 0x6d8 ], r12b; spilling byte x165 to mem
setc r12b;
cmp rdi, rbp
mov rbp, r10;
lea rbp, [ rbp + r13 ]
mov [ rsp + 0x6e0 ], rdx; spilling x488 to mem
mov rdx, [ rsp + 0x6d0 ];
mov [ rsp + 0x6e8 ], rdx; spilling x475 to mem
mov rdx, [ rsp + 0x6c8 ];
mov [ rsp + 0x6f0 ], rdx; spilling x484 to mem
setc dl;
cmp rbx, rdi
mov rdi, 0x48669f39fb24c32 ; moving imm to reg
setc bl;
mov [ rsp + 0x6f8 ], rbp; spilling x433 to mem
mov rbp, [ rsp + 0x678 ];
imul rbp, rdi; lox472 = x427*0x48669f39fb24c32
cmp [ rsp + 0x678 ], 0x0
setne dil; setCC x516 to reg (rdi)
cmp r11, r9
movzx r9, dl;
movzx r12, r12b
lea r9, [ r9 + r12 ]
mov r12, [ rsp + 0x688 ];
mov rdx, [ rsp + 0x6a0 ]; load m64 x495 to register64
lea r12, [ r12 + rdx ]; r8/64 + m8
mov [ rsp + 0x700 ], r9; spilling x258 to mem
setc r9b;
cmp r12, rdx
mov rdx, [ rsp + 0x698 ];
mov byte [ rsp + 0x708 ], bl; spilling byte x340 to mem
movzx rbx, dil;
mov byte [ rsp + 0x710 ], r9b; spilling byte x343 to mem
mov r9, [ rsp + 0x6f8 ]; load m64 x433 to register64
lea rbx, [ rbx + r9 ]; r8/64 + m8
mov rdi, [ rsp + 0x6c0 ];
mov [ rsp + 0x718 ], rbp; spilling x472 to mem
mov rbp, [ rsp + 0x690 ]; load m64 x492 to register64
lea rdi, [ rdi + rbp ]; r8/64 + m8
adc rdi, 0x0; add CF to r0's alloc
mov rbp, [ rsp + 0x638 ]; load m64 x161 to register64
cmp rbp, [ rsp + 0x4d8 ]
movzx rbp, byte [ rsp + 0x6d8 ];
adc rbp, 0x0; add CF to r0's alloc
cmp r10, r11
setc r11b;
cmp r9, r13
mov r13, rbx;
lea r13, [ r13 + r12 ]
setc r10b;
cmp rbx, r9
setc r9b;
cmp r13, r12
movzx r12, r9b;
adc r12, 0x0; add CF to r0's alloc
mov rbx, r13;
add rbx, [ rsp + 0x60 ]
mov r9, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x720 ], r12; spilling x524 to mem
mov r12, rbx;
imul r12, r9; lox671 = x613*0x4cc7c19e39811d94
add rbp, [ rsp + 0x5c8 ]
mov r9, rbp;
lea r9, [ r9 + rcx ]
cmp rbp, [ rsp + 0x5c8 ]
setc bpl;
cmp r9, rcx
mov rcx, [ rsp + 0x718 ]; load m64 x472 to register64
lea rdx, [ rdx + rcx ]; r8/64 + m8
mov byte [ rsp + 0x728 ], bpl; spilling byte x169 to mem
mov rbp, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x730 ], rdx; spilling x511 to mem
setc dl;
mov [ rsp + 0x738 ], r12; spilling x671 to mem
mov r12, rbx;
imul r12, rbp; lox658 = x613*0x48669f39fb24c32
cmp rbx, 0x0
setne bpl; setCC x702 to reg (rbp)
cmp rbx, r13
mov r13, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x740 ], r12; spilling x658 to mem
setc r12b;
mov byte [ rsp + 0x748 ], bpl; spilling byte x702 to mem
mov rbp, rbx;
imul rbp, r13; lox667 = x613*0x2a880aa4ed33c7c3
mov r13, [ rsp + 0x680 ];
add r13, [ rsp + 0x6e0 ]
cmp rdi, [ rsp + 0x6c0 ]
mov byte [ rsp + 0x750 ], r12b; spilling byte x614 to mem
mov r12, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x758 ], rbp; spilling x667 to mem
setc bpl;
mov byte [ rsp + 0x760 ], dl; spilling byte x172 to mem
mov rdx, rbx;
imul rdx, r12; lox663 = x613*0x299338752f97f97b
movzx r12, bpl;
lea r12, [ r12 + r13 ]
mov r13, -0x760c000300030003 ; moving imm to reg
mov rbp, rbx;
imul rbp, r13; lox657 = x613*-0x760c000300030003
mov r13, 0x64774b84f38512bf ; moving imm to reg
xchg rdx, r13; 0x64774b84f38512bf, swapping with x663, which is currently in rdx
mov byte [ rsp + 0x768 ], r11b; spilling byte x431 to mem
mov byte [ rsp + 0x770 ], r10b; spilling byte x434 to mem
mulx r10, r11, rbp; x668_1, x668_0<- x657 * 0x64774b84f38512bf (_0*_0)
mov r11, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov rdx, r11; 0x4b1ba7b6434bacd7 to rdx
mov [ rsp + 0x778 ], r13; spilling x663 to mem
mulx r13, r11, rbp; x664_1, x664_0<- x657 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r11, 0x1eabfffeb153ffff ; moving imm to reg
mov rdx, rbp; x657 to rdx
mov [ rsp + 0x780 ], r12; spilling x504 to mem
mulx r12, rbp, r11; x676_1, x676_0<- x657 * 0x1eabfffeb153ffff (_0*_0)
mov rbp, [ rsp + 0x6b8 ];
add rbp, [ rsp + 0x6f0 ]
movzx r11, byte [ rsp + 0x710 ];
rcr byte [ rsp + 0x708 ], 1
adc r11, 0x0
mov [ rsp + 0x788 ], r13; spilling x666 to mem
mov r13, r9;
add r13, [ rsp + 0x700 ]
cmp r13, r9
mov r9, [ rsp + 0x2e0 ]; load m64 x223 to register64
lea r13, [ r13 + r9 ]; r8/64 + m8
mov [ rsp + 0x790 ], r12; spilling x676_1 to mem
mov r12, 0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0x798 ], r10; spilling x670 to mem
mov [ rsp + 0x7a0 ], rbp; spilling x507 to mem
mulx rbp, r10, r12; x660_1, x660_0<- x657 * 0x1a0111ea397fe69a (_0*_0)
lea r11, [ r11 + r13 ]
mov r10, [ rsp + 0x780 ]; load m64 x504 to register64
setc r12b;
cmp r10, [ rsp + 0x680 ]
mov byte [ rsp + 0x7a8 ], r12b; spilling byte x260 to mem
mov r12, [ rsp + 0x7a0 ];
adc r12, 0x0; add CF to r0's alloc
mov [ rsp + 0x7b0 ], rbp; spilling x660_1 to mem
mov rbp, r11;
add rbp, [ rsp + 0x5a0 ]
cmp rbp, [ rsp + 0x5a0 ]
mov [ rsp + 0x7b8 ], r12; spilling x508 to mem
mov r12, [ rsp + 0x778 ];
mov [ rsp + 0x7c0 ], rbp; spilling x349 to mem
mov rbp, [ rsp + 0x798 ]; load m64 x670 to register64
lea r12, [ r12 + rbp ]; r8/64 + m8
mov rbp, [ rsp + 0x7b8 ]; load m64 x508 to register64
mov [ rsp + 0x7c8 ], r12; spilling x693 to mem
setc r12b;
cmp rbp, [ rsp + 0x6b8 ]
mov byte [ rsp + 0x7d0 ], r12b; spilling byte x350 to mem
mov r12, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x7d8 ], r11; spilling x346 to mem
mulx r11, rbp, r12; x679_1, x679_0<- x657 * 0xb9feffffffffaaab (_0*_0)
mov rbp, [ rsp + 0x790 ];
setc r12b;
cmp [ rsp + 0x7d8 ], r13
mov byte [ rsp + 0x7e0 ], r12b; spilling byte x509 to mem
mov r12, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x7e8 ], r11; spilling x680 to mem
mov [ rsp + 0x7f0 ], rbp; spilling x678 to mem
mulx rbp, r11, r12; x672_1, x672_0<- x657 * 0x6730d2a0f6b0f624 (_0*_0)
movzx rdx, byte [ rsp + 0x770 ];
movzx r11, byte [ rsp + 0x768 ]; load byte memx431 to register64
lea rdx, [ rdx + r11 ]; r64+m8
movzx r11, byte [ rsp + 0x7d0 ];
adc r11, 0x0; add CF to r0's alloc
mov r12, [ rsp + 0x738 ];
add r12, [ rsp + 0x7f0 ]
add rdx, [ rsp + 0x7c0 ]
mov [ rsp + 0x7f8 ], r11; spilling x352 to mem
mov r11, rdx;
add r11, [ rsp + 0x278 ]
mov [ rsp + 0x800 ], r12; spilling x685 to mem
mov r12, [ rsp + 0x7b0 ];
cmp rdx, [ rsp + 0x7c0 ]
mov rdx, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x808 ], rbp; spilling x673 to mem
setc bpl;
imul rbx, rdx; lox675 = x613*0x60fec0aec070003
mov rdx, r11;
add rdx, [ rsp + 0x720 ]
add rbx, [ rsp + 0x7e8 ]
mov [ rsp + 0x810 ], r12; spilling x662 to mem
mov r12, [ rsp + 0x730 ];
rcr byte [ rsp + 0x7e0 ], 1
adc r12, 0x0
cmp rdx, r11
mov byte [ rsp + 0x818 ], bpl; spilling byte x438 to mem
setc bpl;
cmp r12, rcx
setc cl;
cmp r11, [ rsp + 0x278 ]
movzx r11, byte [ rsp + 0x760 ];
mov byte [ rsp + 0x820 ], bpl; spilling byte x526 to mem
movzx rbp, byte [ rsp + 0x728 ]; load byte memx169 to register64
lea r11, [ r11 + rbp ]; r64+m8
setc bpl;
cmp rbx, [ rsp + 0x7e8 ]
mov byte [ rsp + 0x828 ], bpl; spilling byte x441 to mem
mov rbp, [ rsp + 0x800 ];
adc rbp, 0x0; add CF to r0's alloc
add r11, [ rsp + 0x608 ]
mov [ rsp + 0x830 ], rbp; spilling x686 to mem
mov rbp, r11;
add rbp, [ rsp + 0x598 ]
cmp r11, [ rsp + 0x608 ]
setc r11b;
cmp r13, r9
movzx r9, cl;
mov r13, [ rsp + 0x6e8 ]; load m64 x476 to register64
lea r9, [ r9 + r13 ]; r8/64 + m8
mov rcx, [ rsp + 0x758 ];
mov r13, [ rsp + 0x808 ]; load m64 x674 to register64
lea rcx, [ rcx + r13 ]; r8/64 + m8
mov r13, [ rsp + 0x738 ]; load m64 x671 to register64
mov [ rsp + 0x838 ], r9; spilling x515 to mem
setc r9b;
cmp [ rsp + 0x830 ], r13
lea rdx, [ rdx + rdi ]
movzx r13, r9b;
mov [ rsp + 0x840 ], rcx; spilling x689 to mem
movzx rcx, byte [ rsp + 0x7a8 ]; load byte memx260 to register64
lea r13, [ r13 + rcx ]; r64+m8
lea r13, [ r13 + rbp ]
movzx rcx, byte [ rsp + 0x828 ];
movzx r9, byte [ rsp + 0x818 ]; load byte memx438 to register64
lea rcx, [ rcx + r9 ]; r64+m8
setc r9b;
cmp rdx, rdi
mov rdi, r13;
lea rdi, [ rdi + rsi ]
mov byte [ rsp + 0x848 ], r9b; spilling byte x687 to mem
mov r9, rdx;
mov [ rsp + 0x850 ], rcx; spilling x443 to mem
movzx rcx, byte [ rsp + 0x750 ]; load byte memx614 to register64
lea r9, [ r9 + rcx ]; r64+m8
movzx rcx, byte [ rsp + 0x820 ];
adc rcx, 0x0; add CF to r0's alloc
mov [ rsp + 0x858 ], rcx; spilling x531 to mem
mov rcx, rdi;
add rcx, [ rsp + 0x7f8 ]
cmp r13, rbp
setc r13b;
cmp rbp, [ rsp + 0x598 ]
setc bpl;
cmp r9, rdx
movzx rdx, bpl;
movzx r11, r11b
lea rdx, [ rdx + r11 ]
setc r11b;
cmp rcx, rdi
mov rbp, [ rsp + 0x610 ]; load m64 x322 to register64
lea rcx, [ rcx + rbp ]; r8/64 + m8
mov byte [ rsp + 0x860 ], r11b; spilling byte x617 to mem
mov r11, rcx;
mov [ rsp + 0x868 ], rdx; spilling x181 to mem
mov rdx, [ rsp + 0x850 ]; load m64 x443 to register64
lea r11, [ r11 + rdx ]; r8/64 + m8
setc dl;
cmp rdi, rsi
movzx rsi, r13b;
adc rsi, 0x0; add CF to r0's alloc
mov rdi, r11;
add rdi, [ rsp + 0x358 ]
cmp r11, rcx
setc r13b;
cmp rcx, rbp
mov rbp, [ rsp + 0x840 ];
movzx rcx, byte [ rsp + 0x848 ]; load byte memx687 to register64
lea rbp, [ rbp + rcx ]; r64+m8
setc cl;
cmp rdi, [ rsp + 0x358 ]
mov r11, [ rsp + 0x290 ]; load m64 x584 to register64
lea r9, [ r9 + r11 ]; r8/64 + m8
mov byte [ rsp + 0x870 ], r13b; spilling byte x445 to mem
mov r13, r9;
mov [ rsp + 0x878 ], rsi; spilling x272 to mem
movzx rsi, byte [ rsp + 0x748 ]; load byte memx702 to register64
lea r13, [ r13 + rsi ]; r64+m8
mov rsi, rdi;
mov [ rsp + 0x880 ], rbp; spilling x690 to mem
mov rbp, [ rsp + 0x858 ]; load m64 x531 to register64
lea rsi, [ rsi + rbp ]; r8/64 + m8
setc bpl;
cmp r9, r11
mov r11, [ rsp + 0x868 ];
mov [ rsp + 0x888 ], rsi; spilling x532 to mem
mov rsi, [ rsp + 0x6b0 ]; load m64 x99 to register64
lea r11, [ r11 + rsi ]; r8/64 + m8
mov byte [ rsp + 0x890 ], bpl; spilling byte x448 to mem
movzx rbp, byte [ rsp + 0x860 ];
adc rbp, 0x0; add CF to r0's alloc
cmp r11, rsi
mov rsi, r13;
lea rsi, [ rsi + rbx ]
mov [ rsp + 0x898 ], rbp; spilling x622 to mem
movzx rbp, cl;
movzx rdx, dl
lea rbp, [ rbp + rdx ]
setc dl;
cmp r13, r9
mov rcx, rsi;
mov r9, [ rsp + 0xd8 ]; load m64 x766 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
setc r9b;
cmp rcx, rsi
mov r13, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x8a0 ], rbp; spilling x359 to mem
setc bpl;
mov byte [ rsp + 0x8a8 ], dl; spilling byte x183 to mem
mov rdx, rcx;
imul rdx, r13; lox849 = x799*0x299338752f97f97b
mov r13, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov byte [ rsp + 0x8b0 ], bpl; spilling byte x800 to mem
mov rbp, rcx;
imul rbp, r13; lox853 = x799*0x2a880aa4ed33c7c3
mov r13, -0x760c000300030003 ; moving imm to reg
mov [ rsp + 0x8b8 ], rdx; spilling x849 to mem
mov rdx, rcx;
imul rdx, r13; lox843 = x799*-0x760c000300030003
mov r13, 0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0x8c0 ], rbp; spilling x853 to mem
mov byte [ rsp + 0x8c8 ], r9b; spilling byte x705 to mem
mulx r9, rbp, r13; x846_1, x846_0<- x843 * 0x1a0111ea397fe69a (_0*_0)
mov rbp, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x8d0 ], r9; spilling x846_1 to mem
mulx r9, r13, rbp; x862_1, x862_0<- x843 * 0x1eabfffeb153ffff (_0*_0)
mov r13, 0x4cc7c19e39811d94 ; moving imm to reg
mov rbp, rcx;
imul rbp, r13; lox857 = x799*0x4cc7c19e39811d94
mov r13, [ rsp + 0x758 ]; load m64 x667 to register64
cmp [ rsp + 0x880 ], r13
mov r13, [ rsp + 0x7c8 ];
adc r13, 0x0; add CF to r0's alloc
mov [ rsp + 0x8d8 ], rbp; spilling x857 to mem
mov rbp, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x8e0 ], r13; spilling x694 to mem
mov [ rsp + 0x8e8 ], r9; spilling x862_1 to mem
mulx r9, r13, rbp; x858_1, x858_0<- x843 * 0x6730d2a0f6b0f624 (_0*_0)
mov r13, 0x48669f39fb24c32 ; moving imm to reg
mov rbp, rcx;
imul rbp, r13; lox844 = x799*0x48669f39fb24c32
cmp rcx, 0x0
setne r13b; setCC x888 to reg (r13)
add r11, [ rsp + 0x5b0 ]
mov byte [ rsp + 0x8f0 ], r13b; spilling byte x888 to mem
mov r13, [ rsp + 0x8d0 ];
cmp rsi, rbx
mov rbx, 0x60fec0aec070003 ; moving imm to reg
setc sil;
imul rcx, rbx; lox861 = x799*0x60fec0aec070003
movzx rbx, sil;
rcr byte [ rsp + 0x8c8 ], 1
adc rbx, 0x0
mov rsi, [ rsp + 0x530 ];
rcr byte [ rsp + 0x8a8 ], 1
adc rsi, 0x0
mov [ rsp + 0x8f8 ], rbp; spilling x844 to mem
mov rbp, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x900 ], rbx; spilling x710 to mem
mov [ rsp + 0x908 ], rsi; spilling x279 to mem
mulx rsi, rbx, rbp; x865_1, x865_0<- x843 * 0xb9feffffffffaaab (_0*_0)
cmp r11, [ rsp + 0x5b0 ]
mov rbx, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x910 ], r9; spilling x859 to mem
mulx r9, rbp, rbx; x854_1, x854_0<- x843 * 0x64774b84f38512bf (_0*_0)
mov rbp, r11;
mov rbx, [ rsp + 0x878 ]; load m64 x272 to register64
lea rbp, [ rbp + rbx ]; r8/64 + m8
lea rcx, [ rcx + rsi ]
mov rbx, rbp;
mov [ rsp + 0x918 ], r9; spilling x854_1 to mem
mov r9, [ rsp + 0x4a8 ]; load m64 x237 to register64
lea rbx, [ rbx + r9 ]; r8/64 + m8
mov [ rsp + 0x920 ], rcx; spilling x868 to mem
setc cl;
cmp rbx, r9
mov r9, [ rsp + 0x8e8 ];
mov [ rsp + 0x928 ], r13; spilling x848 to mem
movzx r13, cl;
mov [ rsp + 0x930 ], r9; spilling x863 to mem
mov r9, [ rsp + 0x908 ]; load m64 x279 to register64
lea r13, [ r13 + r9 ]; r8/64 + m8
mov r9, [ rsp + 0x740 ];
mov rcx, [ rsp + 0x788 ]; load m64 x666 to register64
lea r9, [ r9 + rcx ]; r8/64 + m8
mov rcx, rbx;
mov [ rsp + 0x938 ], r9; spilling x697 to mem
mov r9, [ rsp + 0x8a0 ]; load m64 x359 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
setc r9b;
cmp rcx, rbx
setc bl;
cmp [ rsp + 0x920 ], rsi
mov rsi, [ rsp + 0x8e0 ]; load m64 x694 to register64
mov byte [ rsp + 0x940 ], bl; spilling byte x361 to mem
setc bl;
cmp rsi, [ rsp + 0x778 ]
mov byte [ rsp + 0x948 ], bl; spilling byte x869 to mem
setc bl;
cmp rbp, r11
mov r11, [ rsp + 0x8c0 ];
mov rbp, [ rsp + 0x910 ]; load m64 x860 to register64
lea r11, [ r11 + rbp ]; r8/64 + m8
adc r13, 0x0; add CF to r0's alloc
movzx rbp, r9b;
lea rbp, [ rbp + r13 ]
mov r9, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x950 ], r11; spilling x875 to mem
mulx r11, r13, r9; x850_1, x850_0<- x843 * 0x4b1ba7b6434bacd7 (_0*_0)
movzx rdx, bl;
add rdx, [ rsp + 0x938 ]
mov rbx, [ rsp + 0x8d8 ];
add rbx, [ rsp + 0x930 ]
cmp rbp, [ rsp + 0x530 ]
movzx r13, byte [ rsp + 0x890 ];
movzx r9, byte [ rsp + 0x870 ]; load byte memx445 to register64
lea r13, [ r13 + r9 ]; r64+m8
mov r9, [ rsp + 0x658 ]; load m64 x326 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
mov [ rsp + 0x958 ], r11; spilling x852 to mem
movzx r11, byte [ rsp + 0x948 ]; load byte memx869 to register64
lea rbx, [ rbx + r11 ]; r64+m8
lea r13, [ r13 + rcx ]
mov r11, r13;
mov [ rsp + 0x960 ], rdx; spilling x698 to mem
mov rdx, [ rsp + 0x4d0 ]; load m64 x415 to register64
lea r11, [ r11 + rdx ]; r8/64 + m8
mov [ rsp + 0x968 ], r11; spilling x454 to mem
setc r11b;
cmp rbx, [ rsp + 0x8d8 ]
mov byte [ rsp + 0x970 ], r11b; spilling byte x283 to mem
setc r11b;
cmp r13, rcx
movzx r13, r11b;
mov [ rsp + 0x978 ], rbx; spilling x872 to mem
mov rbx, [ rsp + 0x950 ]; load m64 x875 to register64
lea r13, [ r13 + rbx ]; r8/64 + m8
setc bl;
cmp [ rsp + 0x888 ], rdi
setc dil;
cmp r13, [ rsp + 0x8c0 ]
mov r11, [ rsp + 0x918 ];
mov byte [ rsp + 0x980 ], dil; spilling byte x533 to mem
mov rdi, [ rsp + 0x960 ]; load m64 x698 to register64
mov byte [ rsp + 0x988 ], bl; spilling byte x452 to mem
setc bl;
cmp rdi, [ rsp + 0x740 ]
mov byte [ rsp + 0x990 ], bl; spilling byte x877 to mem
mov rbx, [ rsp + 0x810 ];
adc rbx, 0x0; add CF to r0's alloc
add r11, [ rsp + 0x8b8 ]
cmp [ rsp + 0x968 ], rdx
mov rdx, r10;
mov [ rsp + 0x998 ], rbx; spilling x701 to mem
mov rbx, [ rsp + 0x888 ]; load m64 x532 to register64
lea rdx, [ rdx + rbx ]; r8/64 + m8
movzx rbx, byte [ rsp + 0x990 ]; load byte memx877 to register64
lea r11, [ r11 + rbx ]; r64+m8
mov rbx, rdx;
mov [ rsp + 0x9a0 ], r11; spilling x880 to mem
mov r11, [ rsp + 0x898 ]; load m64 x622 to register64
lea rbx, [ rbx + r11 ]; r8/64 + m8
mov r11, rbx;
mov [ rsp + 0x9a8 ], rdx; spilling x535 to mem
mov rdx, [ rsp + 0x388 ]; load m64 x588 to register64
lea r11, [ r11 + rdx ]; r8/64 + m8
mov [ rsp + 0x9b0 ], rbx; spilling x623 to mem
mov rbx, r11;
mov rdi, [ rsp + 0x900 ]; load m64 x710 to register64
lea rbx, [ rbx + rdi ]; r8/64 + m8
mov rdi, [ rsp + 0x9b0 ]; load m64 x623 to register64
mov [ rsp + 0x9b8 ], rbx; spilling x711 to mem
setc bl;
cmp rdi, [ rsp + 0x9a8 ]
setc dil;
cmp [ rsp + 0x9b8 ], r11
mov byte [ rsp + 0x9c0 ], dil; spilling byte x624 to mem
mov rdi, [ rsp + 0x9a0 ]; load m64 x880 to register64
mov byte [ rsp + 0x9c8 ], bl; spilling byte x455 to mem
setc bl;
cmp rdi, [ rsp + 0x8b8 ]
mov byte [ rsp + 0x9d0 ], bl; spilling byte x712 to mem
mov rbx, [ rsp + 0x9b8 ];
mov rdi, [ rsp + 0x830 ]; load m64 x686 to register64
lea rbx, [ rbx + rdi ]; r8/64 + m8
mov [ rsp + 0x9d8 ], r11; spilling x626 to mem
mov r11, rbx;
mov [ rsp + 0x9e0 ], r13; spilling x876 to mem
movzx r13, byte [ rsp + 0x8b0 ]; load byte memx800 to register64
lea r11, [ r11 + r13 ]; r64+m8
setc r13b;
cmp rcx, r9
movzx r9, byte [ rsp + 0x940 ];
adc r9, 0x0; add CF to r0's alloc
mov rcx, [ rsp + 0x8f8 ];
add rcx, [ rsp + 0x958 ]
mov [ rsp + 0x9e8 ], r11; spilling x802 to mem
movzx r11, r13b;
lea r11, [ r11 + rcx ]
lea r9, [ r9 + rbp ]
mov r13, [ rsp + 0x3d8 ];
rcr byte [ rsp + 0x480 ], 1
adc r13, 0x0
cmp [ rsp + 0x9e8 ], rbx
setc cl;
cmp [ rsp + 0x9a8 ], r10
movzx r10, byte [ rsp + 0x9c8 ];
mov [ rsp + 0x9f0 ], r13; spilling x984 to mem
movzx r13, byte [ rsp + 0x988 ]; load byte memx452 to register64
lea r10, [ r10 + r13 ]; r64+m8
mov r13, r14;
mov [ rsp + 0x9f8 ], r11; spilling x884 to mem
mov r11, [ rsp + 0x9e8 ]; load m64 x802 to register64
lea r13, [ r13 + r11 ]; r8/64 + m8
mov r11, r13;
mov [ rsp + 0xa00 ], r10; spilling x457 to mem
movzx r10, byte [ rsp + 0x8f0 ]; load byte memx888 to register64
lea r11, [ r11 + r10 ]; r64+m8
movzx r10, byte [ rsp + 0x980 ];
adc r10, 0x0; add CF to r0's alloc
add r10, [ rsp + 0x968 ]
mov [ rsp + 0xa08 ], r10; spilling x539 to mem
mov r10, r11;
add r10, [ rsp + 0x920 ]
cmp r9, rbp
setc bpl;
cmp r13, r14
setc r14b;
cmp r11, r13
mov r13, [ rsp + 0x648 ]; load m64 x329 to register64
lea r9, [ r9 + r13 ]; r8/64 + m8
movzx r11, r14b;
movzx rcx, cl
lea r11, [ r11 + rcx ]
mov rcx, [ rsp + 0x5e8 ];
movzx r14, byte [ rsp + 0x970 ]; load byte memx283 to register64
lea rcx, [ rcx + r14 ]; r64+m8
mov r14, r9;
mov [ rsp + 0xa10 ], r11; spilling x808 to mem
mov r11, [ rsp + 0xa00 ]; load m64 x457 to register64
lea r14, [ r14 + r11 ]; r8/64 + m8
movzx r11, bpl;
lea r11, [ r11 + rcx ]
mov rbp, [ rsp + 0x9f8 ]; load m64 x884 to register64
setc cl;
cmp rbp, [ rsp + 0x8f8 ]
mov byte [ rsp + 0xa18 ], cl; spilling byte x891 to mem
mov rcx, r14;
mov [ rsp + 0xa20 ], r11; spilling x465 to mem
mov r11, [ rsp + 0x540 ]; load m64 x422 to register64
lea rcx, [ rcx + r11 ]; r8/64 + m8
mov [ rsp + 0xa28 ], rcx; spilling x461 to mem
mov rcx, [ rsp + 0xa08 ];
mov [ rsp + 0xa30 ], r10; spilling x893 to mem
mov r10, [ rsp + 0x7b8 ]; load m64 x508 to register64
lea rcx, [ rcx + r10 ]; r8/64 + m8
mov [ rsp + 0xa38 ], rcx; spilling x542 to mem
mov rcx, [ rsp + 0xa30 ];
mov [ rsp + 0xa40 ], r14; spilling x458 to mem
mov r14, [ rsp + 0x160 ]; load m64 x952 to register64
lea rcx, [ rcx + r14 ]; r8/64 + m8
mov r14, -0x760c000300030003 ; moving imm to reg
setc bpl;
mov [ rsp + 0xa48 ], r9; spilling x370 to mem
mov r9, rcx;
imul r9, r14; lox1029 = x985*-0x760c000300030003
mov r14, 0xb9feffffffffaaab ; moving imm to reg
xchg rdx, r14; 0xb9feffffffffaaab, swapping with x588, which is currently in rdx
mov byte [ rsp + 0xa50 ], bpl; spilling byte x885 to mem
mov [ rsp + 0xa58 ], rcx; spilling x985 to mem
mulx rcx, rbp, r9; x1051_1, x1051_0<- x1029 * 0xb9feffffffffaaab (_0*_0)
mov rbp, [ rsp + 0xa30 ]; load m64 x893 to register64
cmp [ rsp + 0xa58 ], rbp
mov rdx, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0xa60 ], rcx; spilling x1051_1 to mem
mulx rbp, rcx, r9; x1048_1, x1048_0<- x1029 * 0x1eabfffeb153ffff (_0*_0)
setc cl;
cmp [ rsp + 0xa38 ], r10
mov r10, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov rdx, r9; x1029 to rdx
mov byte [ rsp + 0xa68 ], cl; spilling byte x986 to mem
mulx rcx, r9, r10; x1036_1, x1036_0<- x1029 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r9, 0x2a880aa4ed33c7c3 ; moving imm to reg
setc r10b;
mov [ rsp + 0xa70 ], rbp; spilling x1049 to mem
mov rbp, [ rsp + 0xa58 ];
imul rbp, r9; lox1039 = x985*0x2a880aa4ed33c7c3
mov r9, [ rsp + 0xa40 ]; load m64 x458 to register64
cmp r9, [ rsp + 0xa48 ]
setc r9b;
cmp rbx, rdi
mov rdi, 0x60fec0aec070003 ; moving imm to reg
setc bl;
mov byte [ rsp + 0xa78 ], r9b; spilling byte x459 to mem
mov r9, [ rsp + 0xa58 ];
imul r9, rdi; lox1047 = x985*0x60fec0aec070003
cmp [ rsp + 0xa28 ], r11
movzx r11, bl;
movzx rdi, byte [ rsp + 0x9d0 ]; load byte memx712 to register64
lea r11, [ r11 + rdi ]; r64+m8
setc dil;
cmp [ rsp + 0xa58 ], 0x0
setne bl; setCC x1074 to reg (rbx)
cmp [ rsp + 0xa48 ], r13
mov r13, 0x1a0111ea397fe69a ; moving imm to reg
mov byte [ rsp + 0xa80 ], bl; spilling byte x1074 to mem
mov byte [ rsp + 0xa88 ], dil; spilling byte x462 to mem
mulx rdi, rbx, r13; x1032_1, x1032_0<- x1029 * 0x1a0111ea397fe69a (_0*_0)
setc bl;
cmp [ rsp + 0x9d8 ], r14
movzx r14, bl;
mov r13, [ rsp + 0xa20 ]; load m64 x465 to register64
lea r14, [ r14 + r13 ]; r8/64 + m8
movzx r13, byte [ rsp + 0x9c0 ];
adc r13, 0x0; add CF to r0's alloc
add r13, [ rsp + 0xa38 ]
mov rbx, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0xa90 ], r14; spilling x466 to mem
mov r14, [ rsp + 0xa58 ];
imul r14, rbx; lox1030 = x985*0x48669f39fb24c32
mov rbx, [ rsp + 0x920 ]; load m64 x868 to register64
cmp [ rsp + 0xa30 ], rbx
mov rbx, r13;
mov [ rsp + 0xa98 ], rbp; spilling x1039 to mem
mov rbp, [ rsp + 0x420 ]; load m64 x594 to register64
lea rbx, [ rbx + rbp ]; r8/64 + m8
mov [ rsp + 0xaa0 ], r9; spilling x1047 to mem
movzx r9, byte [ rsp + 0xa18 ];
adc r9, 0x0; add CF to r0's alloc
lea r11, [ r11 + rbx ]
mov [ rsp + 0xaa8 ], r14; spilling x1030 to mem
mov r14, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0xab0 ], r9; spilling x896 to mem
mov [ rsp + 0xab8 ], r11; spilling x718 to mem
mulx r11, r9, r14; x1044_1, x1044_0<- x1029 * 0x6730d2a0f6b0f624 (_0*_0)
mov r9, [ rsp + 0xa08 ]; load m64 x539 to register64
cmp r9, [ rsp + 0x968 ]
mov r9, [ rsp + 0xa60 ];
movzx r14, r10b;
adc r14, 0x0; add CF to r0's alloc
cmp rbx, rbp
setc bpl;
cmp [ rsp + 0xab8 ], rbx
mov r10, 0x299338752f97f97b ; moving imm to reg
setc bl;
mov [ rsp + 0xac0 ], rdi; spilling x1033 to mem
mov rdi, [ rsp + 0xa58 ];
imul rdi, r10; lox1035 = x985*0x299338752f97f97b
mov r10, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0xac8 ], rdi; spilling x1035 to mem
mov byte [ rsp + 0xad0 ], bl; spilling byte x719 to mem
mulx rbx, rdi, r10; x1040_1, x1040_0<- x1029 * 0x64774b84f38512bf (_0*_0)
mov rdx, [ rsp + 0xab8 ];
add rdx, [ rsp + 0x880 ]
mov rdi, rdx;
add rdi, [ rsp + 0xa10 ]
cmp rdi, rdx
mov r10, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0xad8 ], rbx; spilling x1040_1 to mem
setc bl;
mov [ rsp + 0xae0 ], r11; spilling x1046 to mem
mov r11, [ rsp + 0xa58 ];
imul r11, r10; lox1043 = x985*0x4cc7c19e39811d94
cmp r13, [ rsp + 0xa38 ]
mov r13, [ rsp + 0x298 ]; load m64 x774 to register64
lea rdi, [ rdi + r13 ]; r8/64 + m8
movzx r10, bpl;
adc r10, 0x0; add CF to r0's alloc
cmp rdi, r13
mov r13, rdi;
mov rbp, [ rsp + 0xab0 ]; load m64 x896 to register64
lea r13, [ r13 + rbp ]; r8/64 + m8
mov rbp, [ rsp + 0xaa8 ]; load m64 x1030 to register64
lea rcx, [ rcx + rbp ]; r8/64 + m8
mov [ rsp + 0xae8 ], rcx; spilling x1069 to mem
mov rcx, [ rsp + 0xa28 ]; load m64 x461 to register64
lea r14, [ r14 + rcx ]; r8/64 + m8
mov [ rsp + 0xaf0 ], r11; spilling x1043 to mem
mov r11, r14;
lea r11, [ r11 + r12 ]
mov [ rsp + 0xaf8 ], r13; spilling x897 to mem
mov r13, r9;
mov [ rsp + 0xb00 ], r10; spilling x636 to mem
mov r10, [ rsp + 0xaa0 ]; load m64 x1047 to register64
lea r13, [ r13 + r10 ]; r8/64 + m8
movzx r10, bl;
adc r10, 0x0; add CF to r0's alloc
mov rbx, [ rsp + 0xa98 ];
add rbx, [ rsp + 0xae0 ]
cmp rdx, [ rsp + 0x880 ]
setc dl;
cmp r11, r12
mov r12, r11;
mov [ rsp + 0xb08 ], rbx; spilling x1061 to mem
mov rbx, [ rsp + 0xb00 ]; load m64 x636 to register64
lea r12, [ r12 + rbx ]; r8/64 + m8
movzx rbx, dl;
mov [ rsp + 0xb10 ], r13; spilling x1054 to mem
movzx r13, byte [ rsp + 0xad0 ]; load byte memx719 to register64
lea rbx, [ rbx + r13 ]; r64+m8
setc r13b;
cmp r12, r11
mov r11, [ rsp + 0xa90 ];
movzx rdx, byte [ rsp + 0xa78 ]; load byte memx459 to register64
lea r11, [ r11 + rdx ]; r64+m8
movzx rdx, byte [ rsp + 0xa88 ]; load byte memx462 to register64
lea r11, [ r11 + rdx ]; r64+m8
setc dl;
cmp r14, rcx
mov rcx, [ rsp + 0x4a0 ]; load m64 x601 to register64
lea r12, [ r12 + rcx ]; r8/64 + m8
setc r14b;
cmp r12, rcx
movzx rcx, r13b;
movzx r14, r14b
lea rcx, [ rcx + r14 ]
lea rbx, [ rbx + r12 ]
lea rcx, [ rcx + r11 ]
setc r13b;
cmp rbx, r12
movzx r14, r13b;
movzx rdx, dl
lea r14, [ r14 + rdx ]
setc dl;
cmp r11, [ rsp + 0x5e8 ]
mov r12, [ rsp + 0x628 ];
adc r12, 0x0; add CF to r0's alloc
mov r13, rcx;
add r13, [ rsp + 0x838 ]
cmp [ rsp + 0xaf8 ], rdi
lea rbx, [ rbx + rsi ]
mov rdi, [ rsp + 0xad8 ];
mov byte [ rsp + 0xb18 ], dl; spilling byte x726 to mem
setc dl;
cmp rbx, rsi
setc sil;
cmp rcx, r11
adc r12, 0x0; add CF to r0's alloc
mov r11, [ rsp + 0xaf0 ];
add r11, [ rsp + 0xa70 ]
lea r10, [ r10 + rbx ]
cmp [ rsp + 0xb10 ], r9
lea r14, [ r14 + r13 ]
adc r11, 0x0; add CF to r0's alloc
mov r9, r10;
add r9, [ rsp + 0x310 ]
mov rcx, [ rsp + 0xaf8 ];
add rcx, [ rsp + 0x978 ]
cmp r11, [ rsp + 0xaf0 ]
mov byte [ rsp + 0xb20 ], dl; spilling byte x898 to mem
setc dl;
cmp r10, rbx
setc bl;
cmp rcx, [ rsp + 0x978 ]
movzx r10, sil;
mov byte [ rsp + 0xb28 ], bl; spilling byte x817 to mem
movzx rbx, byte [ rsp + 0xb18 ]; load byte memx726 to register64
lea r10, [ r10 + rbx ]; r64+m8
mov rbx, r14;
mov rsi, [ rsp + 0x668 ]; load m64 x608 to register64
lea rbx, [ rbx + rsi ]; r8/64 + m8
mov [ rsp + 0xb30 ], rdi; spilling x1042 to mem
movzx rdi, dl;
mov [ rsp + 0xb38 ], r9; spilling x819 to mem
mov r9, [ rsp + 0xb08 ]; load m64 x1061 to register64
lea rdi, [ rdi + r9 ]; r8/64 + m8
setc r9b;
cmp rbx, rsi
setc sil;
cmp r13, [ rsp + 0x838 ]
lea r10, [ r10 + rbx ]
setc dl;
cmp r14, r13
movzx r13, dl;
lea r13, [ r13 + r12 ]
adc r13, 0x0; add CF to r0's alloc
mov r12, [ rsp + 0x310 ]; load m64 x780 to register64
cmp [ rsp + 0xb38 ], r12
movzx r12, sil;
lea r12, [ r12 + r13 ]
mov r14, [ rsp + 0xac8 ];
mov rsi, [ rsp + 0xb30 ]; load m64 x1042 to register64
lea r14, [ r14 + rsi ]; r8/64 + m8
movzx rsi, r9b;
movzx rdx, byte [ rsp + 0xb20 ]; load byte memx898 to register64
lea rsi, [ rsi + rdx ]; r64+m8
mov rdx, [ rsp + 0xb38 ]; load m64 x819 to register64
lea rsi, [ rsi + rdx ]; r8/64 + m8
movzx r9, byte [ rsp + 0xb28 ];
adc r9, 0x0; add CF to r0's alloc
mov r13, r10;
add r13, [ rsp + 0x960 ]
lea r9, [ r9 + r13 ]
cmp r10, rbx
setc bl;
cmp r13, [ rsp + 0x960 ]
setc r10b;
cmp r12, [ rsp + 0x628 ]
mov [ rsp + 0xb40 ], r8; spilling arg4 to mem
mov r8, rsi;
mov [ rsp + 0xb48 ], rax; spilling arg2 to mem
mov rax, [ rsp + 0x9e0 ]; load m64 x876 to register64
lea r8, [ r8 + rax ]; r8/64 + m8
mov [ rsp + 0xb50 ], r14; spilling x1065 to mem
mov r14, r9;
mov [ rsp + 0xb58 ], rdi; spilling x1062 to mem
mov rdi, [ rsp + 0x4c8 ]; load m64 x787 to register64
lea r14, [ r14 + rdi ]; r8/64 + m8
mov byte [ rsp + 0xb60 ], bl; spilling byte x733 to mem
mov rbx, rcx;
mov byte [ rsp + 0xb68 ], r10b; spilling byte x736 to mem
movzx r10, byte [ rsp + 0xa68 ]; load byte memx986 to register64
lea rbx, [ rbx + r10 ]; r64+m8
setc r10b;
cmp rsi, rdx
setc dl;
cmp r14, rdi
setc dil;
cmp r8, rax
mov rax, rbx;
mov rsi, [ rsp + 0x248 ]; load m64 x956 to register64
lea rax, [ rax + rsi ]; r8/64 + m8
mov byte [ rsp + 0xb70 ], dl; spilling byte x905 to mem
setc dl;
cmp r9, r13
movzx r13, byte [ rsp + 0xb68 ];
movzx r9, byte [ rsp + 0xb60 ]; load byte memx733 to register64
lea r13, [ r13 + r9 ]; r64+m8
movzx r9, dil;
adc r9, 0x0; add CF to r0's alloc
cmp rbx, rcx
lea r13, [ r13 + r12 ]
setc cl;
cmp rax, rsi
movzx rsi, cl;
adc rsi, 0x0; add CF to r0's alloc
lea rsi, [ rsi + r8 ]
mov rbx, r13;
add rbx, [ rsp + 0x998 ]
cmp rbx, [ rsp + 0x998 ]
mov rdi, rsi;
lea rdi, [ rdi + r15 ]
setc cl;
cmp r13, r12
movzx r12, r10b;
mov r13, [ rsp + 0x5d0 ]; load m64 x798 to register64
lea r12, [ r12 + r13 ]; r8/64 + m8
adc r12, 0x0; add CF to r0's alloc
lea r9, [ r9 + rbx ]
movzx r10, cl;
lea r10, [ r10 + r12 ]
mov rcx, r9;
add rcx, [ rsp + 0x590 ]
cmp rcx, [ rsp + 0x590 ]
mov r12, [ rsp + 0xa98 ]; load m64 x1039 to register64
mov [ rsp + 0xb78 ], rdi; spilling x998 to mem
setc dil;
cmp [ rsp + 0xb58 ], r12
movzx r12, dl;
mov byte [ rsp + 0xb80 ], dil; spilling byte x834 to mem
movzx rdi, byte [ rsp + 0xb70 ]; load byte memx905 to register64
lea r12, [ r12 + rdi ]; r64+m8
mov rdi, [ rsp + 0xb50 ];
adc rdi, 0x0; add CF to r0's alloc
lea r12, [ r12 + r14 ]
mov rdx, r12;
add rdx, [ rsp + 0x9a0 ]
cmp rdx, [ rsp + 0x9a0 ]
mov [ rsp + 0xb88 ], rdi; spilling x1066 to mem
setc dil;
cmp r9, rbx
setc bl;
cmp r12, r14
mov r14, rax;
movzx r9, byte [ rsp + 0xa80 ]; load byte memx1074 to register64
lea r14, [ r14 + r9 ]; r64+m8
movzx r9, bl;
lea r9, [ r9 + r10 ]
mov r10, [ rsp + 0xb88 ]; load m64 x1066 to register64
setc r12b;
cmp r10, [ rsp + 0xac8 ]
movzx rbx, byte [ rsp + 0xb80 ]; load byte memx834 to register64
lea r9, [ r9 + rbx ]; r64+m8
mov rbx, [ rsp + 0xae8 ];
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0xb90 ], rbx; spilling x1070 to mem
mov rbx, r14;
add rbx, [ rsp + 0xb10 ]
cmp rbx, [ rsp + 0xb10 ]
mov [ rsp + 0xb98 ], r9; spilling x840 to mem
setc r9b;
cmp r14, rax
mov rax, 0x4601000000005555 ; moving imm to reg
mov r14, rbx;
lea r14, [ r14 + rax ]
movzx rax, r9b;
adc rax, 0x0; add CF to r0's alloc
cmp [ rsp + 0xb78 ], r15
setc r15b;
cmp rsi, r8
movzx r8, dil;
movzx r12, r12b
lea r8, [ r8 + r12 ]
lea r8, [ r8 + rcx ]
movzx rsi, r15b;
adc rsi, 0x0; add CF to r0's alloc
cmp [ rsp + 0xb98 ], r13
mov r13, -0x4601000000005555 ; moving imm to reg
setc dil;
cmp rbx, r13
mov r12, r8;
mov r9, [ rsp + 0x9f8 ]; load m64 x884 to register64
lea r12, [ r12 + r9 ]; r8/64 + m8
setc r15b;
movzx r15, r15b
mov r13, r15;
sub r13, 0x1
mov [ rsp + 0xba0 ], r14; spilling x1256 to mem
mov r14, r15;
and r14, r13; x1122 <- x1119&x1121
cmp [ rsp + 0xb90 ], rbp
mov rbp, [ rsp + 0xac0 ];
adc rbp, 0x0; add CF to r0's alloc
movzx r13, dil;
add r13, [ rsp + 0x9f0 ]
mov rdi, 0xfffffffffffffffe ; moving imm to reg
xor r15, rdi; x1123 <- x1119|0xfffffffffffffffe
lea rsi, [ rsi + rdx ]
add rax, [ rsp + 0xb78 ]
mov rdi, rax;
lea rdi, [ rdi + r11 ]
cmp rax, [ rsp + 0xb78 ]
setc al;
cmp r8, rcx
setc cl;
cmp rsi, rdx
setc dl;
cmp rdi, r11
mov r11, [ rsp + 0x2a0 ]; load m64 x966 to register64
lea rsi, [ rsi + r11 ]; r8/64 + m8
setc r8b;
cmp rsi, r11
movzx r11, dl;
adc r11, 0x0; add CF to r0's alloc
lea r11, [ r11 + r12 ]
mov rdx, r11;
add rdx, [ rsp + 0x378 ]
cmp r11, r12
setc r11b;
cmp r12, r9
movzx r9, cl;
adc r9, 0x0; add CF to r0's alloc
mov r12, 0x1eabfffeb153ffff ; moving imm to reg
cmp rdi, r12
setc cl;
cmp rdx, [ rsp + 0x378 ]
mov r12, 0xfffffffffffffffe ; moving imm to reg
mov [ rsp + 0xba8 ], rbp; spilling x1073 to mem
setc bpl;
mov [ rsp + 0xbb0 ], r13; spilling x1022 to mem
movzx r13, cl;
xor r13, r12; x1131 <- x1127|0xfffffffffffffffe
movzx r12, r8b;
movzx rax, al
add r12, rax
lea r12, [ r12 + rsi ]
cmp r12, rsi
movzx rax, bpl;
movzx r11, r11b
lea rax, [ rax + r11 ]
setc r8b;
xor r14, r15; x1125 <- x1122|x1124
movzx r15, byte [ rsp + 0xa50 ];
add r15, [ rsp + 0x928 ]
mov rsi, -0x1eabfffeb153ffff ; moving imm to reg
mov r11, rdi;
lea r11, [ r11 + rsi ]
mov rbp, r11;
lea rbp, [ rbp + r14 ]
cmp r11, rbp
mov r14, [ rsp + 0xb98 ]; load m64 x840 to register64
lea r9, [ r9 + r14 ]; r8/64 + m8
setc r11b;
cmp r9, r14
mov r14, [ rsp + 0xbb0 ];
adc r14, 0x0; add CF to r0's alloc
lea r9, [ r9 + r15 ]
cmp r9, r15
adc r14, 0x0; add CF to r0's alloc
mov r15, 0x0 ; moving imm to reg
lea rbp, [ rbp + r15 ]
movzx rcx, cl
mov r15, rcx;
sub r15, 0x1
and rcx, r15; x1130 <- x1127&x1129
mov r15, 0xfffffffffffffffe ; moving imm to reg
movzx rsi, r11b;
xor rsi, r15; x1139 <- x1135|0xfffffffffffffffe
lea rax, [ rax + r9 ]
cmp rax, r9
mov r9, [ rsp + 0xb58 ]; load m64 x1062 to register64
lea r12, [ r12 + r9 ]; r8/64 + m8
mov r15, [ rsp + 0x468 ]; load m64 x980 to register64
lea rax, [ rax + r15 ]; r8/64 + m8
adc r14, 0x0; add CF to r0's alloc
cmp rax, r15
setc r15b;
xor rcx, r13; x1133 <- x1130|x1132
mov r13, 0x6730d2a0f6b0f624 ; moving imm to reg
cmp r12, r13
setc r13b;
cmp r12, r9
mov r9, -0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0xbb8 ], rbp; spilling x1222 to mem
mov rbp, r12;
lea rbp, [ rbp + r9 ]
setc r9b;
movzx r13, r13b
mov [ rsp + 0xbc0 ], rbp; spilling x1143 to mem
mov rbp, r13;
sub rbp, 0x1
mov [ rsp + 0xbc8 ], rcx; spilling x1133 to mem
movzx rcx, r9b;
movzx r8, r8b
add rcx, r8
lea rcx, [ rcx + rdx ]
mov r8, rcx;
lea r8, [ r8 + r10 ]
mov r9, r13;
and r9, rbp; x1147 <- x1144&x1146
movzx r11, r11b
mov rbp, r11;
sub rbp, 0x1
cmp r8, r10
mov r10, -0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0xbd0 ], r9; spilling x1147 to mem
mov r9, r8;
lea r9, [ r9 + r10 ]
setc r10b;
and r11, rbp; x1138 <- x1135&x1137
xor r11, rsi; x1141 <- x1138|x1140
mov rsi, 0x64774b84f38512bf ; moving imm to reg
cmp r8, rsi
setc bpl;
cmp rcx, rdx
movzx rdx, r10b;
adc rdx, 0x0; add CF to r0's alloc
lea rdx, [ rdx + rax ]
movzx rcx, r15b;
lea rcx, [ rcx + r14 ]
mov r14, 0xfffffffffffffffe ; moving imm to reg
movzx r15, bpl;
xor r15, r14; x1165 <- x1161|0xfffffffffffffffe
mov r10, rdx;
add r10, [ rsp + 0xb90 ]
mov r14, 0x4b1ba7b6434bacd7 ; moving imm to reg
cmp r10, r14
setc sil;
movzx rsi, sil
mov r14, rsi;
sub r14, 0x1
movzx rbp, bpl
mov [ rsp + 0xbd8 ], rcx; spilling x1026 to mem
mov rcx, rbp;
sub rcx, 0x1
mov [ rsp + 0xbe0 ], r9; spilling x1160 to mem
mov r9, -0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0xbe8 ], r15; spilling x1165 to mem
mov r15, r10;
lea r15, [ r15 + r9 ]
mov r9, rsi;
and r9, r14; x1181 <- x1178&x1180
cmp r10, [ rsp + 0xb90 ]
mov r14, 0xfffffffffffffffe ; moving imm to reg
mov [ rsp + 0xbf0 ], r15; spilling x1177 to mem
setc r15b;
xor rsi, r14; x1182 <- x1178|0xfffffffffffffffe
add r11, [ rsp + 0xbc8 ]
xor r13, r14; x1148 <- x1144|0xfffffffffffffffe
and rbp, rcx; x1164 <- x1161&x1163
add r11, [ rsp + 0xbc0 ]
xor rbp, [ rsp + 0xbe8 ]; x1167 <- x1164|x1166
cmp [ rsp + 0xbc0 ], r11
setc cl;
mov [ rsp + 0xbf8 ], rbp; spilling x1167 to mem
movzx rbp, cl;
xor rbp, r14; x1156 <- x1152|0xfffffffffffffffe
mov r14, [ rsp + 0xbd0 ];
xor r14, r13; x1150 <- x1147|x1149
movzx rcx, cl
mov r13, rcx;
sub r13, 0x1
and rcx, r13; x1155 <- x1152&x1154
xor r9, rsi; x1184 <- x1181|x1183
xor rcx, rbp; x1158 <- x1155|x1157
lea rcx, [ rcx + r14 ]
cmp rdx, rax
mov rax, [ rsp + 0xbe0 ]; load m64 x1160 to register64
lea rcx, [ rcx + rax ]; r8/64 + m8
movzx rdx, r15b;
adc rdx, 0x0; add CF to r0's alloc
add rdx, [ rsp + 0xbd8 ]
mov r15, rdx;
add r15, [ rsp + 0xba8 ]
cmp rax, rcx
setc al;
mov r14, 0xfffffffffffffffe ; moving imm to reg
movzx rsi, al;
xor rsi, r14; x1173 <- x1169|0xfffffffffffffffe
mov r13, 0x0 ; moving imm to reg
lea rcx, [ rcx + r13 ]
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg
cmp r15, rbp
setc r13b;
movzx rax, al
mov r14, rax;
sub r14, 0x1
and rax, r14; x1172 <- x1169&x1171
movzx r13, r13b
mov r14, r13;
sub r14, 0x1
xor rax, rsi; x1175 <- x1172|x1174
mov rsi, [ rsp + 0x9f0 ]; load m64 x984 to register64
cmp [ rsp + 0xbd8 ], rsi
mov rsi, [ rsp + 0xbf8 ]; load m64 x1167 to register64
lea rax, [ rax + rsi ]; r8/64 + m8
mov rsi, -0x1a0111ea397fe69a ; moving imm to reg
mov rbp, r15;
lea rbp, [ rbp + rsi ]
setc sil;
cmp rdx, [ rsp + 0xbd8 ]
movzx rdx, sil;
adc rdx, 0x0; add CF to r0's alloc
mov rsi, 0xfffffffffffffffe ; moving imm to reg
mov [ rsp + 0xc00 ], rcx; spilling x1240 to mem
mov rcx, r13;
xor rcx, rsi; x1199 <- x1195|0xfffffffffffffffe
add rax, [ rsp + 0xbf0 ]
cmp [ rsp + 0xbf0 ], rax
setc sil;
cmp r15, [ rsp + 0xba8 ]
mov [ rsp + 0xc08 ], rcx; spilling x1200 to mem
mov rcx, 0x0 ; moving imm to reg
lea rax, [ rax + rcx ]
adc rdx, 0x0; add CF to r0's alloc
mov rcx, 0xfffffffffffffffe ; moving imm to reg
mov [ rsp + 0xc10 ], rax; spilling x1249 to mem
movzx rax, sil;
xor rax, rcx; x1190 <- x1186|0xfffffffffffffffe
movzx rsi, sil
mov rcx, rsi;
sub rcx, 0x1
and rsi, rcx; x1189 <- x1186&x1188
xor rsi, rax; x1192 <- x1189|x1191
lea rsi, [ rsi + r9 ]
lea rsi, [ rsi + rbp ]
and r13, r14; x1198 <- x1195&x1197
xor r13, [ rsp + 0xc08 ]; x1201 <- x1198|x1200
cmp rbp, rsi
setc r9b;
mov r14, 0xfffffffffffffffe ; moving imm to reg
movzx rbp, r9b;
xor rbp, r14; x1207 <- x1203|0xfffffffffffffffe
movzx r9, r9b
mov rax, r9;
sub rax, 0x1
and r9, rax; x1206 <- x1203&x1205
xor r9, rbp; x1209 <- x1206|x1208
lea r9, [ r9 + r13 ]
lea r9, [ r9 + rdx ]
cmp rdx, r9
setc dl;
movzx rcx, dl;
xor rcx, r14; x1216 <- x1212|0xfffffffffffffffe
movzx rdx, dl
mov r13, rdx;
sub r13, 0x1
mov rax, rdx;
and rax, r13; x1215 <- x1212&x1214
xor rax, rcx; x1218 <- x1215|x1217
mov rbp, 0x0 ; moving imm to reg
lea rdx, [ rdx + rbp ]
mov r9, rdx;
imul r9, rbp; lox1225 = x1221*0x0
and r8, rax; x1237 <- x1100&x1218
and r10, rax; x1246 <- x1107&x1218
mov rcx, rbp;
add rcx, [ rsp + 0xba0 ]
lea r11, [ r11 + rbp ]
and r12, rax; x1228 <- x1093&x1218
sub rdx, 0x1
and r15, rax; x1275 <- x1114&x1218
mov r13, [ rsp + 0xc00 ];
imul r13, rdx; lox1242 = x1240*x1223
imul r11, rdx; lox1233 = x1231*x1223
and rbx, rax; x1257 <- x1079&x1218
mov rbp, [ rsp + 0xbb8 ];
imul rbp, rdx; lox1224 = x1222*x1223
lea rbp, [ rbp + r9 ]
lea r11, [ r11 + r9 ]
and rdi, rax; x1219 <- x1086&x1218
mov rax, [ rsp + 0xc10 ];
imul rax, rdx; lox1251 = x1249*x1223
mov r14, 0x0 ; moving imm to reg
lea rsi, [ rsi + r14 ]
imul rsi, rdx; lox1280 = x1278*x1223
lea rsi, [ rsi + r9 ]
imul rcx, rdx; lox1262 = x1260*x1223
lea rcx, [ rcx + r9 ]
or rdi, rbp; x1227 <- x1219|x1226
or rbx, rcx; x1265 <- x1257|x1264
mov rdx, [ rsp - 0x38 ]; load m64 out1 to register64
mov [ rdx + 0x8 ], rdi; out1[1] = x1227
or r15, rsi; x1283 <- x1275|x1282
lea r13, [ r13 + r9 ]
or r8, r13; x1245 <- x1237|x1244
or r12, r11; x1236 <- x1228|x1235
mov [ rdx + 0x18 ], r8; out1[3] = x1245
mov [ rdx + 0x10 ], r12; out1[2] = x1236
lea rax, [ rax + r9 ]
or r10, rax; x1254 <- x1246|x1253
mov [ rdx + 0x20 ], r10; out1[4] = x1254
mov [ rdx + 0x28 ], r15; out1[5] = x1283
mov [ rdx + 0x0 ], rbx; out1[0] = x1265
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 3224
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.7329
; seed 1556172276590853 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 2034136 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=39, initial num_batches=31): 18171 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.00893303102644071
; number reverted permutation / tried permutation: 3194 / 4018 =79.492%
; number reverted decision / tried decision: 2710 / 3981 =68.073%
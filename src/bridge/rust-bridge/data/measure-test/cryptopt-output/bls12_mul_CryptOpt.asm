SECTION .text
	GLOBAL bls12_mul_CryptOpt
bls12_mul_CryptOpt:
sub rsp, 3472
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rdx + 0x0 ]; saving arg2[0] in rdx.
mulx r11, r10, [ r8 + 0x28 ]; x43_1, x43_0<- arg4[5] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x8 ]; load m64 x948 to register64
imul rdx, [ rax + 0x28 ]; lox948 = arg4[1]*arg2[5]
mov r10, rdx; preserving value of x948 into a new reg
mov rdx, [ r8 + 0x28 ]; saving arg4[5] in rdx.
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, [ rax + 0x10 ]; x375_1, x375_0<- arg4[5] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbx, [ rax + 0x0 ]; x68_1, x68_0<- arg4[0] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x197 to register64
imul rdx, [ rax + 0x8 ]; lox197 = arg4[3]*arg2[1]
mov rbx, rdx; preserving value of x197 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rax + 0x8 ]; x202_1, x202_0<- arg4[2] * arg2[1] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r13, [ r8 + 0x0 ]; x395_1, x395_0<- arg4[0] * arg2[2] (_0*_0)
mov rdx, [ rax + 0x28 ]; arg2[5] to rdx
mov [ rsp - 0x50 ], r9; spilling arg5 to mem
mulx r9, r13, [ r8 + 0x8 ]; x949_1, x949_0<- arg4[1] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx
mov [ rsp - 0x48 ], rcx; spilling arg3 to mem
mulx rcx, r13, [ rax + 0x18 ]; x573_1, x573_0<- arg4[2] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x944 to register64
imul rdx, [ rax + 0x28 ]; lox944 = arg4[2]*arg2[5]
mov r13, rdx; preserving value of x944 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mov [ rsp - 0x40 ], rsi; spilling arg1 to mem
mov [ rsp - 0x38 ], rdi; spilling out1 to mem
mulx rdi, rsi, [ r8 + 0x18 ]; x941_1, x941_0<- arg4[3] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx
mov [ rsp - 0x30 ], rbx; spilling x197 to mem
mulx rbx, rsi, [ rax + 0x10 ]; x387_1, x387_0<- arg4[2] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x0 ]; load m64 x66 to register64
imul rdx, [ rax + 0x0 ]; lox66 = arg4[0]*arg2[0]
mov rsi, rdx; preserving value of x66 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp - 0x28 ], r13; spilling x944 to mem
mov [ rsp - 0x20 ], r11; spilling x43_1 to mem
mulx r11, r13, [ r8 + 0x8 ]; x206_1, x206_0<- arg4[1] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x373 to register64
imul rdx, [ rax + 0x10 ]; lox373 = arg4[5]*arg2[2]
mov r13, [ r8 + 0x10 ]; load m64 x758 to register64
imul r13, [ rax + 0x20 ]; lox758 = arg4[2]*arg2[4]
mov [ rsp - 0x18 ], rdx; spilling x373 to mem
mov rdx, -0x760c000300030003 ; moving imm to reg
mov [ rsp - 0x10 ], r13; spilling x758 to mem
mov r13, rsi;
imul r13, rdx; lox100 = x66*-0x760c000300030003
mov rdx, [ r8 + 0x20 ]; load m64 x46 to register64
imul rdx, [ rax + 0x0 ]; lox46 = arg4[4]*arg2[0]
mov [ rsp - 0x8 ], r13; spilling x100 to mem
mov r13, rdx; preserving value of x46 into a new reg
mov rdx, [ rax + 0x10 ]; saving arg2[2] in rdx.
mov [ rsp + 0x0 ], rbx; spilling x387_1 to mem
mov [ rsp + 0x8 ], r10; spilling x948 to mem
mulx r10, rbx, [ r8 + 0x18 ]; x383_1, x383_0<- arg4[3] * arg2[2] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x188 to register64
imul rdx, [ rax + 0x8 ]; lox188 = arg4[5]*arg2[1]
mov rbx, [ r8 + 0x20 ]; load m64 x936 to register64
imul rbx, [ rax + 0x28 ]; lox936 = arg4[4]*arg2[5]
mov [ rsp + 0x10 ], r13; spilling x46 to mem
mov r13, rdx; preserving value of x188 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp + 0x18 ], rbx; spilling x936 to mem
mov [ rsp + 0x20 ], r10; spilling x383_1 to mem
mulx r10, rbx, [ r8 + 0x0 ]; x210_1, x210_0<- arg4[0] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x20 ]; load m64 x193 to register64
imul rdx, [ rax + 0x8 ]; lox193 = arg4[4]*arg2[1]
mov rbx, [ r8 + 0x28 ]; load m64 x931 to register64
imul rbx, [ rax + 0x28 ]; lox931 = arg4[5]*arg2[5]
mov [ rsp + 0x28 ], r13; spilling x188 to mem
mov r13, rdx; preserving value of x193 into a new reg
mov rdx, [ r8 + 0x8 ]; saving arg4[1] in rdx.
mov [ rsp + 0x30 ], rbx; spilling x931 to mem
mov [ rsp + 0x38 ], rcx; spilling x573_1 to mem
mulx rcx, rbx, [ rax + 0x20 ]; x763_1, x763_0<- arg4[1] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x28 ]; arg4[5] to rdx
mov [ rsp + 0x40 ], r13; spilling x193 to mem
mulx r13, rbx, [ rax + 0x8 ]; x190_1, x190_0<- arg4[5] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x8 ]; load m64 x61 to register64
imul rdx, [ rax + 0x0 ]; lox61 = arg4[1]*arg2[0]
mov rbx, [ r8 + 0x20 ]; load m64 x564 to register64
imul rbx, [ rax + 0x18 ]; lox564 = arg4[4]*arg2[3]
mov [ rsp + 0x48 ], rbp; spilling x377 to mem
mov rbp, rdx; preserving value of x61 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp + 0x50 ], rbx; spilling x564 to mem
mov [ rsp + 0x58 ], rcx; spilling x763_1 to mem
mulx rcx, rbx, [ r8 + 0x20 ]; x48_1, x48_0<- arg4[4] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x0 ]; load m64 x766 to register64
imul rdx, [ rax + 0x20 ]; lox766 = arg4[0]*arg2[4]
mov rbx, [ r8 + 0x0 ]; load m64 x580 to register64
imul rbx, [ rax + 0x18 ]; lox580 = arg4[0]*arg2[3]
mov [ rsp + 0x60 ], rdx; spilling x766 to mem
mov rdx, [ r8 + 0x28 ]; load m64 x559 to register64
imul rdx, [ rax + 0x18 ]; lox559 = arg4[5]*arg2[3]
mov [ rsp + 0x68 ], rbx; spilling x580 to mem
mov rbx, [ r8 + 0x18 ]; load m64 x382 to register64
imul rbx, [ rax + 0x10 ]; lox382 = arg4[3]*arg2[2]
mov [ rsp + 0x70 ], rdx; spilling x559 to mem
mov rdx, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x78 ], rbx; spilling x382 to mem
mov rbx, rsi;
imul rbx, rdx; lox106 = x66*0x299338752f97f97b
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp + 0x80 ], r10; spilling x212 to mem
mov [ rsp + 0x88 ], rbx; spilling x106 to mem
mulx rbx, r10, [ r8 + 0x20 ]; x194_1, x194_0<- arg4[4] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x386 to register64
imul rdx, [ rax + 0x10 ]; lox386 = arg4[2]*arg2[2]
mov r10, rdx; preserving value of x386 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x90 ], rbp; spilling x61 to mem
mov [ rsp + 0x98 ], r9; spilling x950 to mem
mulx r9, rbp, [ r8 + 0x8 ]; x577_1, x577_0<- arg4[1] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x28 ]; load m64 x745 to register64
imul rdx, [ rax + 0x20 ]; lox745 = arg4[5]*arg2[4]
mov rbp, [ r8 + 0x8 ]; load m64 x205 to register64
imul rbp, [ rax + 0x8 ]; lox205 = arg4[1]*arg2[1]
mov [ rsp + 0xa0 ], r13; spilling x191 to mem
mov r13, rdx; preserving value of x745 into a new reg
mov rdx, [ r8 + 0x18 ]; saving arg4[3] in rdx.
mov [ rsp + 0xa8 ], r10; spilling x386 to mem
mov [ rsp + 0xb0 ], rbp; spilling x205 to mem
mulx rbp, r10, [ rax + 0x8 ]; x198_1, x198_0<- arg4[3] * arg2[1] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x572 to register64
imul rdx, [ rax + 0x18 ]; lox572 = arg4[2]*arg2[3]
mov r10, [ r8 + 0x28 ]; load m64 x40 to register64
imul r10, [ rax + 0x0 ]; lox40 = arg4[5]*arg2[0]
mov [ rsp + 0xb8 ], r13; spilling x745 to mem
mov r13, rdx; preserving value of x572 into a new reg
mov rdx, [ r8 + 0x20 ]; saving arg4[4] in rdx.
mov [ rsp + 0xc0 ], r10; spilling x40 to mem
mov [ rsp + 0xc8 ], rbx; spilling x195 to mem
mulx rbx, r10, [ rax + 0x20 ]; x751_1, x751_0<- arg4[4] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x201 to register64
imul rdx, [ rax + 0x8 ]; lox201 = arg4[2]*arg2[1]
mov r10, rdx; preserving value of x201 into a new reg
mov rdx, [ r8 + 0x0 ]; saving arg4[0] in rdx.
mov [ rsp + 0xd0 ], rcx; spilling x50 to mem
mov [ rsp + 0xd8 ], rdi; spilling x942 to mem
mulx rdi, rcx, [ rax + 0x28 ]; x953_1, x953_0<- arg4[0] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x0 ]; arg4[0] to rdx
mov [ rsp + 0xe0 ], r10; spilling x201 to mem
mulx r10, rcx, [ rax + 0x18 ]; x581_1, x581_0<- arg4[0] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x10 ]; arg4[2] to rdx
mov [ rsp + 0xe8 ], r13; spilling x572 to mem
mulx r13, rcx, [ rax + 0x28 ]; x945_1, x945_0<- arg4[2] * arg2[5] (_0*_0)
mov rdx, [ r8 + 0x18 ]; load m64 x754 to register64
imul rdx, [ rax + 0x20 ]; lox754 = arg4[3]*arg2[4]
mov rcx, [ r8 + 0x0 ]; load m64 x209 to register64
imul rcx, [ rax + 0x8 ]; lox209 = arg4[0]*arg2[1]
mov [ rsp + 0xf0 ], rcx; spilling x209 to mem
mov rcx, [ r8 + 0x18 ]; load m64 x940 to register64
imul rcx, [ rax + 0x28 ]; lox940 = arg4[3]*arg2[5]
mov [ rsp + 0xf8 ], r14; spilling x204 to mem
mov r14, rdx; preserving value of x754 into a new reg
mov rdx, [ r8 + 0x20 ]; saving arg4[4] in rdx.
mov [ rsp + 0x100 ], rcx; spilling x940 to mem
mov [ rsp + 0x108 ], r13; spilling x946 to mem
mulx r13, rcx, [ rax + 0x10 ]; x379_1, x379_0<- arg4[4] * arg2[2] (_0*_0)
mov rdx, [ rsp + 0x38 ];
mov rcx, rdx; preserving value of x574 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x110 ], r14; spilling x754 to mem
mov [ rsp + 0x118 ], rbx; spilling x751_1 to mem
mulx rbx, r14, [ r8 + 0x18 ]; x569_1, x569_0<- arg4[3] * arg2[3] (_0*_0)
mov rdx, rdi;
add rdx, [ rsp + 0x8 ]
mov r14, rdx; preserving value of x956 into a new reg
mov rdx, [ r8 + 0x10 ]; saving arg4[2] in rdx.
mov [ rsp + 0x120 ], rbx; spilling x569_1 to mem
mov [ rsp + 0x128 ], rbp; spilling x198_1 to mem
mulx rbp, rbx, [ rax + 0x0 ]; x58_1, x58_0<- arg4[2] * arg2[0] (_0*_0)
mov rdx, [ rsp + 0x0 ];
mov rbx, rdx; preserving value of x388 into a new reg
mov rdx, [ r8 + 0x18 ]; saving arg4[3] in rdx.
mov [ rsp + 0x130 ], r13; spilling x380 to mem
mov [ rsp + 0x138 ], rcx; spilling x575 to mem
mulx rcx, r13, [ rax + 0x20 ]; x755_1, x755_0<- arg4[3] * arg2[4] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mov [ rsp + 0x140 ], r11; spilling x208 to mem
mulx r11, r13, [ r8 + 0x8 ]; x63_1, x63_0<- arg4[1] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x10 ]; load m64 x56 to register64
imul rdx, [ rax + 0x0 ]; lox56 = arg4[2]*arg2[0]
mov r13, [ r8 + 0x8 ]; load m64 x576 to register64
imul r13, [ rax + 0x18 ]; lox576 = arg4[1]*arg2[3]
mov [ rsp + 0x148 ], rdx; spilling x56 to mem
mov rdx, [ r8 + 0x8 ]; load m64 x390 to register64
imul rdx, [ rax + 0x10 ]; lox390 = arg4[1]*arg2[2]
lea r13, [ r13 + r10 ]
mov [ rsp + 0x150 ], r13; spilling x584 to mem
mov r13, rdx; preserving value of x390 into a new reg
mov rdx, [ r8 + 0x18 ]; saving arg4[3] in rdx.
mov [ rsp + 0x158 ], r15; spilling x397 to mem
mov [ rsp + 0x160 ], r11; spilling x63_1 to mem
mulx r11, r15, [ rax + 0x0 ]; x53_1, x53_0<- arg4[3] * arg2[0] (_0*_0)
mov rdx, [ r8 + 0x20 ]; load m64 x378 to register64
imul rdx, [ rax + 0x10 ]; lox378 = arg4[4]*arg2[2]
cmp r14, rdi
mov rdi, rdx; preserving value of x378 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mov [ rsp + 0x168 ], rcx; spilling x757 to mem
mulx rcx, r15, [ r8 + 0x28 ]; x933_1, x933_0<- arg4[5] * arg2[5] (_0*_0)
mov rdx, r12;
mov r15, [ rsp + 0x90 ]; load m64 x61 to register64
lea rdx, [ rdx + r15 ]; r8/64 + m8
setc r15b;
cmp rdx, r12
setc r12b;
mov [ rsp + 0x170 ], rdi; spilling x378 to mem
mov rdi, [ r8 + 0x0 ]; load m64 x952 to register64
imul rdi, [ rax + 0x28 ]; lox952 = arg4[0]*arg2[5]
mov [ rsp + 0x178 ], rdi; spilling x952 to mem
mov rdi, [ r8 + 0x18 ]; load m64 x568 to register64
imul rdi, [ rax + 0x18 ]; lox568 = arg4[3]*arg2[3]
mov [ rsp + 0x180 ], rbx; spilling x389 to mem
mov rbx, rdx; preserving value of x71 into a new reg
mov rdx, [ r8 + 0x0 ]; saving arg4[0] in rdx.
mov [ rsp + 0x188 ], rbp; spilling x60 to mem
mov [ rsp + 0x190 ], rdi; spilling x568 to mem
mulx rdi, rbp, [ rax + 0x20 ]; x767_1, x767_0<- arg4[0] * arg2[4] (_0*_0)
mov rdx, [ rsp + 0x128 ];
mov rbp, rdx; preserving value of x199 into a new reg
mov rdx, [ rax + 0x20 ]; saving arg2[4] in rdx.
mov byte [ rsp + 0x198 ], r12b; spilling byte x72 to mem
mov [ rsp + 0x1a0 ], r9; spilling x579 to mem
mulx r9, r12, [ r8 + 0x10 ]; x759_1, x759_0<- arg4[2] * arg2[4] (_0*_0)
mov rdx, [ rsp + 0x160 ];
mov r12, [ rsp + 0x118 ];
add r13, [ rsp + 0x158 ]
mov [ rsp + 0x1a8 ], r12; spilling x752 to mem
mov r12, [ r8 + 0x0 ]; load m64 x394 to register64
imul r12, [ rax + 0x10 ]; lox394 = arg4[0]*arg2[2]
mov [ rsp + 0x1b0 ], r12; spilling x394 to mem
mov r12, rdx; preserving value of x65 into a new reg
mov rdx, [ rax + 0x18 ]; saving arg2[3] in rdx.
mov [ rsp + 0x1b8 ], r11; spilling x55 to mem
mov [ rsp + 0x1c0 ], rbp; spilling x199 to mem
mulx rbp, r11, [ r8 + 0x28 ]; x561_1, x561_0<- arg4[5] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp + 0x1c8 ], r12; spilling x65 to mem
mulx r12, r11, [ r8 + 0x20 ]; x565_1, x565_0<- arg4[4] * arg2[3] (_0*_0)
mov rdx, [ r8 + 0x8 ]; arg4[1] to rdx
mov [ rsp + 0x1d0 ], r13; spilling x398 to mem
mulx r13, r11, [ rax + 0x10 ]; x391_1, x391_0<- arg4[1] * arg2[2] (_0*_0)
mov rdx, [ rsp + 0x120 ];
mov r11, [ rsp + 0x58 ];
mov [ rsp + 0x1d8 ], rcx; spilling x935 to mem
mov rcx, [ r8 + 0x18 ]; load m64 x51 to register64
imul rcx, [ rax + 0x0 ]; lox51 = arg4[3]*arg2[0]
mov [ rsp + 0x1e0 ], rcx; spilling x51 to mem
mov rcx, rdx; preserving value of x570 into a new reg
mov rdx, [ r8 + 0x28 ]; saving arg4[5] in rdx.
mov [ rsp + 0x1e8 ], r13; spilling x391_1 to mem
mov [ rsp + 0x1f0 ], r9; spilling x761 to mem
mulx r9, r13, [ rax + 0x20 ]; x747_1, x747_0<- arg4[5] * arg2[4] (_0*_0)
mov rdx, [ r8 + 0x8 ]; load m64 x762 to register64
imul rdx, [ rax + 0x20 ]; lox762 = arg4[1]*arg2[4]
mov r13, [ rsp + 0x20 ];
mov [ rsp + 0x1f8 ], r11; spilling x765 to mem
mov r11, [ rsp - 0x20 ];
cmp rsi, 0x0
mov [ rsp + 0x200 ], rdi; spilling x769 to mem
setne dil; setCC x145 to reg (rdi)
mov [ rsp + 0x208 ], rbp; spilling x563 to mem
mov rbp, [ r8 + 0x20 ]; load m64 x750 to register64
imul rbp, [ rax + 0x20 ]; lox750 = arg4[4]*arg2[4]
mov [ rsp + 0x210 ], rbp; spilling x750 to mem
movzx rbp, dil;
lea rbp, [ rbp + rbx ]
mov rdi, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x218 ], r13; spilling x385 to mem
mov r13, rsi;
imul r13, rdi; lox114 = x66*0x4cc7c19e39811d94
mov rdi, rdx; preserving value of x762 into a new reg
mov rdx, [ rax + 0x28 ]; saving arg2[5] in rdx.
mov [ rsp + 0x220 ], r13; spilling x114 to mem
mov [ rsp + 0x228 ], rcx; spilling x571 to mem
mulx rcx, r13, [ r8 + 0x20 ]; x937_1, x937_0<- arg4[4] * arg2[5] (_0*_0)
mov rdx, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x230 ], rcx; spilling x937_1 to mem
mulx rcx, r13, [ rsp - 0x8 ]; x111_1, x111_0<- x100 * 0x64774b84f38512bf (_0*_0)
mov r13, 0x1a0111ea397fe69a ; moving imm to reg
mov rdx, r13; 0x1a0111ea397fe69a to rdx
mov [ rsp + 0x238 ], rdi; spilling x762 to mem
mulx rdi, r13, [ rsp - 0x8 ]; x103_1, x103_0<- x100 * 0x1a0111ea397fe69a (_0*_0)
cmp rbp, rbx
movzx rbx, r15b;
mov r13, [ rsp + 0x98 ]; load m64 x951 to register64
lea rbx, [ rbx + r13 ]; r8/64 + m8
setc r13b;
cmp [ rsp + 0x150 ], r10
mov r10, [ rsp - 0x28 ]; load m64 x944 to register64
lea rbx, [ rbx + r10 ]; r8/64 + m8
mov r15, 0x48669f39fb24c32 ; moving imm to reg
setc dl;
mov [ rsp + 0x240 ], r9; spilling x748 to mem
mov r9, rsi;
imul r9, r15; lox101 = x66*0x48669f39fb24c32
movzx r15, dl;
add r15, [ rsp + 0x1a0 ]
mov rdx, [ rsp + 0x238 ];
add rdx, [ rsp + 0x200 ]
cmp rdx, [ rsp + 0x200 ]
mov [ rsp + 0x248 ], r9; spilling x101 to mem
mov r9, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x250 ], r11; spilling x45 to mem
mov r11, rdx; preserving value of x770 into a new reg
mov rdx, [ rsp - 0x8 ]; saving x100 in rdx.
mov [ rsp + 0x258 ], r12; spilling x567 to mem
mov byte [ rsp + 0x260 ], r13b; spilling byte x148 to mem
mulx r13, r12, r9; x107_1, x107_0<- x100 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r12, [ rsp + 0x1f8 ];
adc r12, 0x0; add CF to r0's alloc
mov r9, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x268 ], rbx; spilling x960 to mem
mov rbx, rsi;
imul rbx, r9; lox118 = x66*0x60fec0aec070003
add rcx, [ rsp + 0x88 ]
add r12, [ rsp - 0x10 ]
cmp r12, [ rsp - 0x10 ]
mov r9, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x270 ], rcx; spilling x136 to mem
mov [ rsp + 0x278 ], rbx; spilling x118 to mem
mulx rbx, rcx, r9; x115_1, x115_0<- x100 * 0x6730d2a0f6b0f624 (_0*_0)
mov rcx, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x280 ], r13; spilling x107_1 to mem
mulx r13, r9, rcx; x122_1, x122_0<- x100 * 0xb9feffffffffaaab (_0*_0)
mov r9, [ rsp + 0x230 ];
mov rcx, [ rsp + 0xe8 ]; load m64 x572 to register64
lea r15, [ r15 + rcx ]; r8/64 + m8
mov [ rsp + 0x288 ], r9; spilling x938 to mem
mov r9, [ rsp + 0x280 ];
mov [ rsp + 0x290 ], rbx; spilling x116 to mem
mov rbx, [ rsp + 0x1f0 ];
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0x298 ], r9; spilling x109 to mem
mov r9, [ rsp + 0x1e8 ];
cmp rbx, [ rsp + 0x1f0 ]
mov [ rsp + 0x2a0 ], r13; spilling x124 to mem
setc r13b;
cmp [ rsp + 0x268 ], r10
mov r10, [ rsp + 0x108 ];
adc r10, 0x0; add CF to r0's alloc
mov byte [ rsp + 0x2a8 ], r13b; spilling byte x778 to mem
mov r13, [ rsp + 0x158 ]; load m64 x397 to register64
cmp [ rsp + 0x1d0 ], r13
mov r13, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x2b0 ], r9; spilling x393 to mem
setc r9b;
imul rsi, r13; lox110 = x66*0x2a880aa4ed33c7c3
add rbx, [ rsp + 0x110 ]
cmp r15, rcx
setc cl;
cmp r10, [ rsp + 0x108 ]
mov r13, [ rsp + 0x100 ]; load m64 x940 to register64
lea r10, [ r10 + r13 ]; r8/64 + m8
mov [ rsp + 0x2b8 ], rdi; spilling x105 to mem
movzx rdi, r9b;
mov [ rsp + 0x2c0 ], rbx; spilling x780 to mem
mov rbx, [ rsp + 0x2b0 ]; load m64 x393 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov rbx, [ rsp + 0x1c8 ];
movzx r9, byte [ rsp + 0x198 ]; load byte memx72 to register64
lea rbx, [ rbx + r9 ]; r64+m8
mov r9, [ rsp + 0x148 ]; load m64 x56 to register64
lea rbx, [ rbx + r9 ]; r8/64 + m8
mov [ rsp + 0x2c8 ], rdi; spilling x401 to mem
mov rdi, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x2d0 ], rsi; spilling x110 to mem
mov [ rsp + 0x2d8 ], r10; spilling x966 to mem
mulx r10, rsi, rdi; x119_1, x119_0<- x100 * 0x1eabfffeb153ffff (_0*_0)
setc dl;
cmp rbx, r9
mov r9, [ rsp + 0xb0 ];
mov rsi, [ rsp + 0x80 ]; load m64 x212 to register64
lea r9, [ r9 + rsi ]; r8/64 + m8
movzx rdi, cl;
mov [ rsp + 0x2e0 ], r10; spilling x119_1 to mem
mov r10, [ rsp + 0x138 ]; load m64 x575 to register64
lea rdi, [ rdi + r10 ]; r8/64 + m8
mov rcx, rdi;
mov byte [ rsp + 0x2e8 ], dl; spilling byte x964 to mem
mov rdx, [ rsp + 0x190 ]; load m64 x568 to register64
lea rcx, [ rcx + rdx ]; r8/64 + m8
mov [ rsp + 0x2f0 ], rcx; spilling x594 to mem
setc cl;
cmp rdi, r10
setc r10b;
cmp r9, rsi
mov rsi, [ rsp + 0x140 ];
adc rsi, 0x0; add CF to r0's alloc
movzx rdi, cl;
add rdi, [ rsp + 0x188 ]
cmp [ rsp + 0x2d8 ], r13
mov r13, [ rsp + 0x278 ];
mov rcx, [ rsp + 0x2a0 ]; load m64 x124 to register64
lea r13, [ r13 + rcx ]; r8/64 + m8
mov [ rsp + 0x2f8 ], rdi; spilling x78 to mem
mov rdi, [ rsp + 0x2d0 ];
mov [ rsp + 0x300 ], rsi; spilling x216 to mem
mov rsi, [ rsp + 0x290 ]; load m64 x117 to register64
lea rdi, [ rdi + rsi ]; r8/64 + m8
lea rbp, [ rbp + r13 ]
setc sil;
cmp rbp, r13
mov [ rsp + 0x308 ], rdi; spilling x132 to mem
setc dil;
cmp [ rsp + 0x2f0 ], rdx
mov rdx, [ rsp + 0xa8 ];
mov byte [ rsp + 0x310 ], sil; spilling byte x967 to mem
mov rsi, [ rsp + 0x2c8 ]; load m64 x401 to register64
lea rdx, [ rdx + rsi ]; r8/64 + m8
movzx rsi, r10b;
adc rsi, 0x0; add CF to r0's alloc
add rsi, [ rsp + 0x228 ]
movzx r10, dil;
rcr byte [ rsp + 0x260 ], 1
adc r10, 0x0
mov rdi, rbp;
add rdi, [ rsp + 0xf0 ]
cmp rdx, [ rsp + 0xa8 ]
mov [ rsp + 0x318 ], r10; spilling x153 to mem
mov r10, [ rsp + 0x180 ];
adc r10, 0x0; add CF to r0's alloc
mov [ rsp + 0x320 ], rsi; spilling x598 to mem
mov rsi, r10;
add rsi, [ rsp + 0x78 ]
cmp rdi, rbp
setc bpl;
cmp r13, rcx
mov rcx, 0x4cc7c19e39811d94 ; moving imm to reg
setc r13b;
mov byte [ rsp + 0x328 ], bpl; spilling byte x243 to mem
mov rbp, rdi;
imul rbp, rcx; lox299 = x242*0x4cc7c19e39811d94
mov rcx, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x330 ], rbp; spilling x299 to mem
mov rbp, rdi;
imul rbp, rcx; lox291 = x242*0x299338752f97f97b
mov rcx, [ rsp + 0x320 ]; load m64 x598 to register64
cmp rcx, [ rsp + 0x228 ]
mov [ rsp + 0x338 ], rbp; spilling x291 to mem
mov rbp, 0x60fec0aec070003 ; moving imm to reg
mov byte [ rsp + 0x340 ], r13b; spilling byte x126 to mem
setc r13b;
mov [ rsp + 0x348 ], rsi; spilling x408 to mem
mov rsi, rdi;
imul rsi, rbp; lox303 = x242*0x60fec0aec070003
cmp r10, [ rsp + 0x180 ]
mov r10, -0x760c000300030003 ; moving imm to reg
setc bpl;
mov byte [ rsp + 0x350 ], r13b; spilling byte x599 to mem
mov r13, rdi;
imul r13, r10; lox285 = x242*-0x760c000300030003
mov r10, [ rsp + 0xe0 ];
add r10, [ rsp + 0x300 ]
mov [ rsp + 0x358 ], rsi; spilling x303 to mem
mov rsi, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, rsi; 0x6730d2a0f6b0f624, swapping with x402, which is currently in rdx
mov byte [ rsp + 0x360 ], bpl; spilling byte x406 to mem
mov [ rsp + 0x368 ], r10; spilling x217 to mem
mulx r10, rbp, r13; x300_1, x300_0<- x285 * 0x6730d2a0f6b0f624 (_0*_0)
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg
mov rdx, r13; x285 to rdx
mov [ rsp + 0x370 ], r10; spilling x300_1 to mem
mulx r10, r13, rbp; x288_1, x288_0<- x285 * 0x1a0111ea397fe69a (_0*_0)
mov r13, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x378 ], r10; spilling x288_1 to mem
mulx r10, rbp, r13; x292_1, x292_0<- x285 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rbp, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x380 ], r10; spilling x292_1 to mem
mulx r10, r13, rbp; x296_1, x296_0<- x285 * 0x64774b84f38512bf (_0*_0)
mov r13, [ rsp + 0x378 ];
mov rbp, [ rsp + 0x368 ]; load m64 x217 to register64
cmp rbp, [ rsp + 0xe0 ]
mov [ rsp + 0x388 ], r10; spilling x296_1 to mem
mov r10, [ rsp + 0xf8 ];
adc r10, 0x0; add CF to r0's alloc
mov [ rsp + 0x390 ], r13; spilling x290 to mem
movzx r13, byte [ rsp + 0x310 ];
rcr byte [ rsp + 0x2e8 ], 1
adc r13, 0x0
cmp r10, [ rsp + 0xf8 ]
mov [ rsp + 0x398 ], r10; spilling x220 to mem
mov r10, [ rsp + 0xd8 ]; load m64 x943 to register64
lea r13, [ r13 + r10 ]; r8/64 + m8
setc bpl;
cmp r13, r10
mov r10, [ rsp + 0x2e0 ];
mov byte [ rsp + 0x3a0 ], bpl; spilling byte x221 to mem
mov rbp, [ rsp + 0x1e0 ];
mov [ rsp + 0x3a8 ], r10; spilling x121 to mem
mov r10, [ rsp + 0x2f8 ]; load m64 x78 to register64
lea rbp, [ rbp + r10 ]; r8/64 + m8
mov [ rsp + 0x3b0 ], rbp; spilling x81 to mem
mov rbp, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x3b8 ], r13; spilling x970 to mem
mulx r13, r10, rbp; x307_1, x307_0<- x285 * 0xb9feffffffffaaab (_0*_0)
mov r10, [ rsp + 0x1e0 ]; load m64 x51 to register64
setc bpl;
cmp [ rsp + 0x3b0 ], r10
mov r10, [ rsp + 0x2f8 ]; load m64 x78 to register64
mov byte [ rsp + 0x3c0 ], bpl; spilling byte x971 to mem
setc bpl;
cmp r10, [ rsp + 0x188 ]
mov r10, [ rsp + 0x78 ]; load m64 x382 to register64
mov byte [ rsp + 0x3c8 ], bpl; spilling byte x82 to mem
setc bpl;
cmp [ rsp + 0x348 ], r10
mov r10, [ rsp + 0x220 ];
mov [ rsp + 0x3d0 ], r13; spilling x309 to mem
mov r13, [ rsp + 0x3a8 ]; load m64 x121 to register64
lea r10, [ r10 + r13 ]; r8/64 + m8
movzx r13, byte [ rsp + 0x340 ]; load byte memx126 to register64
lea r10, [ r10 + r13 ]; r64+m8
mov r13, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x3d8 ], r10; spilling x129 to mem
mov byte [ rsp + 0x3e0 ], bpl; spilling byte x79 to mem
mulx rbp, r10, r13; x304_1, x304_0<- x285 * 0x1eabfffeb153ffff (_0*_0)
mov rdx, rbx;
mov r10, [ rsp + 0x318 ]; load m64 x153 to register64
lea rdx, [ rdx + r10 ]; r8/64 + m8
mov r10, [ rsp + 0x388 ];
mov r13, [ rsp - 0x30 ];
mov [ rsp + 0x3e8 ], r10; spilling x297 to mem
mov r10, [ rsp + 0x398 ]; load m64 x220 to register64
lea r13, [ r13 + r10 ]; r8/64 + m8
movzx r10, byte [ rsp + 0x3c8 ];
mov [ rsp + 0x3f0 ], r13; spilling x223 to mem
movzx r13, byte [ rsp + 0x3e0 ]; load byte memx79 to register64
lea r10, [ r10 + r13 ]; r64+m8
mov r13, [ rsp + 0x3d8 ]; load m64 x129 to register64
mov [ rsp + 0x3f8 ], r10; spilling x84 to mem
setc r10b;
cmp r13, [ rsp + 0x220 ]
mov byte [ rsp + 0x400 ], r10b; spilling byte x409 to mem
mov r10, rdx;
lea r10, [ r10 + r13 ]
mov [ rsp + 0x408 ], rbp; spilling x306 to mem
mov rbp, r10;
mov [ rsp + 0x410 ], rdx; spilling x154 to mem
movzx rdx, byte [ rsp + 0x328 ]; load byte memx243 to register64
lea rbp, [ rbp + rdx ]; r64+m8
mov rdx, rbp;
lea rdx, [ rdx + r9 ]
mov [ rsp + 0x418 ], rdx; spilling x248 to mem
setc dl;
cmp rbp, r10
mov rbp, [ rsp + 0x50 ]; load m64 x564 to register64
lea rcx, [ rcx + rbp ]; r8/64 + m8
mov byte [ rsp + 0x420 ], dl; spilling byte x130 to mem
mov rdx, [ rsp + 0x110 ]; load m64 x754 to register64
mov [ rsp + 0x428 ], rcx; spilling x601 to mem
setc cl;
cmp [ rsp + 0x2c0 ], rdx
movzx rdx, byte [ rsp + 0x2a8 ];
adc rdx, 0x0; add CF to r0's alloc
cmp rdi, 0x0
mov byte [ rsp + 0x430 ], cl; spilling byte x246 to mem
setne cl; setCC x330 to reg (rcx)
add rdx, [ rsp + 0x168 ]
cmp [ rsp + 0x428 ], rbp
movzx rbp, cl;
mov [ rsp + 0x438 ], rdx; spilling x784 to mem
mov rdx, [ rsp + 0x418 ]; load m64 x248 to register64
lea rbp, [ rbp + rdx ]; r8/64 + m8
mov rcx, [ rsp + 0x330 ];
mov [ rsp + 0x440 ], rbp; spilling x332 to mem
mov rbp, [ rsp + 0x408 ]; load m64 x306 to register64
lea rcx, [ rcx + rbp ]; r8/64 + m8
setc bpl;
cmp [ rsp + 0x410 ], rbx
mov rbx, [ rsp + 0x380 ];
mov [ rsp + 0x448 ], rcx; spilling x313 to mem
mov rcx, [ rsp + 0x3f0 ]; load m64 x223 to register64
mov byte [ rsp + 0x450 ], bpl; spilling byte x602 to mem
setc bpl;
cmp rcx, [ rsp - 0x30 ]
mov [ rsp + 0x458 ], rbx; spilling x294 to mem
mov rbx, [ rsp + 0x18 ];
mov byte [ rsp + 0x460 ], bpl; spilling byte x155 to mem
mov rbp, [ rsp + 0x3b8 ]; load m64 x970 to register64
lea rbx, [ rbx + rbp ]; r8/64 + m8
movzx rbp, byte [ rsp + 0x400 ];
mov [ rsp + 0x468 ], rbx; spilling x973 to mem
movzx rbx, byte [ rsp + 0x360 ]; load byte memx406 to register64
lea rbp, [ rbp + rbx ]; r64+m8
movzx rbx, byte [ rsp + 0x3a0 ];
adc rbx, 0x0; add CF to r0's alloc
add rbx, [ rsp + 0x1c0 ]
add rbp, [ rsp + 0x218 ]
mov [ rsp + 0x470 ], rbx; spilling x227 to mem
mov rbx, rbp;
add rbx, [ rsp + 0x170 ]
mov [ rsp + 0x478 ], rbx; spilling x415 to mem
mov rbx, [ rsp + 0x358 ];
add rbx, [ rsp + 0x3d0 ]
mov [ rsp + 0x480 ], rbx; spilling x310 to mem
mov rbx, [ rsp + 0x468 ]; load m64 x973 to register64
cmp rbx, [ rsp + 0x18 ]
mov rbx, [ rsp + 0x480 ]; load m64 x310 to register64
mov [ rsp + 0x488 ], rbp; spilling x412 to mem
setc bpl;
cmp rbx, [ rsp + 0x3d0 ]
mov byte [ rsp + 0x490 ], bpl; spilling byte x974 to mem
setc bpl;
cmp rdx, r9
movzx r9, byte [ rsp + 0x490 ];
mov byte [ rsp + 0x498 ], bpl; spilling byte x311 to mem
movzx rbp, byte [ rsp + 0x3c0 ]; load byte memx971 to register64
lea r9, [ r9 + rbp ]; r64+m8
mov rbp, [ rsp + 0x470 ]; load m64 x227 to register64
mov [ rsp + 0x4a0 ], r9; spilling x976 to mem
setc r9b;
cmp rbp, [ rsp + 0x1c0 ]
mov byte [ rsp + 0x4a8 ], r9b; spilling byte x249 to mem
setc r9b;
cmp r10, r13
mov r13, [ rsp + 0x210 ];
mov r10, [ rsp + 0x438 ]; load m64 x784 to register64
lea r13, [ r13 + r10 ]; r8/64 + m8
mov byte [ rsp + 0x4b0 ], r9b; spilling byte x228 to mem
mov r9, [ rsp + 0x3f8 ];
mov [ rsp + 0x4b8 ], r13; spilling x787 to mem
mov r13, [ rsp + 0x1b8 ]; load m64 x55 to register64
lea r9, [ r9 + r13 ]; r8/64 + m8
mov [ rsp + 0x4c0 ], r9; spilling x85 to mem
movzx r9, byte [ rsp + 0x4a8 ];
movzx r13, byte [ rsp + 0x430 ]; load byte memx246 to register64
lea r9, [ r9 + r13 ]; r64+m8
mov r13, [ rsp + 0x488 ]; load m64 x412 to register64
mov [ rsp + 0x4c8 ], r9; spilling x251 to mem
setc r9b;
cmp r13, [ rsp + 0x218 ]
movzx r13, r9b;
movzx r10, byte [ rsp + 0x460 ]; load byte memx155 to register64
lea r13, [ r13 + r10 ]; r64+m8
mov r10, [ rsp + 0x10 ];
mov r9, [ rsp + 0x4c0 ]; load m64 x85 to register64
lea r10, [ r10 + r9 ]; r8/64 + m8
mov [ rsp + 0x4d0 ], r13; spilling x160 to mem
setc r13b;
cmp r10, [ rsp + 0x10 ]
mov byte [ rsp + 0x4d8 ], r13b; spilling byte x413 to mem
mov r13, [ rsp + 0x4b8 ]; load m64 x787 to register64
mov [ rsp + 0x4e0 ], r10; spilling x88 to mem
setc r10b;
cmp r13, [ rsp + 0x210 ]
mov byte [ rsp + 0x4e8 ], r10b; spilling byte x89 to mem
movzx r10, byte [ rsp + 0x450 ];
movzx r13, byte [ rsp + 0x350 ]; load byte memx599 to register64
lea r10, [ r10 + r13 ]; r64+m8
mov r13, [ rsp + 0x258 ]; load m64 x567 to register64
lea r10, [ r10 + r13 ]; r8/64 + m8
mov [ rsp + 0x4f0 ], r10; spilling x605 to mem
mov r10, [ rsp + 0x170 ]; load m64 x378 to register64
setc r13b;
cmp [ rsp + 0x478 ], r10
mov r10, rbx;
mov byte [ rsp + 0x4f8 ], r13b; spilling byte x788 to mem
mov r13, [ rsp + 0x440 ]; load m64 x332 to register64
lea r10, [ r10 + r13 ]; r8/64 + m8
mov [ rsp + 0x500 ], r10; spilling x335 to mem
mov r10, [ rsp + 0x4f0 ]; load m64 x605 to register64
setc r13b;
cmp r10, [ rsp + 0x258 ]
movzx r10, r13b;
movzx r9, byte [ rsp + 0x4d8 ]; load byte memx413 to register64
lea r10, [ r10 + r9 ]; r64+m8
setc r9b;
cmp [ rsp + 0x500 ], rbx
mov rbx, [ rsp + 0x370 ];
mov r13, [ rsp + 0x4a0 ];
mov [ rsp + 0x508 ], r10; spilling x418 to mem
mov r10, [ rsp + 0x288 ]; load m64 x939 to register64
lea r13, [ r13 + r10 ]; r8/64 + m8
mov [ rsp + 0x510 ], r13; spilling x977 to mem
mov r13, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x518 ], rbx; spilling x301 to mem
setc bl;
mov byte [ rsp + 0x520 ], r9b; spilling byte x606 to mem
mov r9, rdi;
imul r9, r13; lox295 = x242*0x2a880aa4ed33c7c3
movzx r13, byte [ rsp + 0x520 ];
add r13, [ rsp + 0x208 ]
mov [ rsp + 0x528 ], r13; spilling x611 to mem
mov r13, [ rsp + 0x500 ];
add r13, [ rsp + 0x1b0 ]
mov byte [ rsp + 0x530 ], bl; spilling byte x336 to mem
mov rbx, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x538 ], r9; spilling x295 to mem
mov r9, r13;
imul r9, rbx; lox477 = x427*0x299338752f97f97b
mov rbx, [ rsp + 0x4c0 ]; load m64 x85 to register64
cmp rbx, [ rsp + 0x1b8 ]
movzx rbx, byte [ rsp + 0x4e8 ];
adc rbx, 0x0; add CF to r0's alloc
cmp [ rsp + 0x440 ], rdx
mov rdx, [ rsp + 0x538 ];
mov [ rsp + 0x540 ], r9; spilling x477 to mem
mov r9, [ rsp + 0x518 ]; load m64 x302 to register64
lea rdx, [ rdx + r9 ]; r8/64 + m8
mov r9, [ rsp + 0x4f0 ];
mov [ rsp + 0x548 ], rdx; spilling x317 to mem
mov rdx, [ rsp + 0x70 ]; load m64 x559 to register64
lea r9, [ r9 + rdx ]; r8/64 + m8
mov [ rsp + 0x550 ], r9; spilling x608 to mem
movzx r9, byte [ rsp + 0x530 ];
adc r9, 0x0; add CF to r0's alloc
cmp [ rsp + 0x510 ], r10
mov r10, [ rsp + 0x308 ];
mov [ rsp + 0x558 ], r9; spilling x338 to mem
movzx r9, byte [ rsp + 0x420 ]; load byte memx130 to register64
lea r10, [ r10 + r9 ]; r64+m8
mov r9, [ rsp + 0x338 ];
mov [ rsp + 0x560 ], r10; spilling x133 to mem
mov r10, [ rsp + 0x3e8 ]; load m64 x298 to register64
lea r9, [ r9 + r10 ]; r8/64 + m8
mov r10, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x568 ], r9; spilling x321 to mem
setc r9b;
mov [ rsp + 0x570 ], rbx; spilling x91 to mem
mov rbx, r13;
imul rbx, r10; lox485 = x427*0x4cc7c19e39811d94
mov r10, [ rsp + 0x570 ];
add r10, [ rsp + 0xd0 ]
mov [ rsp + 0x578 ], rbx; spilling x485 to mem
mov rbx, r10;
add rbx, [ rsp + 0xc0 ]
mov byte [ rsp + 0x580 ], r9b; spilling byte x978 to mem
mov r9, [ rsp + 0x448 ];
rcr byte [ rsp + 0x498 ], 1
adc r9, 0x0
cmp r10, [ rsp + 0xd0 ]
setc r10b;
cmp rbx, [ rsp + 0xc0 ]
mov byte [ rsp + 0x588 ], r10b; spilling byte x93 to mem
mov r10, [ rsp + 0x510 ];
mov [ rsp + 0x590 ], r9; spilling x314 to mem
mov r9, [ rsp + 0x30 ]; load m64 x931 to register64
lea r10, [ r10 + r9 ]; r8/64 + m8
mov [ rsp + 0x598 ], r10; spilling x980 to mem
mov r10, [ rsp + 0x40 ]; load m64 x193 to register64
lea rbp, [ rbp + r10 ]; r8/64 + m8
mov [ rsp + 0x5a0 ], rbp; spilling x230 to mem
setc bpl;
cmp [ rsp + 0x550 ], rdx
mov rdx, [ rsp + 0x508 ];
mov byte [ rsp + 0x5a8 ], bpl; spilling byte x96 to mem
mov rbp, [ rsp + 0x130 ]; load m64 x381 to register64
lea rdx, [ rdx + rbp ]; r8/64 + m8
mov [ rsp + 0x5b0 ], rdx; spilling x419 to mem
mov rdx, [ rsp + 0x330 ]; load m64 x299 to register64
mov [ rsp + 0x5b8 ], rbp; spilling x381 to mem
setc bpl;
cmp [ rsp + 0x590 ], rdx
mov rdx, [ rsp + 0x548 ];
adc rdx, 0x0; add CF to r0's alloc
mov byte [ rsp + 0x5c0 ], bpl; spilling byte x609 to mem
mov rbp, [ rsp + 0x4d0 ];
add rbp, [ rsp + 0x3b0 ]
cmp [ rsp + 0x598 ], r9
mov r9, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x5c8 ], rdx; spilling x318 to mem
setc dl;
mov [ rsp + 0x5d0 ], rbp; spilling x161 to mem
mov rbp, r13;
imul rbp, r9; lox472 = x427*0x48669f39fb24c32
mov r9, [ rsp + 0x168 ]; load m64 x757 to register64
cmp [ rsp + 0x438 ], r9
setc r9b;
cmp [ rsp + 0x5a0 ], r10
mov r10, [ rsp + 0x5b0 ];
mov byte [ rsp + 0x5d8 ], dl; spilling byte x981 to mem
mov rdx, [ rsp - 0x18 ]; load m64 x373 to register64
lea r10, [ r10 + rdx ]; r8/64 + m8
mov [ rsp + 0x5e0 ], rbp; spilling x472 to mem
movzx rbp, byte [ rsp + 0x4b0 ];
adc rbp, 0x0; add CF to r0's alloc
cmp r10, rdx
mov rdx, [ rsp + 0x5d0 ];
mov [ rsp + 0x5e8 ], rbp; spilling x233 to mem
mov rbp, [ rsp + 0x560 ]; load m64 x133 to register64
lea rdx, [ rdx + rbp ]; r8/64 + m8
mov byte [ rsp + 0x5f0 ], r9b; spilling byte x785 to mem
mov r9, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x5f8 ], rdx; spilling x164 to mem
setc dl;
imul rdi, r9; lox286 = x242*0x48669f39fb24c32
mov r9, [ rsp + 0x4c8 ];
add r9, [ rsp + 0x5f8 ]
mov byte [ rsp + 0x600 ], dl; spilling byte x423 to mem
movzx rdx, byte [ rsp + 0x580 ];
add rdx, [ rsp + 0x1d8 ]
cmp [ rsp + 0x5f8 ], rbp
mov [ rsp + 0x608 ], rdx; spilling x983 to mem
mov rdx, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0x610 ], rdi; spilling x286 to mem
setc dil;
mov [ rsp + 0x618 ], r9; spilling x252 to mem
mov r9, r13;
imul r9, rdx; lox481 = x427*0x2a880aa4ed33c7c3
mov rdx, [ rsp + 0x5c8 ]; load m64 x318 to register64
cmp rdx, [ rsp + 0x538 ]
mov [ rsp + 0x620 ], r9; spilling x481 to mem
mov r9, [ rsp + 0x618 ];
mov byte [ rsp + 0x628 ], dil; spilling byte x165 to mem
mov rdi, [ rsp + 0x368 ]; load m64 x217 to register64
lea r9, [ r9 + rdi ]; r8/64 + m8
mov [ rsp + 0x630 ], r9; spilling x255 to mem
mov r9, [ rsp + 0x568 ];
adc r9, 0x0; add CF to r0's alloc
mov [ rsp + 0x638 ], r9; spilling x322 to mem
movzx r9, byte [ rsp + 0x588 ];
add r9, [ rsp + 0x250 ]
mov [ rsp + 0x640 ], r9; spilling x98 to mem
movzx r9, byte [ rsp + 0x4f8 ];
rcr byte [ rsp + 0x5f0 ], 1
adc r9, 0x0
mov [ rsp + 0x648 ], r9; spilling x790 to mem
mov r9, [ rsp + 0x5b0 ]; load m64 x419 to register64
cmp r9, [ rsp + 0x5b8 ]
mov r9, [ rsp + 0x640 ];
movzx rdx, byte [ rsp + 0x5a8 ]; load byte memx96 to register64
lea r9, [ r9 + rdx ]; r64+m8
mov rdx, [ rsp + 0x48 ];
adc rdx, 0x0; add CF to r0's alloc
cmp rbp, [ rsp + 0x2d0 ]
mov rbp, [ rsp + 0x270 ];
adc rbp, 0x0; add CF to r0's alloc
mov [ rsp + 0x650 ], r9; spilling x99 to mem
mov r9, [ rsp + 0x5e8 ];
add r9, [ rsp + 0xc8 ]
cmp r13, [ rsp + 0x500 ]
mov [ rsp + 0x658 ], rdx; spilling x425 to mem
setc dl;
cmp r9, [ rsp + 0xc8 ]
mov byte [ rsp + 0x660 ], dl; spilling byte x428 to mem
mov rdx, [ rsp + 0x28 ]; load m64 x188 to register64
lea r9, [ r9 + rdx ]; r8/64 + m8
mov [ rsp + 0x668 ], r9; spilling x237 to mem
mov r9, [ rsp + 0xa0 ];
adc r9, 0x0; add CF to r0's alloc
mov [ rsp + 0x670 ], r9; spilling x240 to mem
mov r9, [ rsp + 0x648 ];
add r9, [ rsp + 0x1a8 ]
cmp rbp, [ rsp + 0x88 ]
mov [ rsp + 0x678 ], rbp; spilling x137 to mem
setc bpl;
cmp r9, [ rsp + 0x1a8 ]
mov byte [ rsp + 0x680 ], bpl; spilling byte x138 to mem
mov rbp, [ rsp + 0x618 ]; load m64 x252 to register64
mov [ rsp + 0x688 ], r9; spilling x791 to mem
setc r9b;
cmp rbp, [ rsp + 0x5f8 ]
mov rbp, [ rsp + 0x528 ];
mov byte [ rsp + 0x690 ], r9b; spilling byte x792 to mem
movzx r9, byte [ rsp + 0x5c0 ]; load byte memx609 to register64
lea rbp, [ rbp + r9 ]; r64+m8
mov r9, [ rsp + 0x610 ];
mov [ rsp + 0x698 ], rbp; spilling x612 to mem
mov rbp, [ rsp + 0x458 ]; load m64 x294 to register64
lea r9, [ r9 + rbp ]; r8/64 + m8
setc bpl;
cmp [ rsp + 0x630 ], rdi
mov rdi, [ rsp + 0x638 ]; load m64 x322 to register64
mov [ rsp + 0x6a0 ], r9; spilling x325 to mem
setc r9b;
cmp rdi, [ rsp + 0x338 ]
movzx rdi, r9b;
movzx rbp, bpl
lea rdi, [ rdi + rbp ]
mov rbp, [ rsp + 0x658 ];
movzx r9, byte [ rsp + 0x600 ]; load byte memx423 to register64
lea rbp, [ rbp + r9 ]; r64+m8
mov r9, [ rsp + 0x248 ];
mov [ rsp + 0x6a8 ], rbp; spilling x426 to mem
mov rbp, [ rsp + 0x298 ]; load m64 x109 to register64
lea r9, [ r9 + rbp ]; r8/64 + m8
mov rbp, [ rsp + 0x6a0 ];
adc rbp, 0x0; add CF to r0's alloc
cmp [ rsp + 0x668 ], rdx
movzx rdx, byte [ rsp + 0x680 ]; load byte memx138 to register64
lea r9, [ r9 + rdx ]; r64+m8
mov rdx, [ rsp + 0x558 ];
mov [ rsp + 0x6b0 ], rdi; spilling x258 to mem
mov rdi, [ rsp + 0x630 ]; load m64 x255 to register64
lea rdx, [ rdx + rdi ]; r8/64 + m8
mov [ rsp + 0x6b8 ], rbp; spilling x326 to mem
mov rbp, rdx;
mov [ rsp + 0x6c0 ], r9; spilling x141 to mem
mov r9, [ rsp + 0x590 ]; load m64 x314 to register64
lea rbp, [ rbp + r9 ]; r8/64 + m8
mov [ rsp + 0x6c8 ], rbp; spilling x342 to mem
setc bpl;
cmp rdx, rdi
mov rdi, -0x760c000300030003 ; moving imm to reg
setc dl;
mov byte [ rsp + 0x6d0 ], bpl; spilling byte x238 to mem
mov rbp, r13;
imul rbp, rdi; lox471 = x427*-0x760c000300030003
mov rdi, 0xb9feffffffffaaab ; moving imm to reg
xchg rdx, rdi; 0xb9feffffffffaaab, swapping with x340, which is currently in rdx
mov byte [ rsp + 0x6d8 ], dil; spilling byte x340 to mem
mov [ rsp + 0x6e0 ], r10; spilling x422 to mem
mulx r10, rdi, rbp; x493_1, x493_0<- x471 * 0xb9feffffffffaaab (_0*_0)
mov rdi, 0x64774b84f38512bf ; moving imm to reg
mov rdx, rbp; x471 to rdx
mov [ rsp + 0x6e8 ], r10; spilling x494 to mem
mulx r10, rbp, rdi; x482_1, x482_0<- x471 * 0x64774b84f38512bf (_0*_0)
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0x6f0 ], r10; spilling x482_1 to mem
mulx r10, rdi, rbp; x474_1, x474_0<- x471 * 0x1a0111ea397fe69a (_0*_0)
mov rdi, [ rsp + 0x6f0 ];
cmp [ rsp + 0x6c8 ], r9
mov r9, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x6f8 ], r10; spilling x474_1 to mem
mulx r10, rbp, r9; x490_1, x490_0<- x471 * 0x1eabfffeb153ffff (_0*_0)
mov rbp, [ rsp + 0x688 ];
mov r9, [ rsp + 0xb8 ]; load m64 x745 to register64
lea rbp, [ rbp + r9 ]; r8/64 + m8
mov [ rsp + 0x700 ], r10; spilling x491 to mem
mov r10, [ rsp + 0x540 ]; load m64 x477 to register64
lea rdi, [ rdi + r10 ]; r8/64 + m8
mov [ rsp + 0x708 ], rdi; spilling x507 to mem
movzx rdi, byte [ rsp + 0x6d8 ];
adc rdi, 0x0; add CF to r0's alloc
mov [ rsp + 0x710 ], rdi; spilling x345 to mem
mov rdi, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x718 ], rbp; spilling x794 to mem
mulx r10, rbp, rdi; x478_1, x478_0<- x471 * 0x4b1ba7b6434bacd7 (_0*_0)
mov rbp, [ rsp + 0x6c0 ]; load m64 x141 to register64
cmp rbp, [ rsp + 0x248 ]
mov rdi, [ rsp + 0x670 ];
mov [ rsp + 0x720 ], r10; spilling x480 to mem
movzx r10, byte [ rsp + 0x6d0 ]; load byte memx238 to register64
lea rdi, [ rdi + r10 ]; r64+m8
movzx r10, byte [ rsp + 0x690 ];
mov [ rsp + 0x728 ], rdi; spilling x241 to mem
mov rdi, [ rsp + 0x240 ]; load m64 x749 to register64
lea r10, [ r10 + rdi ]; r8/64 + m8
setc dil;
cmp [ rsp + 0x718 ], r9
adc r10, 0x0; add CF to r0's alloc
mov r9, [ rsp + 0x6f8 ];
mov [ rsp + 0x730 ], r10; spilling x798 to mem
mov r10, [ rsp + 0x6c8 ];
rcr byte [ rsp + 0x660 ], 1
adc r10, 0x0
mov [ rsp + 0x738 ], r9; spilling x475 to mem
mov r9, [ rsp + 0x5e0 ];
add r9, [ rsp + 0x720 ]
mov [ rsp + 0x740 ], r9; spilling x511 to mem
mov r9, r10;
add r9, [ rsp + 0x1d0 ]
cmp r9, [ rsp + 0x1d0 ]
mov [ rsp + 0x748 ], r9; spilling x433 to mem
movzx r9, dil;
mov [ rsp + 0x750 ], r10; spilling x430 to mem
mov r10, [ rsp + 0x2b8 ]; load m64 x105 to register64
lea r9, [ r9 + r10 ]; r8/64 + m8
setc r10b;
cmp r13, 0x0
setne dil; setCC x516 to reg (rdi)
mov [ rsp + 0x758 ], r9; spilling x144 to mem
mov r9, [ rsp + 0x3b0 ]; load m64 x81 to register64
cmp [ rsp + 0x5d0 ], r9
mov r9, 0x60fec0aec070003 ; moving imm to reg
mov byte [ rsp + 0x760 ], r10b; spilling byte x434 to mem
setc r10b;
imul r13, r9; lox489 = x427*0x60fec0aec070003
movzx r9, dil;
add r9, [ rsp + 0x748 ]
mov rdi, [ rsp + 0x610 ]; load m64 x286 to register64
cmp [ rsp + 0x6b8 ], rdi
movzx rdi, r10b;
mov [ rsp + 0x768 ], r9; spilling x518 to mem
movzx r9, byte [ rsp + 0x628 ]; load byte memx165 to register64
lea rdi, [ rdi + r9 ]; r64+m8
mov r9, [ rsp + 0x750 ]; load m64 x430 to register64
setc r10b;
cmp r9, [ rsp + 0x6c8 ]
movzx r9, r10b;
mov [ rsp + 0x770 ], r13; spilling x489 to mem
mov r13, [ rsp + 0x390 ]; load m64 x290 to register64
lea r9, [ r9 + r13 ]; r8/64 + m8
movzx r13, byte [ rsp + 0x760 ];
adc r13, 0x0; add CF to r0's alloc
add rdi, [ rsp + 0x4e0 ]
mov r10, 0x6730d2a0f6b0f624 ; moving imm to reg
mov [ rsp + 0x778 ], r9; spilling x329 to mem
mov [ rsp + 0x780 ], r13; spilling x436 to mem
mulx r13, r9, r10; x486_1, x486_0<- x471 * 0x6730d2a0f6b0f624 (_0*_0)
mov rdx, [ rsp + 0x770 ];
add rdx, [ rsp + 0x6e8 ]
mov r9, rdx;
add r9, [ rsp + 0x768 ]
cmp r9, rdx
setc r10b;
cmp rdx, [ rsp + 0x6e8 ]
setc dl;
cmp rdi, [ rsp + 0x4e0 ]
mov [ rsp + 0x788 ], r13; spilling x488 to mem
mov r13, [ rsp + 0x678 ]; load m64 x137 to register64
lea rdi, [ rdi + r13 ]; r8/64 + m8
mov byte [ rsp + 0x790 ], dl; spilling byte x497 to mem
mov rdx, rdi;
mov byte [ rsp + 0x798 ], r10b; spilling byte x522 to mem
mov r10, [ rsp + 0x6b0 ]; load m64 x258 to register64
lea rdx, [ rdx + r10 ]; r8/64 + m8
mov r10, rdx;
lea r10, [ r10 + rcx ]
mov [ rsp + 0x7a0 ], r10; spilling x262 to mem
setc r10b;
cmp rdx, rdi
mov rdx, [ rsp + 0x710 ];
mov byte [ rsp + 0x7a8 ], r10b; spilling byte x169 to mem
mov r10, [ rsp + 0x7a0 ]; load m64 x262 to register64
lea rdx, [ rdx + r10 ]; r8/64 + m8
mov r10, rdx;
mov [ rsp + 0x7b0 ], rdi; spilling x171 to mem
mov rdi, [ rsp + 0x5c8 ]; load m64 x318 to register64
lea r10, [ r10 + rdi ]; r8/64 + m8
mov [ rsp + 0x7b8 ], rdx; spilling x346 to mem
mov rdx, r10;
mov [ rsp + 0x7c0 ], r9; spilling x521 to mem
mov r9, [ rsp + 0x780 ]; load m64 x436 to register64
lea rdx, [ rdx + r9 ]; r8/64 + m8
mov r9, [ rsp + 0x7c0 ];
mov [ rsp + 0x7c8 ], rdx; spilling x437 to mem
mov rdx, [ rsp + 0x68 ]; load m64 x580 to register64
lea r9, [ r9 + rdx ]; r8/64 + m8
mov rdx, 0x48669f39fb24c32 ; moving imm to reg
mov [ rsp + 0x7d0 ], r10; spilling x349 to mem
setc r10b;
mov rbp, r9;
imul rbp, rdx; lox658 = x613*0x48669f39fb24c32
cmp r9, [ rsp + 0x7c0 ]
mov rdx, rsi;
mov byte [ rsp + 0x7d8 ], r10b; spilling byte x260 to mem
mov r10, [ rsp + 0x7c8 ]; load m64 x437 to register64
lea rdx, [ rdx + r10 ]; r8/64 + m8
mov [ rsp + 0x7e0 ], rbp; spilling x658 to mem
mov rbp, 0x4cc7c19e39811d94 ; moving imm to reg
mov [ rsp + 0x7e8 ], rdx; spilling x440 to mem
setc dl;
mov r10, r9;
imul r10, rbp; lox671 = x613*0x4cc7c19e39811d94
mov rbp, -0x760c000300030003 ; moving imm to reg
mov [ rsp + 0x7f0 ], r10; spilling x671 to mem
mov r10, r9;
imul r10, rbp; lox657 = x613*-0x760c000300030003
mov rbp, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, r10; x657, swapping with x614, which is currently in rdx
mov byte [ rsp + 0x7f8 ], r10b; spilling byte x614 to mem
mov [ rsp + 0x800 ], r9; spilling x613 to mem
mulx r9, r10, rbp; x660_1, x660_0<- x657 * 0x1a0111ea397fe69a (_0*_0)
mov r10, 0x1eabfffeb153ffff ; moving imm to reg
mov [ rsp + 0x808 ], r9; spilling x660_1 to mem
mulx r9, rbp, r10; x676_1, x676_0<- x657 * 0x1eabfffeb153ffff (_0*_0)
mov rbp, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov [ rsp + 0x810 ], r9; spilling x676_1 to mem
mulx r9, r10, rbp; x664_1, x664_0<- x657 * 0x4b1ba7b6434bacd7 (_0*_0)
mov r10, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov rbp, [ rsp + 0x800 ];
imul rbp, r10; lox667 = x613*0x2a880aa4ed33c7c3
mov r10, [ rsp + 0x810 ];
mov [ rsp + 0x818 ], rbp; spilling x667 to mem
mov rbp, [ rsp + 0x768 ]; load m64 x518 to register64
cmp rbp, [ rsp + 0x748 ]
mov rbp, [ rsp + 0x578 ];
mov [ rsp + 0x820 ], r10; spilling x677 to mem
mov r10, [ rsp + 0x700 ]; load m64 x492 to register64
lea rbp, [ rbp + r10 ]; r8/64 + m8
mov r10, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x828 ], rbp; spilling x499 to mem
mov [ rsp + 0x830 ], r9; spilling x664_1 to mem
mulx r9, rbp, r10; x668_1, x668_0<- x657 * 0x64774b84f38512bf (_0*_0)
movzx rbp, byte [ rsp + 0x798 ];
adc rbp, 0x0; add CF to r0's alloc
add rbp, [ rsp + 0x7e8 ]
mov r10, 0xb9feffffffffaaab ; moving imm to reg
mov [ rsp + 0x838 ], r9; spilling x669 to mem
mov [ rsp + 0x840 ], rbp; spilling x525 to mem
mulx rbp, r9, r10; x679_1, x679_0<- x657 * 0xb9feffffffffaaab (_0*_0)
cmp [ rsp + 0x7b0 ], r13
movzx r13, byte [ rsp + 0x7a8 ];
adc r13, 0x0; add CF to r0's alloc
lea r13, [ r13 + rbx ]
mov r9, [ rsp + 0x7e8 ]; load m64 x440 to register64
cmp [ rsp + 0x840 ], r9
mov r10, [ rsp + 0x808 ];
mov [ rsp + 0x848 ], r10; spilling x661 to mem
mov r10, [ rsp + 0x830 ];
mov [ rsp + 0x850 ], r13; spilling x175 to mem
setc r13b;
cmp r9, rsi
mov rsi, [ rsp + 0x7b8 ]; load m64 x346 to register64
setc r9b;
cmp rsi, [ rsp + 0x7a0 ]
mov rsi, 0x6730d2a0f6b0f624 ; moving imm to reg
mov byte [ rsp + 0x858 ], r9b; spilling byte x441 to mem
mov byte [ rsp + 0x860 ], r13b; spilling byte x526 to mem
mulx r13, r9, rsi; x672_1, x672_0<- x657 * 0x6730d2a0f6b0f624 (_0*_0)
mov rdx, [ rsp + 0x828 ];
movzx r9, byte [ rsp + 0x790 ]; load byte memx497 to register64
lea rdx, [ rdx + r9 ]; r64+m8
mov r9, rdx;
mov rsi, [ rsp + 0x840 ]; load m64 x525 to register64
lea r9, [ r9 + rsi ]; r8/64 + m8
mov rsi, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0x868 ], r9; spilling x528 to mem
setc r9b;
mov [ rsp + 0x870 ], r10; spilling x666 to mem
mov r10, [ rsp + 0x800 ];
imul r10, rsi; lox675 = x613*0x60fec0aec070003
lea r10, [ r10 + rbp ]
mov rsi, [ rsp + 0x7e0 ];
add rsi, [ rsp + 0x870 ]
mov [ rsp + 0x878 ], rsi; spilling x697 to mem
mov rsi, [ rsp + 0x7d0 ]; load m64 x349 to register64
cmp [ rsp + 0x7c8 ], rsi
mov [ rsp + 0x880 ], r13; spilling x674 to mem
setc r13b;
cmp [ rsp + 0x868 ], rdx
mov byte [ rsp + 0x888 ], r13b; spilling byte x438 to mem
setc r13b;
cmp [ rsp + 0x7a0 ], rcx
movzx rcx, byte [ rsp + 0x7d8 ];
adc rcx, 0x0; add CF to r0's alloc
mov [ rsp + 0x890 ], r10; spilling x682 to mem
mov r10, [ rsp + 0x868 ];
rcr byte [ rsp + 0x7f8 ], 1
adc r10, 0x0
mov byte [ rsp + 0x898 ], r13b; spilling byte x529 to mem
mov r13, [ rsp + 0x850 ];
add r13, [ rsp + 0x6c0 ]
mov byte [ rsp + 0x8a0 ], r9b; spilling byte x347 to mem
mov r9, [ rsp + 0x620 ];
add r9, [ rsp + 0x788 ]
cmp rsi, rdi
mov rdi, r10;
mov rsi, [ rsp + 0x150 ]; load m64 x584 to register64
lea rdi, [ rdi + rsi ]; r8/64 + m8
lea rcx, [ rcx + r13 ]
mov [ rsp + 0x8a8 ], rcx; spilling x266 to mem
setc cl;
cmp rdi, rsi
movzx rsi, cl;
mov [ rsp + 0x8b0 ], r9; spilling x503 to mem
movzx r9, byte [ rsp + 0x8a0 ]; load byte memx347 to register64
lea rsi, [ rsi + r9 ]; r64+m8
setc r9b;
cmp rdx, [ rsp + 0x578 ]
mov rdx, [ rsp + 0x8b0 ];
adc rdx, 0x0; add CF to r0's alloc
cmp [ rsp + 0x850 ], rbx
setc bl;
cmp r10, [ rsp + 0x868 ]
setc r10b;
cmp r13, [ rsp + 0x6c0 ]
mov rcx, [ rsp + 0x7f0 ];
mov byte [ rsp + 0x8b8 ], r10b; spilling byte x617 to mem
mov r10, [ rsp + 0x820 ]; load m64 x678 to register64
lea rcx, [ rcx + r10 ]; r8/64 + m8
movzx r10, byte [ rsp + 0x898 ];
mov byte [ rsp + 0x8c0 ], r9b; spilling byte x620 to mem
movzx r9, byte [ rsp + 0x860 ]; load byte memx526 to register64
lea r10, [ r10 + r9 ]; r64+m8
setc r9b;
cmp qword [ rsp + 0x800 ], 0x0
mov [ rsp + 0x8c8 ], r10; spilling x531 to mem
setne r10b; setCC x702 to reg (r10)
mov [ rsp + 0x8d0 ], rsi; spilling x352 to mem
mov rsi, 0x299338752f97f97b ; moving imm to reg
mov byte [ rsp + 0x8d8 ], r10b; spilling byte x702 to mem
mov r10, [ rsp + 0x800 ];
imul r10, rsi; lox663 = x613*0x299338752f97f97b
mov rsi, r10;
add rsi, [ rsp + 0x838 ]
cmp [ rsp + 0x890 ], rbp
setc bpl;
cmp rdx, [ rsp + 0x620 ]
mov [ rsp + 0x8e0 ], rsi; spilling x693 to mem
movzx rsi, bpl;
lea rsi, [ rsi + rcx ]
movzx rcx, r9b;
movzx rbx, bl
lea rcx, [ rcx + rbx ]
mov rbx, rdi;
movzx r9, byte [ rsp + 0x8d8 ]; load byte memx702 to register64
lea rbx, [ rbx + r9 ]; r64+m8
mov r9, [ rsp + 0x650 ]; load m64 x99 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
mov rbp, [ rsp + 0x8a8 ];
mov [ rsp + 0x8e8 ], rsi; spilling x686 to mem
mov rsi, [ rsp + 0x5a0 ]; load m64 x230 to register64
lea rbp, [ rbp + rsi ]; r8/64 + m8
mov [ rsp + 0x8f0 ], rbx; spilling x704 to mem
mov rbx, [ rsp + 0x708 ];
adc rbx, 0x0; add CF to r0's alloc
mov [ rsp + 0x8f8 ], rbx; spilling x508 to mem
mov rbx, rbp;
add rbx, [ rsp + 0x8d0 ]
mov [ rsp + 0x900 ], rbx; spilling x353 to mem
mov rbx, rcx;
add rbx, [ rsp + 0x758 ]
cmp [ rsp + 0x900 ], rbp
mov [ rsp + 0x908 ], rbx; spilling x185 to mem
setc bl;
cmp rcx, r9
mov r9, [ rsp + 0x728 ];
adc r9, 0x0; add CF to r0's alloc
mov rcx, [ rsp + 0x758 ]; load m64 x144 to register64
cmp [ rsp + 0x908 ], rcx
adc r9, 0x0; add CF to r0's alloc
mov rcx, [ rsp + 0x8f0 ];
add rcx, [ rsp + 0x890 ]
mov [ rsp + 0x910 ], r9; spilling x280 to mem
mov r9, rcx;
add r9, [ rsp + 0x60 ]
mov byte [ rsp + 0x918 ], bl; spilling byte x354 to mem
mov rbx, [ rsp + 0x900 ];
add rbx, [ rsp + 0x638 ]
mov [ rsp + 0x920 ], rbx; spilling x356 to mem
mov rbx, 0x299338752f97f97b ; moving imm to reg
mov [ rsp + 0x928 ], rcx; spilling x707 to mem
mov rcx, r9;
imul rcx, rbx; lox849 = x799*0x299338752f97f97b
mov rbx, [ rsp + 0x920 ]; load m64 x356 to register64
cmp rbx, [ rsp + 0x638 ]
mov [ rsp + 0x930 ], rcx; spilling x849 to mem
movzx rcx, byte [ rsp + 0x858 ];
movzx rbx, byte [ rsp + 0x888 ]; load byte memx438 to register64
lea rcx, [ rcx + rbx ]; r64+m8
mov rbx, [ rsp + 0x920 ]; load m64 x356 to register64
lea rcx, [ rcx + rbx ]; r8/64 + m8
mov rbx, rcx;
mov [ rsp + 0x938 ], r9; spilling x799 to mem
mov r9, [ rsp + 0x348 ]; load m64 x408 to register64
lea rbx, [ rbx + r9 ]; r8/64 + m8
mov [ rsp + 0x940 ], rbx; spilling x447 to mem
setc bl;
cmp rbp, rsi
mov rsi, 0x48669f39fb24c32 ; moving imm to reg
setc bpl;
mov byte [ rsp + 0x948 ], bl; spilling byte x357 to mem
mov rbx, [ rsp + 0x938 ];
imul rbx, rsi; lox844 = x799*0x48669f39fb24c32
cmp [ rsp + 0x8a8 ], r13
movzx r13, byte [ rsp + 0x8c0 ];
movzx rsi, byte [ rsp + 0x8b8 ]; load byte memx617 to register64
lea r13, [ r13 + rsi ]; r64+m8
mov rsi, [ rsp + 0x8f8 ]; load m64 x508 to register64
mov [ rsp + 0x950 ], rbx; spilling x844 to mem
setc bl;
cmp rsi, [ rsp + 0x540 ]
mov [ rsp + 0x958 ], r13; spilling x622 to mem
mov r13, -0x760c000300030003 ; moving imm to reg
mov byte [ rsp + 0x960 ], bl; spilling byte x267 to mem
setc bl;
mov byte [ rsp + 0x968 ], bpl; spilling byte x270 to mem
mov rbp, [ rsp + 0x938 ];
imul rbp, r13; lox843 = x799*-0x760c000300030003
movzx r13, bl;
add r13, [ rsp + 0x740 ]
movzx rbx, byte [ rsp + 0x968 ];
rcr byte [ rsp + 0x960 ], 1
adc rbx, 0x0
mov [ rsp + 0x970 ], rbx; spilling x272 to mem
mov rbx, 0x6730d2a0f6b0f624 ; moving imm to reg
xchg rdx, rbp; x843, swapping with x504, which is currently in rdx
mov [ rsp + 0x978 ], r13; spilling x512 to mem
mulx rsi, r13, rbx; x858_1, x858_0<- x843 * 0x6730d2a0f6b0f624 (_0*_0)
mov r13, [ rsp + 0x938 ]; load m64 x799 to register64
cmp r13, [ rsp + 0x928 ]
mov rbx, [ rsp + 0x818 ];
mov [ rsp + 0x980 ], rsi; spilling x860 to mem
mov rsi, [ rsp + 0x880 ]; load m64 x674 to register64
lea rbx, [ rbx + rsi ]; r8/64 + m8
setc sil;
cmp [ rsp + 0x940 ], r9
mov r9, 0xb9feffffffffaaab ; moving imm to reg
mov byte [ rsp + 0x988 ], sil; spilling byte x800 to mem
mov [ rsp + 0x990 ], rbx; spilling x689 to mem
mulx rbx, rsi, r9; x865_1, x865_0<- x843 * 0xb9feffffffffaaab (_0*_0)
mov rsi, [ rsp + 0x7f0 ]; load m64 x671 to register64
setc r9b;
cmp [ rsp + 0x8e8 ], rsi
mov rsi, [ rsp + 0x990 ];
adc rsi, 0x0; add CF to r0's alloc
mov [ rsp + 0x998 ], r14; spilling x956 to mem
mov r14, [ rsp + 0x5e0 ]; load m64 x472 to register64
cmp [ rsp + 0x978 ], r14
mov r14, 0x4cc7c19e39811d94 ; moving imm to reg
mov byte [ rsp + 0x9a0 ], r9b; spilling byte x448 to mem
setc r9b;
mov [ rsp + 0x9a8 ], rbx; spilling x865_1 to mem
mov rbx, r13;
imul rbx, r14; lox857 = x799*0x4cc7c19e39811d94
movzx r14, r9b;
add r14, [ rsp + 0x738 ]
mov r9, [ rsp + 0x8c8 ];
add r9, [ rsp + 0x940 ]
mov [ rsp + 0x9b0 ], r14; spilling x515 to mem
mov r14, [ rsp + 0x928 ]; load m64 x707 to register64
cmp r14, [ rsp + 0x890 ]
setc r14b;
cmp rsi, [ rsp + 0x818 ]
mov [ rsp + 0x9b8 ], rbx; spilling x857 to mem
mov rbx, [ rsp + 0x8e0 ];
adc rbx, 0x0; add CF to r0's alloc
cmp r9, [ rsp + 0x940 ]
mov [ rsp + 0x9c0 ], rbx; spilling x694 to mem
mov rbx, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov byte [ rsp + 0x9c8 ], r14b; spilling byte x708 to mem
setc r14b;
mov [ rsp + 0x9d0 ], r9; spilling x532 to mem
mov r9, r13;
imul r9, rbx; lox853 = x799*0x2a880aa4ed33c7c3
mov rbx, 0x1a0111ea397fe69a ; moving imm to reg
mov byte [ rsp + 0x9d8 ], r14b; spilling byte x533 to mem
mov [ rsp + 0x9e0 ], r9; spilling x853 to mem
mulx r9, r14, rbx; x846_1, x846_0<- x843 * 0x1a0111ea397fe69a (_0*_0)
cmp [ rsp + 0x8f0 ], rdi
mov rdi, 0x1eabfffeb153ffff ; moving imm to reg
mulx rbx, r14, rdi; x862_1, x862_0<- x843 * 0x1eabfffeb153ffff (_0*_0)
movzx r14, byte [ rsp + 0x9c8 ];
adc r14, 0x0; add CF to r0's alloc
mov rdi, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0x9e8 ], r14; spilling x710 to mem
mov [ rsp + 0x9f0 ], r9; spilling x846_1 to mem
mulx r9, r14, rdi; x854_1, x854_0<- x843 * 0x64774b84f38512bf (_0*_0)
cmp [ rsp + 0x9c0 ], r10
mov r10, [ rsp + 0x878 ];
adc r10, 0x0; add CF to r0's alloc
mov r14, [ rsp + 0x970 ];
add r14, [ rsp + 0x908 ]
mov rdi, [ rsp + 0x9e0 ];
add rdi, [ rsp + 0x980 ]
mov [ rsp + 0x9f8 ], rdi; spilling x875 to mem
movzx rdi, byte [ rsp + 0x948 ];
rcr byte [ rsp + 0x918 ], 1
adc rdi, 0x0
mov [ rsp + 0xa00 ], rbx; spilling x864 to mem
mov rbx, [ rsp + 0x9a8 ];
cmp r14, [ rsp + 0x908 ]
mov [ rsp + 0xa08 ], r9; spilling x855 to mem
mov r9, [ rsp + 0x668 ]; load m64 x237 to register64
lea r14, [ r14 + r9 ]; r8/64 + m8
mov [ rsp + 0xa10 ], r10; spilling x698 to mem
mov r10, rbp;
mov [ rsp + 0xa18 ], rbx; spilling x866 to mem
mov rbx, [ rsp + 0x9d0 ]; load m64 x532 to register64
lea r10, [ r10 + rbx ]; r8/64 + m8
lea rdi, [ rdi + r14 ]
mov rbx, r10;
mov [ rsp + 0xa20 ], rdi; spilling x360 to mem
mov rdi, [ rsp + 0x958 ]; load m64 x622 to register64
lea rbx, [ rbx + rdi ]; r8/64 + m8
mov rdi, [ rsp + 0xa20 ];
mov [ rsp + 0xa28 ], rbx; spilling x623 to mem
mov rbx, [ rsp + 0x6b8 ]; load m64 x326 to register64
lea rdi, [ rdi + rbx ]; r8/64 + m8
mov [ rsp + 0xa30 ], rdi; spilling x363 to mem
setc dil;
cmp [ rsp + 0xa20 ], r14
mov byte [ rsp + 0xa38 ], dil; spilling byte x274 to mem
setc dil;
cmp r10, rbp
movzx rbp, byte [ rsp + 0x9d8 ];
adc rbp, 0x0; add CF to r0's alloc
mov [ rsp + 0xa40 ], rbp; spilling x538 to mem
mov rbp, [ rsp + 0x9f0 ];
cmp [ rsp + 0xa28 ], r10
setc r10b;
cmp rcx, [ rsp + 0x920 ]
movzx rcx, byte [ rsp + 0x9a0 ];
adc rcx, 0x0; add CF to r0's alloc
mov byte [ rsp + 0xa48 ], r10b; spilling byte x624 to mem
mov r10, 0x60fec0aec070003 ; moving imm to reg
mov [ rsp + 0xa50 ], rbp; spilling x847 to mem
mov rbp, r13;
imul rbp, r10; lox861 = x799*0x60fec0aec070003
add rbp, [ rsp + 0xa18 ]
mov r10, [ rsp + 0x7e0 ]; load m64 x658 to register64
cmp [ rsp + 0xa10 ], r10
setc r10b;
cmp rbp, [ rsp + 0xa18 ]
mov byte [ rsp + 0xa58 ], r10b; spilling byte x699 to mem
mov r10, [ rsp + 0x910 ];
mov [ rsp + 0xa60 ], rcx; spilling x450 to mem
movzx rcx, byte [ rsp + 0xa38 ]; load byte memx274 to register64
lea r10, [ r10 + rcx ]; r64+m8
mov rcx, [ rsp + 0x930 ];
mov byte [ rsp + 0xa68 ], dil; spilling byte x361 to mem
mov rdi, [ rsp + 0xa08 ]; load m64 x856 to register64
lea rcx, [ rcx + rdi ]; r8/64 + m8
mov rdi, [ rsp + 0x9b8 ];
mov [ rsp + 0xa70 ], rcx; spilling x879 to mem
mov rcx, [ rsp + 0xa00 ]; load m64 x864 to register64
lea rdi, [ rdi + rcx ]; r8/64 + m8
setc cl;
cmp [ rsp + 0xa30 ], rbx
movzx rbx, cl;
lea rbx, [ rbx + rdi ]
setc cl;
cmp r14, r9
mov r9, 0x4b1ba7b6434bacd7 ; moving imm to reg
mulx rdi, r14, r9; x850_1, x850_0<- x843 * 0x4b1ba7b6434bacd7 (_0*_0)
adc r10, 0x0; add CF to r0's alloc
movzx rdx, cl;
rcr byte [ rsp + 0xa68 ], 1
adc rdx, 0x0
lea rdx, [ rdx + r10 ]
mov rcx, [ rsp + 0xa60 ];
add rcx, [ rsp + 0xa30 ]
cmp r13, 0x0
setne r14b; setCC x888 to reg (r14)
mov r13, rcx;
add r13, [ rsp + 0x478 ]
mov r9, r15;
add r9, [ rsp + 0xa28 ]
mov [ rsp + 0xa78 ], rbx; spilling x872 to mem
mov rbx, r13;
add rbx, [ rsp + 0xa40 ]
mov byte [ rsp + 0xa80 ], r14b; spilling byte x888 to mem
mov r14, r9;
add r14, [ rsp + 0x9e8 ]
cmp r14, r9
mov [ rsp + 0xa88 ], rdi; spilling x850_1 to mem
setc dil;
cmp r9, r15
mov r15, rbx;
mov r9, [ rsp + 0x8f8 ]; load m64 x508 to register64
lea r15, [ r15 + r9 ]; r8/64 + m8
mov byte [ rsp + 0xa90 ], dil; spilling byte x712 to mem
movzx rdi, byte [ rsp + 0xa48 ];
adc rdi, 0x0; add CF to r0's alloc
lea rdi, [ rdi + r15 ]
cmp rdx, r10
mov [ rsp + 0xa98 ], rdi; spilling x630 to mem
setc dil;
cmp rcx, [ rsp + 0xa30 ]
mov rcx, [ rsp + 0xa98 ];
mov byte [ rsp + 0xaa0 ], dil; spilling byte x368 to mem
mov rdi, [ rsp + 0x2f0 ]; load m64 x594 to register64
lea rcx, [ rcx + rdi ]; r8/64 + m8
mov [ rsp + 0xaa8 ], rcx; spilling x633 to mem
mov rcx, [ rsp + 0xa88 ];
mov [ rsp + 0xab0 ], rcx; spilling x851 to mem
setc cl;
cmp r13, [ rsp + 0x478 ]
mov byte [ rsp + 0xab8 ], cl; spilling byte x452 to mem
setc cl;
cmp r15, r9
setc r9b;
cmp r10, [ rsp + 0x728 ]
setc r10b;
cmp rbx, r13
movzx r13, r9b;
adc r13, 0x0; add CF to r0's alloc
add r14, [ rsp + 0x8e8 ]
mov rbx, r14;
rcr byte [ rsp + 0x988 ], 1
adc rbx, 0x0
movzx r9, r10b;
add r9, [ rsp + 0x6a8 ]
mov r10, rbx;
lea r10, [ r10 + r11 ]
cmp rbx, r14
setc bl;
cmp r14, [ rsp + 0x8e8 ]
mov r14, r10;
mov [ rsp + 0xac0 ], r9; spilling x464 to mem
movzx r9, byte [ rsp + 0xa80 ]; load byte memx888 to register64
lea r14, [ r14 + r9 ]; r64+m8
movzx r9, byte [ rsp + 0xa90 ];
adc r9, 0x0; add CF to r0's alloc
add r9, [ rsp + 0xaa8 ]
cmp r10, r11
mov r11, r9;
lea r11, [ r11 + rsi ]
mov [ rsp + 0xac8 ], r14; spilling x890 to mem
movzx r14, bl;
adc r14, 0x0; add CF to r0's alloc
lea r14, [ r14 + r11 ]
add rdx, [ rsp + 0x778 ]
cmp r14, r11
movzx rbx, cl;
mov [ rsp + 0xad0 ], r13; spilling x545 to mem
movzx r13, byte [ rsp + 0xab8 ]; load byte memx452 to register64
lea rbx, [ rbx + r13 ]; r64+m8
lea rbx, [ rbx + rdx ]
setc r13b;
cmp r11, rsi
lea r14, [ r14 + r12 ]
mov rsi, rbx;
mov rcx, [ rsp + 0x6e0 ]; load m64 x422 to register64
lea rsi, [ rsi + rcx ]; r8/64 + m8
setc r11b;
cmp rbx, rdx
mov rbx, rsi;
mov byte [ rsp + 0xad8 ], r13b; spilling byte x810 to mem
mov r13, [ rsp + 0xad0 ]; load m64 x545 to register64
lea rbx, [ rbx + r13 ]; r8/64 + m8
setc r13b;
cmp rdx, [ rsp + 0x778 ]
setc dl;
cmp rbx, rsi
mov byte [ rsp + 0xae0 ], r11b; spilling byte x722 to mem
mov r11, [ rsp + 0xac0 ];
mov byte [ rsp + 0xae8 ], r13b; spilling byte x459 to mem
movzx r13, byte [ rsp + 0xaa0 ]; load byte memx368 to register64
lea r11, [ r11 + r13 ]; r64+m8
movzx r13, dl;
lea r13, [ r13 + r11 ]
setc dl;
cmp r14, r12
setc r12b;
cmp [ rsp + 0xac8 ], r10
mov r10, rbp;
mov r11, [ rsp + 0xac8 ]; load m64 x890 to register64
lea r10, [ r10 + r11 ]; r8/64 + m8
setc r11b;
cmp r10, rbp
mov rbp, r10;
mov byte [ rsp + 0xaf0 ], r12b; spilling byte x813 to mem
mov r12, [ rsp + 0x178 ]; load m64 x952 to register64
lea rbp, [ rbp + r12 ]; r8/64 + m8
movzx r12, byte [ rsp + 0xae8 ]; load byte memx459 to register64
lea r13, [ r13 + r12 ]; r64+m8
movzx r12, r11b;
adc r12, 0x0; add CF to r0's alloc
cmp rsi, rcx
adc r13, 0x0; add CF to r0's alloc
cmp r13, [ rsp + 0x6a8 ]
mov rcx, -0x760c000300030003 ; moving imm to reg
setc sil;
mov r11, rbp;
imul r11, rcx; lox1029 = x985*-0x760c000300030003
mov rcx, 0x60fec0aec070003 ; moving imm to reg
mov byte [ rsp + 0xaf8 ], sil; spilling byte x469 to mem
mov rsi, rbp;
imul rsi, rcx; lox1047 = x985*0x60fec0aec070003
cmp rbp, r10
mov r10, 0x4cc7c19e39811d94 ; moving imm to reg
setc cl;
mov [ rsp + 0xb00 ], rsi; spilling x1047 to mem
mov rsi, rbp;
imul rsi, r10; lox1043 = x985*0x4cc7c19e39811d94
mov r10, 0x1a0111ea397fe69a ; moving imm to reg
xchg rdx, r10; 0x1a0111ea397fe69a, swapping with x547, which is currently in rdx
mov [ rsp + 0xb08 ], rsi; spilling x1043 to mem
mov byte [ rsp + 0xb10 ], cl; spilling byte x986 to mem
mulx rcx, rsi, r11; x1032_1, x1032_0<- x1029 * 0x1a0111ea397fe69a (_0*_0)
mov rsi, 0x6730d2a0f6b0f624 ; moving imm to reg
mov rdx, rsi; 0x6730d2a0f6b0f624 to rdx
mov [ rsp + 0xb18 ], rcx; spilling x1032_1 to mem
mulx rcx, rsi, r11; x1044_1, x1044_0<- x1029 * 0x6730d2a0f6b0f624 (_0*_0)
mov rsi, 0x4b1ba7b6434bacd7 ; moving imm to reg
mov rdx, rsi; 0x4b1ba7b6434bacd7 to rdx
mov [ rsp + 0xb20 ], r12; spilling x896 to mem
mulx r12, rsi, r11; x1036_1, x1036_0<- x1029 * 0x4b1ba7b6434bacd7 (_0*_0)
add rbx, [ rsp + 0x978 ]
cmp [ rsp + 0xaa8 ], rdi
mov rdi, 0x48669f39fb24c32 ; moving imm to reg
setc sil;
mov rdx, rbp;
imul rdx, rdi; lox1030 = x985*0x48669f39fb24c32
mov rdi, 0xb9feffffffffaaab ; moving imm to reg
xchg rdx, rdi; 0xb9feffffffffaaab, swapping with x1030, which is currently in rdx
mov [ rsp + 0xb28 ], rdi; spilling x1030 to mem
mov [ rsp + 0xb30 ], r12; spilling x1036_1 to mem
mulx r12, rdi, r11; x1051_1, x1051_0<- x1029 * 0xb9feffffffffaaab (_0*_0)
cmp rbx, [ rsp + 0x978 ]
setc dil;
cmp [ rsp + 0xa98 ], r15
movzx r15, dil;
movzx r10, r10b
lea r15, [ r15 + r10 ]
mov r10, 0x299338752f97f97b ; moving imm to reg
setc dil;
mov rdx, rbp;
imul rdx, r10; lox1035 = x985*0x299338752f97f97b
cmp rbp, 0x0
setne r10b; setCC x1074 to reg (r10)
mov [ rsp + 0xb38 ], rdx; spilling x1035 to mem
mov rdx, [ rsp + 0xa78 ]; load m64 x872 to register64
cmp rdx, [ rsp + 0x9b8 ]
mov byte [ rsp + 0xb40 ], r10b; spilling byte x1074 to mem
movzx r10, sil;
movzx rdi, dil
lea r10, [ r10 + rdi ]
mov rsi, r14;
mov rdi, [ rsp + 0xb20 ]; load m64 x896 to register64
lea rsi, [ rsi + rdi ]; r8/64 + m8
mov rdi, 0x2a880aa4ed33c7c3 ; moving imm to reg
mov [ rsp + 0xb48 ], r12; spilling x1051_1 to mem
setc r12b;
imul rbp, rdi; lox1039 = x985*0x2a880aa4ed33c7c3
movzx rdi, r12b;
add rdi, [ rsp + 0x9f8 ]
cmp rsi, r14
lea rsi, [ rsi + rdx ]
setc r14b;
cmp r9, [ rsp + 0xaa8 ]
setc r9b;
cmp rsi, rdx
mov rdx, 0x64774b84f38512bf ; moving imm to reg
mov byte [ rsp + 0xb50 ], r14b; spilling byte x898 to mem
mulx r14, r12, r11; x1040_1, x1040_0<- x1029 * 0x64774b84f38512bf (_0*_0)
mov r12, rbp;
lea r12, [ r12 + rcx ]
lea r10, [ r10 + rbx ]
mov rcx, r10;
mov rdx, [ rsp + 0x428 ]; load m64 x601 to register64
lea rcx, [ rcx + rdx ]; r8/64 + m8
mov [ rsp + 0xb58 ], r12; spilling x1061 to mem
movzx r12, r9b;
mov [ rsp + 0xb60 ], r15; spilling x552 to mem
movzx r15, byte [ rsp + 0xae0 ]; load byte memx722 to register64
lea r12, [ r12 + r15 ]; r64+m8
setc r15b;
cmp r10, rbx
mov rbx, [ rsp + 0xb30 ];
lea r12, [ r12 + rcx ]
mov r9, r12;
mov r10, [ rsp + 0x9c0 ]; load m64 x694 to register64
lea r9, [ r9 + r10 ]; r8/64 + m8
mov byte [ rsp + 0xb68 ], r15b; spilling byte x901 to mem
mov r15, 0x1eabfffeb153ffff ; moving imm to reg
xchg rdx, r15; 0x1eabfffeb153ffff, swapping with x601, which is currently in rdx
mov [ rsp + 0xb70 ], r9; spilling x728 to mem
mov [ rsp + 0xb78 ], rbx; spilling x1037 to mem
mulx rbx, r9, r11; x1048_1, x1048_0<- x1029 * 0x1eabfffeb153ffff (_0*_0)
setc r11b;
cmp r12, rcx
mov r12, rsi;
movzx r9, byte [ rsp + 0xb10 ]; load byte memx986 to register64
lea r12, [ r12 + r9 ]; r64+m8
setc r9b;
cmp rcx, r15
setc r15b;
cmp rdi, [ rsp + 0x9e0 ]
mov rcx, [ rsp + 0xb18 ];
mov rdx, [ rsp + 0xa70 ];
adc rdx, 0x0; add CF to r0's alloc
cmp r12, rsi
setc sil;
cmp rdx, [ rsp + 0x930 ]
mov [ rsp + 0xb80 ], rcx; spilling x1034 to mem
setc cl;
cmp [ rsp + 0xb70 ], r10
mov r10, r13;
mov byte [ rsp + 0xb88 ], r9b; spilling byte x726 to mem
mov r9, [ rsp + 0xb60 ]; load m64 x552 to register64
lea r10, [ r10 + r9 ]; r8/64 + m8
setc r9b;
cmp r10, r13
mov r13, [ rsp + 0x950 ];
mov [ rsp + 0xb90 ], r14; spilling x1042 to mem
mov r14, [ rsp + 0xab0 ]; load m64 x852 to register64
lea r13, [ r13 + r14 ]; r8/64 + m8
mov r14, [ rsp + 0x698 ];
mov byte [ rsp + 0xb98 ], r9b; spilling byte x729 to mem
movzx r9, byte [ rsp + 0xaf8 ]; load byte memx469 to register64
lea r14, [ r14 + r9 ]; r64+m8
movzx r9, cl;
lea r9, [ r9 + r13 ]
mov rcx, [ rsp + 0xb48 ];
movzx r13, byte [ rsp + 0xaf0 ];
mov [ rsp + 0xba0 ], r9; spilling x884 to mem
movzx r9, byte [ rsp + 0xad8 ]; load byte memx810 to register64
lea r13, [ r13 + r9 ]; r64+m8
adc r14, 0x0; add CF to r0's alloc
movzx r9, r15b;
movzx r11, r11b
add r9, r11
add r10, [ rsp + 0x9b0 ]
lea r9, [ r9 + r10 ]
mov r11, r9;
add r11, [ rsp + 0x550 ]
cmp r10, [ rsp + 0x9b0 ]
adc r14, 0x0; add CF to r0's alloc
add r12, [ rsp + 0x998 ]
cmp r9, r10
mov r15, rcx;
mov r10, [ rsp + 0xb00 ]; load m64 x1047 to register64
lea r15, [ r15 + r10 ]; r8/64 + m8
mov r10, r12;
movzx r9, byte [ rsp + 0xb40 ]; load byte memx1074 to register64
lea r10, [ r10 + r9 ]; r64+m8
setc r9b;
cmp r12, [ rsp + 0x998 ]
mov [ rsp + 0xba8 ], r11; spilling x647 to mem
mov r11, r10;
lea r11, [ r11 + r15 ]
mov [ rsp + 0xbb0 ], r11; spilling x1079 to mem
mov r11, [ rsp + 0xb70 ]; load m64 x728 to register64
lea r13, [ r13 + r11 ]; r8/64 + m8
mov byte [ rsp + 0xbb8 ], sil; spilling byte x989 to mem
setc sil;
cmp r13, r11
mov r11, [ rsp + 0x2c0 ]; load m64 x780 to register64
lea r13, [ r13 + r11 ]; r8/64 + m8
mov byte [ rsp + 0xbc0 ], sil; spilling byte x992 to mem
movzx rsi, byte [ rsp + 0xb68 ];
mov byte [ rsp + 0xbc8 ], r9b; spilling byte x645 to mem
movzx r9, byte [ rsp + 0xb50 ]; load byte memx898 to register64
lea rsi, [ rsi + r9 ]; r64+m8
setc r9b;
cmp r13, r11
setc r11b;
cmp r15, rcx
mov rcx, [ rsp + 0xb08 ]; load m64 x1043 to register64
lea rbx, [ rbx + rcx ]; r8/64 + m8
mov byte [ rsp + 0xbd0 ], r9b; spilling byte x817 to mem
movzx r9, byte [ rsp + 0xbc8 ]; load byte memx645 to register64
lea r14, [ r14 + r9 ]; r64+m8
adc rbx, 0x0; add CF to r0's alloc
lea rsi, [ rsi + r13 ]
cmp rbx, rcx
mov rcx, rsi;
lea rcx, [ rcx + rdi ]
movzx r9, byte [ rsp + 0xbc0 ];
mov [ rsp + 0xbd8 ], r14; spilling x653 to mem
movzx r14, byte [ rsp + 0xbb8 ]; load byte memx989 to register64
lea r9, [ r9 + r14 ]; r64+m8
setc r14b;
cmp rcx, rdi
setc dil;
cmp rsi, r13
lea r9, [ r9 + rcx ]
movzx r13, byte [ rsp + 0xb98 ];
movzx rsi, byte [ rsp + 0xb88 ]; load byte memx726 to register64
lea r13, [ r13 + rsi ]; r64+m8
mov rsi, [ rsp + 0xba8 ]; load m64 x647 to register64
lea r13, [ r13 + rsi ]; r8/64 + m8
mov byte [ rsp + 0xbe0 ], dil; spilling byte x908 to mem
movzx rdi, r14b;
mov byte [ rsp + 0xbe8 ], r11b; spilling byte x820 to mem
mov r11, [ rsp + 0xb58 ]; load m64 x1061 to register64
lea rdi, [ rdi + r11 ]; r8/64 + m8
mov r11, -0x4601000000005555 ; moving imm to reg
setc r14b;
cmp [ rsp + 0xbb0 ], r11
setc r11b;
cmp [ rsp + 0xbb0 ], r15
mov r15, 0xfffffffffffffffe ; moving imm to reg
mov byte [ rsp + 0xbf0 ], r14b; spilling byte x905 to mem
setc r14b;
mov [ rsp + 0xbf8 ], rdi; spilling x1062 to mem
movzx rdi, r11b;
xor rdi, r15; x1123 <- x1119|0xfffffffffffffffe
movzx r11, r11b
mov r15, r11;
sub r15, 0x1
mov [ rsp + 0xc00 ], rdi; spilling x1123 to mem
mov rdi, r9;
add rdi, [ rsp + 0x268 ]
and r11, r15; x1122 <- x1119&x1121
cmp r10, r12
movzx r12, r14b;
adc r12, 0x0; add CF to r0's alloc
lea r12, [ r12 + rdi ]
cmp r12, rdi
setc r10b;
cmp rdi, [ rsp + 0x268 ]
setc r14b;
cmp r13, rsi
setc r15b;
xor r11, [ rsp + 0xc00 ]; x1125 <- x1122|x1124
movzx rdi, byte [ rsp + 0xbe8 ];
rcr byte [ rsp + 0xbd0 ], 1
adc rdi, 0x0
lea r12, [ r12 + rbx ]
mov byte [ rsp + 0xc08 ], r10b; spilling byte x1084 to mem
mov r10, -0x1eabfffeb153ffff ; moving imm to reg
mov byte [ rsp + 0xc10 ], r15b; spilling byte x733 to mem
mov r15, r12;
lea r15, [ r15 + r10 ]
add r13, [ rsp + 0xa10 ]
lea rdi, [ rdi + r13 ]
mov r10, [ rsp + 0xb28 ];
add r10, [ rsp + 0xb78 ]
mov byte [ rsp + 0xc18 ], r14b; spilling byte x999 to mem
mov r14, [ rsp + 0xb38 ];
add r14, [ rsp + 0xb90 ]
mov [ rsp + 0xc20 ], r10; spilling x1069 to mem
mov r10, r15;
lea r10, [ r10 + r11 ]
cmp r9, rcx
setc cl;
cmp rdi, r13
setc r9b;
cmp [ rsp + 0xbf8 ], rbp
adc r14, 0x0; add CF to r0's alloc
cmp r14, [ rsp + 0xb38 ]
mov rbp, 0x1eabfffeb153ffff ; moving imm to reg
setc r11b;
cmp r12, rbp
setc bpl;
cmp r12, rbx
mov rbx, 0xfffffffffffffffe ; moving imm to reg
mov byte [ rsp + 0xc28 ], cl; spilling byte x996 to mem
setc cl;
mov [ rsp + 0xc30 ], r10; spilling x1134 to mem
movzx r10, bpl;
xor r10, rbx; x1131 <- x1127|0xfffffffffffffffe
movzx rbx, r11b;
add rbx, [ rsp + 0xc20 ]
cmp rsi, [ rsp + 0x550 ]
setc sil;
movzx rbp, bpl
mov r11, rbp;
sub r11, 0x1
cmp rbx, [ rsp + 0xb28 ]
mov byte [ rsp + 0xc38 ], cl; spilling byte x1087 to mem
setc cl;
and rbp, r11; x1130 <- x1127&x1129
xor rbp, r10; x1133 <- x1130|x1132
add rdi, [ rsp + 0x4b8 ]
cmp rdi, [ rsp + 0x4b8 ]
movzx r11, r9b;
adc r11, 0x0; add CF to r0's alloc
movzx r9, byte [ rsp + 0xbe0 ];
rcr byte [ rsp + 0xbf0 ], 1
adc r9, 0x0
cmp r15, [ rsp + 0xc30 ]
setc r15b;
mov r10, 0xfffffffffffffffe ; moving imm to reg
mov [ rsp + 0xc40 ], r8; spilling arg4 to mem
movzx r8, r15b;
xor r8, r10; x1139 <- x1135|0xfffffffffffffffe
lea r9, [ r9 + rdi ]
movzx r15, r15b
mov r10, r15;
sub r10, 0x1
mov [ rsp + 0xc48 ], rax; spilling arg2 to mem
mov rax, r9;
lea rax, [ rax + rdx ]
mov [ rsp + 0xc50 ], rbp; spilling x1133 to mem
movzx rbp, byte [ rsp + 0xc18 ];
rcr byte [ rsp + 0xc28 ], 1
adc rbp, 0x0
mov [ rsp + 0xc58 ], r10; spilling x1137 to mem
movzx r10, sil;
add r10, [ rsp + 0xbd8 ]
cmp r13, [ rsp + 0xa10 ]
movzx r13, byte [ rsp + 0xc10 ];
adc r13, 0x0; add CF to r0's alloc
cmp r9, rdi
lea rbp, [ rbp + rax ]
lea r13, [ r13 + r10 ]
movzx rsi, cl;
mov rdi, [ rsp + 0xb80 ]; load m64 x1034 to register64
lea rsi, [ rsi + rdi ]; r8/64 + m8
setc dil;
cmp rbp, rax
movzx rcx, byte [ rsp + 0xa58 ];
mov r9, [ rsp + 0x848 ]; load m64 x662 to register64
lea rcx, [ rcx + r9 ]; r8/64 + m8
mov r9, r13;
lea r9, [ r9 + rcx ]
mov [ rsp + 0xc60 ], rsi; spilling x1073 to mem
setc sil;
cmp r13, r10
lea r11, [ r11 + r9 ]
setc r13b;
cmp r11, r9
mov [ rsp + 0xc68 ], r8; spilling x1139 to mem
mov r8, [ rsp + 0x718 ]; load m64 x794 to register64
lea r11, [ r11 + r8 ]; r8/64 + m8
mov byte [ rsp + 0xc70 ], r13b; spilling byte x740 to mem
setc r13b;
cmp rax, rdx
movzx rdx, dil;
adc rdx, 0x0; add CF to r0's alloc
lea rdx, [ rdx + r11 ]
add rbp, [ rsp + 0x2d8 ]
mov rax, rdx;
add rax, [ rsp + 0xba0 ]
cmp rdx, r11
mov rdi, [ rsp + 0x608 ];
movzx rdx, byte [ rsp + 0x5d8 ]; load byte memx981 to register64
lea rdi, [ rdi + rdx ]; r64+m8
setc dl;
cmp rbp, [ rsp + 0x2d8 ]
mov [ rsp + 0xc78 ], rdi; spilling x984 to mem
setc dil;
cmp rax, [ rsp + 0xba0 ]
mov byte [ rsp + 0xc80 ], r13b; spilling byte x831 to mem
movzx r13, dl;
adc r13, 0x0; add CF to r0's alloc
movzx rdx, byte [ rsp + 0xc38 ];
rcr byte [ rsp + 0xc08 ], 1
adc rdx, 0x0
lea rdx, [ rdx + rbp ]
cmp r10, [ rsp + 0x698 ]
mov r10, [ rsp + 0x730 ];
adc r10, 0x0; add CF to r0's alloc
mov [ rsp + 0xc88 ], r13; spilling x924 to mem
movzx r13, dil;
movzx rsi, sil
add r13, rsi
cmp rdx, rbp
lea r13, [ r13 + rax ]
movzx rsi, byte [ rsp + 0xc70 ]; load byte memx740 to register64
lea r10, [ r10 + rsi ]; r64+m8
mov rsi, [ rsp + 0xbf8 ]; load m64 x1062 to register64
lea rdx, [ rdx + rsi ]; r8/64 + m8
mov rbp, 0x6730d2a0f6b0f624 ; moving imm to reg
setc dil;
cmp rdx, rbp
setc bpl;
cmp r13, rax
mov rax, 0xfffffffffffffffe ; moving imm to reg
mov byte [ rsp + 0xc90 ], dil; spilling byte x1091 to mem
setc dil;
mov [ rsp + 0xc98 ], r10; spilling x837 to mem
movzx r10, bpl;
xor r10, rax; x1148 <- x1144|0xfffffffffffffffe
movzx rbp, bpl
mov rax, rbp;
sub rax, 0x1
mov byte [ rsp + 0xca0 ], dil; spilling byte x1010 to mem
mov rdi, [ rsp + 0x950 ]; load m64 x844 to register64
cmp [ rsp + 0xba0 ], rdi
mov rdi, [ rsp + 0xa50 ];
adc rdi, 0x0; add CF to r0's alloc
and r15, [ rsp + 0xc58 ]; x1138 <- x1135&x1137
cmp r9, rcx
mov rcx, [ rsp + 0xc98 ];
adc rcx, 0x0; add CF to r0's alloc
and rbp, rax; x1147 <- x1144&x1146
xor r15, [ rsp + 0xc68 ]; x1141 <- x1138|x1140
add r15, [ rsp + 0xc50 ]
mov r9, -0x6730d2a0f6b0f624 ; moving imm to reg
mov rax, rdx;
lea rax, [ rax + r9 ]
lea r15, [ r15 + rax ]
cmp rax, r15
mov rax, [ rsp + 0x468 ]; load m64 x973 to register64
lea r13, [ r13 + rax ]; r8/64 + m8
setc r9b;
cmp r11, r8
mov r8, 0xfffffffffffffffe ; moving imm to reg
setc r11b;
mov [ rsp + 0xca8 ], r10; spilling x1149 to mem
movzx r10, r9b;
xor r10, r8; x1156 <- x1152|0xfffffffffffffffe
cmp rdx, rsi
movzx rsi, byte [ rsp + 0xc80 ]; load byte memx831 to register64
lea rcx, [ rcx + rsi ]; r64+m8
movzx rsi, r11b;
lea rsi, [ rsi + rcx ]
movzx r11, byte [ rsp + 0xc90 ];
adc r11, 0x0; add CF to r0's alloc
lea r11, [ r11 + r13 ]
cmp r13, rax
movzx rax, byte [ rsp + 0xca0 ];
adc rax, 0x0; add CF to r0's alloc
cmp rsi, [ rsp + 0x730 ]
setc cl;
cmp r11, r13
lea r11, [ r11 + r14 ]
movzx r13, cl;
mov r8, [ rsp + 0xc78 ]; load m64 x984 to register64
lea r13, [ r13 + r8 ]; r8/64 + m8
mov rcx, 0x64774b84f38512bf ; moving imm to reg
mov [ rsp + 0xcb0 ], rbp; spilling x1147 to mem
setc bpl;
cmp r11, rcx
setc cl;
cmp r11, r14
mov r14, rsi;
mov byte [ rsp + 0xcb8 ], bpl; spilling byte x1098 to mem
mov rbp, [ rsp + 0xc88 ]; load m64 x924 to register64
lea r14, [ r14 + rbp ]; r8/64 + m8
mov rbp, r14;
lea rbp, [ rbp + rdi ]
mov [ rsp + 0xcc0 ], r10; spilling x1156 to mem
setc r10b;
movzx r9, r9b
mov [ rsp + 0xcc8 ], r13; spilling x1022 to mem
mov r13, r9;
sub r13, 0x1
and r9, r13; x1155 <- x1152&x1154
mov r13, 0xfffffffffffffffe ; moving imm to reg
mov byte [ rsp + 0xcd0 ], r10b; spilling byte x1101 to mem
movzx r10, cl;
xor r10, r13; x1165 <- x1161|0xfffffffffffffffe
lea rax, [ rax + rbp ]
cmp r14, rsi
mov rsi, rax;
mov r14, [ rsp + 0x598 ]; load m64 x980 to register64
lea rsi, [ rsi + r14 ]; r8/64 + m8
mov r13, [ rsp + 0xcc8 ];
adc r13, 0x0; add CF to r0's alloc
cmp rsi, r14
setc r14b;
cmp rax, rbp
setc al;
movzx rcx, cl
mov [ rsp + 0xcd8 ], r10; spilling x1166 to mem
mov r10, rcx;
sub r10, 0x1
and rcx, r10; x1164 <- x1161&x1163
xor r9, [ rsp + 0xcc0 ]; x1158 <- x1155|x1157
movzx r10, byte [ rsp + 0xcd0 ];
rcr byte [ rsp + 0xcb8 ], 1
adc r10, 0x0
mov [ rsp + 0xce0 ], rcx; spilling x1164 to mem
mov rcx, [ rsp + 0xcb0 ];
xor rcx, [ rsp + 0xca8 ]; x1150 <- x1147|x1149
lea r10, [ r10 + rsi ]
lea r9, [ r9 + rcx ]
cmp r10, rsi
lea r10, [ r10 + rbx ]
mov rsi, 0x4b1ba7b6434bacd7 ; moving imm to reg
setc cl;
cmp r10, rsi
setc sil;
cmp rbp, rdi
setc dil;
cmp r10, rbx
movzx rbx, dil;
lea rbx, [ rbx + r13 ]
movzx rbp, al;
lea rbp, [ rbp + rbx ]
setc r13b;
movzx rsi, sil
mov rax, rsi;
sub rax, 0x1
movzx rdi, r14b;
lea rdi, [ rdi + rbp ]
mov r14, -0x64774b84f38512bf ; moving imm to reg
mov rbx, r11;
lea rbx, [ rbx + r14 ]
lea r9, [ r9 + rbx ]
mov rbp, -0x4b1ba7b6434bacd7 ; moving imm to reg
mov r14, r10;
lea r14, [ r14 + rbp ]
cmp rbx, r9
setc bl;
mov rbp, rsi;
and rbp, rax; x1181 <- x1178&x1180
movzx rax, r13b;
movzx rcx, cl
add rax, rcx
lea rax, [ rax + rdi ]
mov rcx, rax;
add rcx, [ rsp + 0xc60 ]
cmp rax, rdi
mov r13, 0x1a0111ea397fe69a ; moving imm to reg
setc al;
cmp rcx, r13
setc r13b;
movzx r13, r13b
mov [ rsp + 0xce8 ], rbp; spilling x1181 to mem
mov rbp, r13;
sub rbp, 0x1
cmp rdi, r8
movzx r8, al;
adc r8, 0x0; add CF to r0's alloc
mov rdi, r13;
and rdi, rbp; x1198 <- x1195&x1197
mov rax, 0xfffffffffffffffe ; moving imm to reg
movzx rbp, bl;
xor rbp, rax; x1173 <- x1169|0xfffffffffffffffe
movzx rbx, bl
mov rax, rbx;
sub rax, 0x1
mov [ rsp + 0xcf0 ], rdi; spilling x1198 to mem
mov rdi, -0x1a0111ea397fe69a ; moving imm to reg
mov [ rsp + 0xcf8 ], r8; spilling x1117 to mem
mov r8, rcx;
lea r8, [ r8 + rdi ]
mov rdi, [ rsp + 0xce0 ];
xor rdi, [ rsp + 0xcd8 ]; x1167 <- x1164|x1166
and rbx, rax; x1172 <- x1169&x1171
xor rbx, rbp; x1175 <- x1172|x1174
lea rbx, [ rbx + rdi ]
mov rbp, 0xfffffffffffffffe ; moving imm to reg
xor r13, rbp; x1199 <- x1195|0xfffffffffffffffe
lea rbx, [ rbx + r14 ]
cmp r14, rbx
mov r14, 0x4601000000005555 ; moving imm to reg
mov rax, [ rsp + 0xbb0 ]; load m64 x1079 to register64
lea r14, [ r14 + rax ]; r8/64 + m8
setc dil;
xor rsi, rbp; x1182 <- x1178|0xfffffffffffffffe
movzx rdi, dil
mov rbp, rdi;
sub rbp, 0x1
mov [ rsp + 0xd00 ], r14; spilling x1232 to mem
mov r14, rdi;
and r14, rbp; x1189 <- x1186&x1188
mov rbp, [ rsp + 0xce8 ];
xor rbp, rsi; x1184 <- x1181|x1183
mov rsi, 0xfffffffffffffffe ; moving imm to reg
xor rdi, rsi; x1190 <- x1186|0xfffffffffffffffe
xor r14, rdi; x1192 <- x1189|x1191
lea r14, [ r14 + rbp ]
lea r14, [ r14 + r8 ]
cmp r8, r14
setc r8b;
movzx r8, r8b
mov rbp, r8;
sub rbp, 0x1
mov rdi, r8;
and rdi, rbp; x1206 <- x1203&x1205
xor r8, rsi; x1207 <- x1203|0xfffffffffffffffe
cmp rcx, [ rsp + 0xc60 ]
mov rbp, [ rsp + 0xcf8 ];
adc rbp, 0x0; add CF to r0's alloc
mov rsi, [ rsp + 0xcf0 ];
xor rsi, r13; x1201 <- x1198|x1200
xor rdi, r8; x1209 <- x1206|x1208
lea rdi, [ rdi + rsi ]
lea rdi, [ rdi + rbp ]
cmp rbp, rdi
mov r13, 0x0 ; moving imm to reg
cmovc r14, r13; if CF, x1246<- 0x0 (nzVar)
mov rbp, [ rsp + 0xc30 ];
cmovc rbp, r13; if CF, x1220<- 0x0 (nzVar)
setc r8b;
mov rsi, 0xfffffffffffffffe ; moving imm to reg
movzx rdi, r8b;
xor rdi, rsi; x1216 <- x1212|0xfffffffffffffffe
movzx r8, r8b
mov r13, r8;
sub r13, 0x1
mov rsi, [ rsp + 0xd00 ]; load m64 x1232 to register64
mov [ rsp + 0xd08 ], rbp; spilling x1220 to mem
mov rbp, 0x0 ; moving imm to reg
test r8, r8; testing x1212
cmovnz rsi, rbp; if !ZF, x1234<- 0x0 (nzVar)
mov rbp, r8;
and rbp, r13; x1215 <- x1212&x1214
xor rbp, rdi; x1218 <- x1215|x1217
and rcx, rbp; x1245 <- x1114&x1218
and r12, rbp; x1219 <- x1086&x1218
and r11, rbp; x1225 <- x1100&x1218
and r10, rbp; x1228 <- x1107&x1218
and rdx, rbp; x1222 <- x1093&x1218
or rcx, r14; x1247 <- x1245|x1246
mov r14, 0x0 ; moving imm to reg
test r8, r8; testing x1212
cmovnz r15, r14; if !ZF, x1223<- 0x0 (nzVar)
mov rdi, [ rsp - 0x38 ]; load m64 out1 to register64
mov [ rdi + 0x28 ], rcx; out1[5] = x1247
or rdx, r15; x1224 <- x1222|x1223
test r8, r8; testing x1212
cmovnz r9, r14; if !ZF, x1226<- 0x0 (nzVar)
or r11, r9; x1227 <- x1225|x1226
and rax, rbp; x1233 <- x1079&x1218
or rax, rsi; x1235 <- x1233|x1234
mov [ rdi + 0x0 ], rax; out1[0] = x1235
or r12, [ rsp + 0xd08 ]; x1221 <- x1219|x1220
test r8, r8; testing x1212
cmovnz rbx, r14; if !ZF, x1229<- 0x0 (nzVar)
mov [ rdi + 0x18 ], r11; out1[3] = x1227
mov [ rdi + 0x8 ], r12; out1[1] = x1221
or r10, rbx; x1230 <- x1228|x1229
mov [ rdi + 0x10 ], rdx; out1[2] = x1224
mov [ rdi + 0x20 ], r10; out1[4] = x1230
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 3472
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 0.6748
; seed 0371586444961986 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 2066115 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=42, initial num_batches=31): 18371 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.008891567023132789
; number reverted permutation / tried permutation: 2783 / 3999 =69.592%
; number reverted decision / tried decision: 2559 / 4000 =63.975%
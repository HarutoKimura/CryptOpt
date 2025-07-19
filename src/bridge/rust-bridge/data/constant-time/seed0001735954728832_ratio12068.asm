SECTION .text
	GLOBAL rust_fiat_curve25519_carry_mul
rust_fiat_curve25519_carry_mul:
sub rsp, 144
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x10 ]; saving arg1[2] in rdx.
mulx r11, r10, [ rax + 0x0 ]; x50_1, x50_0<- arg2[0] * arg1[2] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov rcx, [ rax + 0x18 ]; load m64 x13 to register64
imul rcx, rdx; lox13 = arg2[3]*0x13
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r9, r8, [ rsi + 0x8 ]; x53_1, x53_0<- arg1[1] * arg2[2] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mov rbx, [ rax + 0x8 ]; load m64 x23 to register64
imul rbx, rdx; lox23 = arg2[1]*0x13
mov rdx, rbx; x23 to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mulx rbp, rbx, [ rsi + 0x20 ]; x25_1, x25_0<- x23 * arg1[4] (_0*_0)
mov rdx, 0x13 ; moving imm to reg
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mov r12, [ rax + 0x10 ]; load m64 x18 to register64
imul r12, rdx; lox18 = arg2[2]*0x13
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov r13, [ rax + 0x20 ]; load m64 x8 to register64
imul r13, rdx; lox8 = arg2[4]*0x13
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mulx r15, r14, r12; x31_1, x31_0<- arg1[3] * x18 (_0*_0)
mov rdx, r12; x18 to rdx
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r12, [ rsi + 0x20 ]; x20_1, x20_0<- x18 * arg1[4] (_0*_0)
mov rdx, r13; x8 to rdx
mov [ rsp - 0x48 ], r11; spilling x50_1 to mem
mulx r11, r13, [ rsi + 0x18 ]; x29_1, x29_0<- arg1[3] * x8 (_0*_0)
mov [ rsp - 0x40 ], r10; spilling x50_0 to mem
mov [ rsp - 0x38 ], rdi; spilling x20_1 to mem
mulx rdi, r10, [ rsi + 0x20 ]; x10_1, x10_0<- x8 * arg1[4] (_0*_0)
mov [ rsp - 0x30 ], r12; spilling x20_0 to mem
mov r12, rdx; preserving value of x8 into a new reg
mov rdx, [ rax + 0x8 ]; saving arg2[1] in rdx.
mov [ rsp - 0x28 ], r11; spilling x29_1 to mem
mov [ rsp - 0x20 ], r13; spilling x29_0 to mem
mulx r13, r11, [ rsi + 0x10 ]; x49_1, x49_0<- arg1[2] * arg2[1] (_0*_0)
test al, al
adox r10, r11
adox r13, rdi
adcx r8, r10
adcx r13, r9
mov rdx, rcx; x13 to rdx
mulx r9, rcx, [ rsi + 0x20 ]; x15_1, x15_0<- x13 * arg1[4] (_0*_0)
mulx r11, rdi, [ rsi + 0x10 ]; x36_1, x36_0<- arg1[2] * x13 (_0*_0)
mov r10, rdx; preserving value of x13 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x18 ], r13; spilling x91_1 to mem
mov [ rsp - 0x10 ], r8; spilling x91_0 to mem
mulx r8, r13, [ rsi + 0x18 ]; x46_1, x46_0<- arg2[0] * arg1[3] (_0*_0)
xor rdx, rdx
adox rbx, r14
adox r15, rbp
mov rdx, r10; x13 to rdx
mulx rbp, r10, [ rsi + 0x18 ]; x30_1, x30_0<- arg1[3] * x13 (_0*_0)
adcx rdi, rbx
adcx r15, r11
xor rdx, rdx
adox rcx, [ rsp - 0x20 ]
adox r9, [ rsp - 0x28 ]
adcx r13, [ rsp - 0x10 ]
adcx r8, [ rsp - 0x18 ]
mov r14, r10;
xor r11, r11
adox r14, [ rsp - 0x30 ]
adox rbp, [ rsp - 0x38 ]
mov rdx, r12; x8 to rdx
mulx rbx, r12, [ rsi + 0x8 ]; x40_1, x40_0<- arg1[1] * x8 (_0*_0)
mov r10, rdx; preserving value of x8 into a new reg
mov rdx, [ rax + 0x0 ]; saving arg2[0] in rdx.
mov [ rsp - 0x8 ], r8; spilling x92_1 to mem
mulx r8, r11, [ rsi + 0x0 ]; x63_1, x63_0<- arg1[0] * arg2[0] (_0*_0)
mov rdx, r10; x8 to rdx
mov [ rsp + 0x0 ], r13; spilling x92_0 to mem
mulx r13, r10, [ rsi + 0x10 ]; x35_1, x35_0<- arg1[2] * x8 (_0*_0)
adcx r10, r14
adcx rbp, r13
xor rdx, rdx
adox r12, rdi
adox r15, rbx
adcx r11, r12
adcx r15, r8
mov rdi, r11;
shrd rdi, r15, 0x33; lo
shr r15, 0x33; x68_1>>=0x33
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx rbx, r14, [ rax + 0x0 ]; x55_1, x55_0<- arg2[0] * arg1[1] (_0*_0)
xor rdx, rdx
adox r14, r10
adox rbp, rbx
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mulx r13, r8, [ rsi + 0x0 ]; x62_1, x62_0<- arg1[0] * arg2[1] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r12, r10, [ rax + 0x10 ]; x48_1, x48_0<- arg1[2] * arg2[2] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mulx rbx, r15, [ rax + 0x8 ]; x45_1, x45_0<- arg1[3] * arg2[1] (_0*_0)
adcx r8, r14
adcx rbp, r13
xor rdx, rdx
adox rdi, r8
adox rbp, rdx
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r13, r14, [ rax + 0x8 ]; x54_1, x54_0<- arg1[1] * arg2[1] (_0*_0)
adcx r15, r10
adcx r12, rbx
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx rbx, r10, [ rsi + 0x8 ]; x52_1, x52_0<- arg1[1] * arg2[3] (_0*_0)
xor rdx, rdx
adox r14, rcx
adox r9, r13
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx r8, rcx, [ rax + 0x10 ]; x61_1, x61_0<- arg1[0] * arg2[2] (_0*_0)
mov rdx, r14;
adcx rdx, [ rsp - 0x40 ]
adcx r9, [ rsp - 0x48 ]
test al, al
adox rcx, rdx
adox r9, r8
mov r13, rdi;
shrd r13, rbp, 0x33; lo
shr rbp, 0x33; x78_1>>=0x33
xor r14, r14
adox r13, rcx
adox r9, r14
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mulx rcx, r8, [ rax + 0x18 ]; x60_1, x60_0<- arg1[0] * arg2[3] (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r14, rbp, [ rsi + 0x20 ]; x43_1, x43_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, r13;
adcx r8, [ rsp + 0x0 ]
adcx rcx, [ rsp - 0x8 ]
mov [ rsp + 0x8 ], r11; spilling x69 to mem
mov r11, 0x7ffffffffffff ; moving imm to reg
and rdi, r11; x80 <- x79&0x7ffffffffffff
shrd r13, r9, 0x33; lo
shr r9, 0x33; x86_1>>=0x33
xor r9, r9
adox r10, r15
adox r12, rbx
and rdx, r11; x88 <- x87&0x7ffffffffffff
adox rbp, r10
adox r12, r14
adcx r13, r8
adc rcx, 0x0; add CF to r0's alloc
mov r15, r13;
and r15, r11; x97 <- x96&0x7ffffffffffff
mov rbx, rdx; preserving value of x88 into a new reg
mov rdx, [ rsi + 0x0 ]; saving arg1[0] in rdx.
mulx r8, r14, [ rax + 0x20 ]; x59_1, x59_0<- arg1[0] * arg2[4] (_0*_0)
mov rdx, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ rdx + 0x18 ], r15; out1[3] = x97
shrd r13, rcx, 0x33; lo
shr rcx, 0x33; x95_1>>=0x33
xor r10, r10
adox r14, rbp
adox r12, r8
adcx r13, r14
adc r12, 0x0; add CF to r0's alloc
mov r9, r13;
shrd r9, r12, 0x33; lo
shr r12, 0x33; x104_1>>=0x33
mov rbp, 0x13 ; moving imm to reg
imul r9, rbp; lox108 = x105*0x13
mov r15, [ rsp + 0x8 ];
and r15, r11; x70 <- x69&0x7ffffffffffff
lea r9, [ r9 + r15 ]
mov r8, r9;
shr r8, 0x33; x110 <- x109>> 0x33
and r9, r11; x111 <- x109&0x7ffffffffffff
mov [ rdx + 0x0 ], r9; out1[0] = x111
lea r8, [ r8 + rdi ]
mov rdi, r8;
shr rdi, 0x33; x113 <- x112>> 0x33
and r8, r11; x114 <- x112&0x7ffffffffffff
lea rdi, [ rdi + rbx ]
and r13, r11; x107 <- x106&0x7ffffffffffff
mov [ rdx + 0x10 ], rdi; out1[2] = x115
mov [ rdx + 0x20 ], r13; out1[4] = x107
mov [ rdx + 0x8 ], r8; out1[1] = x114
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 144
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.2068
; seed 0029212344268556 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 48847 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=286, initial num_batches=31): 4808 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.09842979097999877
; number reverted permutation / tried permutation: 3053 / 3992 =76.478%
; number reverted decision / tried decision: 2447 / 4007 =61.068%
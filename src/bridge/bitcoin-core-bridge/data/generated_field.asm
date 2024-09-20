SECTION .text
	GLOBAL secp256k1_fe_mul_inner
secp256k1_fe_mul_inner:
sub rsp, 144
mov rax, rdx; preserving value of arg2 into a new reg
mov rdx, [ rsi + 0x8 ]; saving arg1[1] in rdx.
mulx r11, r10, [ rax + 0x10 ]; x22_1, x22_0<- arg2[2] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x20 ]; arg2[4] to rdx
mulx r8, rcx, [ rsi + 0x20 ]; x39_1, x39_0<- arg2[4] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mov [ rsp - 0x80 ], rbx; spilling calSv-rbx to mem
mulx rbx, r9, [ rsi + 0x18 ]; x64_1, x64_0<- arg2[2] * arg1[3] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mov [ rsp - 0x78 ], rbp; spilling calSv-rbp to mem
mov [ rsp - 0x70 ], r12; spilling calSv-r12 to mem
mulx r12, rbp, [ rsi + 0x0 ]; x17_1, x17_0<- arg2[3] * arg1[0] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x68 ], r13; spilling calSv-r13 to mem
mov [ rsp - 0x60 ], r14; spilling calSv-r14 to mem
mulx r14, r13, [ rax + 0x18 ]; x46_1, x46_0<- arg2[3] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x58 ], r15; spilling calSv-r15 to mem
mov [ rsp - 0x50 ], rdi; spilling out1 to mem
mulx rdi, r15, [ rsi + 0x18 ]; x48_1, x48_0<- arg2[1] * arg1[3] (_0*_0)
add rbp, r10; could be done better, if r0 has been u8 as well
adcx r11, r12
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r12, r10, [ rsi + 0x10 ]; x47_1, x47_0<- arg2[2] * arg1[2] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mov [ rsp - 0x48 ], rdi; spilling x48_1 to mem
mov [ rsp - 0x40 ], r15; spilling x48_0 to mem
mulx r15, rdi, [ rax + 0x0 ]; x82_1, x82_0<- arg2[0] * arg1[1] (_0*_0)
mov rdx, [ rax + 0x8 ]; arg2[1] to rdx
mov [ rsp - 0x38 ], r8; spilling x43 to mem
mov [ rsp - 0x30 ], r11; spilling x23_1 to mem
mulx r11, r8, [ rsi + 0x0 ]; x81_1, x81_0<- arg2[1] * arg1[0] (_0*_0)
test al, al
adox r13, r10
adox r12, r14
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r10, r14, [ rsi + 0x10 ]; x63_1, x63_0<- arg2[3] * arg1[2] (_0*_0)
adcx r8, rdi
adcx r15, r11
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mulx r11, rdi, [ rax + 0x8 ]; x28_1, x28_0<- arg2[1] * arg1[2] (_0*_0)
test al, al
adox r14, r9
adox rbx, r10
adcx rdi, rbp
adcx r11, [ rsp - 0x30 ]
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbp, r9, [ rax + 0x18 ]; x105_1, x105_0<- arg2[3] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x18 ]; arg1[3] to rdx
mov [ rsp - 0x28 ], r15; spilling x83_1 to mem
mulx r15, r10, [ rax + 0x20 ]; x104_1, x104_0<- arg2[4] * arg1[3] (_0*_0)
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rcx, rdx; lo limb and'ed
adox r9, r10
adox r15, rbp
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r10, rbp, [ rsi + 0x18 ]; x33_1, x33_0<- arg2[0] * arg1[3] (_0*_0)
mov rdx, 0x1000003d10 ; moving imm to reg
mov [ rsp - 0x20 ], r8; spilling x83_0 to mem
mov [ rsp - 0x18 ], r15; spilling x106_1 to mem
mulx r15, r8, rcx; x41_1, x41_0<- x40 * 0x1000003d10 (_0*_0)
adcx rbp, rdi
adcx r11, r10
add r8, rbp; could be done better, if r0 has been u8 as well
adcx r11, r15
mov rdi, r8;
shrd rdi, r11, 0x34; lo
shr r11, 0x34; x44_1>>=0x34
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx r10, rcx, [ rax + 0x0 ]; x49_1, x49_0<- arg2[0] * arg1[4] (_0*_0)
mov rdx, 0x1000003d10000 ; moving imm to reg
mulx rbp, r15, [ rsp - 0x38 ]; x50_1, x50_0<- x43 * 0x1000003d10000 (_0*_0)
mov rdx, [ rsi + 0x0 ]; arg1[0] to rdx
mov [ rsp - 0x10 ], r9; spilling x106_0 to mem
mov [ rsp - 0x8 ], rbx; spilling x66_1 to mem
mulx rbx, r9, [ rax + 0x20 ]; x45_1, x45_0<- arg2[4] * arg1[0] (_0*_0)
mov rdx, r13;
add rdx, [ rsp - 0x40 ]; could be done better, if r0 has been u8 as well
adcx r12, [ rsp - 0x48 ]
xor r13, r13
adox rcx, rdx
adox r12, r10
adcx r9, rcx
adcx r12, rbx
xor r10, r10
adox r15, r9
adox r12, rbp
adcx rdi, r15
adcx r12, r11
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r11, r13, [ rax + 0x20 ]; x62_1, x62_0<- arg2[4] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x20 ]; arg1[4] to rdx
mulx rbx, rbp, [ rax + 0x8 ]; x65_1, x65_0<- arg2[1] * arg1[4] (_0*_0)
mov rdx, [ rax + 0x18 ]; arg2[3] to rdx
mulx r9, rcx, [ rsi + 0x18 ]; x85_1, x85_0<- arg2[3] * arg1[3] (_0*_0)
mov rdx, rdi;
shrd rdx, r12, 0x34; x58_0 <- x56_1||x56_0 >> 0x34
mov r15, 0x34; abusing out reg for imm to sarx
sarx r15, r12, r15; hi-limb
mov r10, rdi;
xor r12, r12
adox rbp, r14
adox rbx, [ rsp - 0x8 ]
adcx r13, rbp
adcx rbx, r11
xor r14, r14
adox rdx, r13
adox rbx, r15
mov r12, rdx;
shl r12, 0x4; x72 <- x70 * 0x10
mov r11, rdx; preserving value of x69_0 into a new reg
mov rdx, [ rsi + 0x20 ]; saving arg1[4] in rdx.
mulx rbp, r15, [ rax + 0x10 ]; x86_1, x86_0<- arg2[2] * arg1[4] (_0*_0)
mov rdx, [ rsi + 0x8 ]; arg1[1] to rdx
mulx r14, r13, [ rax + 0x8 ]; x100_1, x100_0<- arg2[1] * arg1[1] (_0*_0)
mov rdx, [ rsi + 0x10 ]; arg1[2] to rdx
mov [ rsp + 0x0 ], r12; spilling x72 to mem
mov [ rsp + 0x8 ], r10; spilling x57 to mem
mulx r10, r12, [ rax + 0x20 ]; x84_1, x84_0<- arg2[4] * arg1[2] (_0*_0)
xor rdx, rdx
adox rcx, r15
adox rbp, r9
mov r9, 0xffffffffffff ; moving imm to reg
and rdi, r9; lo limb and'ed
mov rdx, [ rax + 0x10 ]; arg2[2] to rdx
mulx r9, r15, [ rsi + 0x0 ]; x99_1, x99_0<- arg2[2] * arg1[0] (_0*_0)
adox r12, rcx
adox rbp, r10
shrd r11, rbx, 0x34; x71_0 <- x69_1||x69_0 >> 0x34
mov rdx, 0x34; abusing out reg for imm to sarx
sarx rdx, rbx, rdx; hi-limb
test al, al
adox r11, r12
adox rbp, rdx
mov rbx, r11;
shrd rbx, rbp, 0x34; x94_0 <- x89_1||x89_0 >> 0x34
mov r10, 0x34; abusing out reg for imm to sarx
sarx r10, rbp, r10; hi-limb
mov rcx, 0xfffffffffffff ; moving imm to reg
and r11, rcx; lo limb and'ed
mov r12, 0x1000003d10 ; moving imm to reg
mov rdx, r11; x90_0 to rdx
mulx rbp, r11, r12; x91_1, x91_0<- x90 * 0x1000003d10 (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r12, rcx, [ rsi + 0x10 ]; x102_1, x102_0<- arg2[0] * arg1[2] (_0*_0)
adox rbx, [ rsp - 0x10 ]
adox r10, [ rsp - 0x18 ]
adcx r15, r13
adcx r14, r9
add rcx, r15; could be done better, if r0 has been u8 as well
adcx r14, r12
mov rdx, [ rsp + 0x8 ];
shr rdx, 0x30; x59 <- x57>> 0x30
mov r13, 0xfffffffffffff0 ; moving imm to reg
mov r9, [ rsp + 0x0 ];
and r9, r13; x73 <- x72&0xfffffffffffff0
mov r12, 0x4 ; moving imm to reg
bzhi r15, rdx, r12; x60 <- x59 (only least 0x4 bits)
or r9, r15; x74 <- x73|x60
mov rdx, 0x1000003d1 ; moving imm to reg
mulx r12, r15, r9; x76_1, x76_0<- x74 * 0x1000003d1 (_0*_0)
mov rdx, [ rax + 0x0 ]; arg2[0] to rdx
mulx r13, r9, [ rsi + 0x0 ]; x61_1, x61_0<- arg2[0] * arg1[0] (_0*_0)
adox r9, r15
adox r12, r13
mov rdx, r9;
mov r15, 0xfffffffffffff ; moving imm to reg
and rdx, r15; x79 <- x78&0xfffffffffffff
adox r11, [ rsp - 0x20 ]
adox rbp, [ rsp - 0x28 ]
shrd r9, r12, 0x34; lo
shr r12, 0x34; x80_1>>=0x34
xor r13, r13
adox r9, r11
adox rbp, r12
mov r11, [ rsp - 0x50 ]; load m64 out1 to register64
mov [ r11 + 0x0 ], rdx; out1[0] = x79
mov rdx, 0xffffffffffffffff ; moving imm to reg
and rbx, rdx; lo limb and'ed
mov r12, 0x1000003d10 ; moving imm to reg
mov rdx, r12; 0x1000003d10 to rdx
mulx r13, r12, rbx; x109_1, x109_0<- x108 * 0x1000003d10 (_0*_0)
adox r12, rcx
adox r14, r13
mov rcx, 0x1000003d10000 ; moving imm to reg
mov rdx, rcx; 0x1000003d10000 to rdx
mulx rbx, rcx, r10; x117_1, x117_0<- x112 * 0x1000003d10000 (_0*_0)
mov r10, r9;
shrd r10, rbp, 0x34; lo
shr rbp, 0x34; x98_1>>=0x34
and r8, r15; lo limb and'ed
adox r10, r12
adox r14, rbp
adcx r8, rcx
adc rbx, 0x0; add CF to r0's alloc
mov r13, r10;
shrd r13, r14, 0x34; lo
shr r14, 0x34; x116_1>>=0x34
xor r12, r12
adox r13, r8
adox rbx, r14
mov rcx, r13;
shrd rcx, rbx, 0x34; lo
shr rbx, 0x34; x124_1>>=0x34
xor rbp, rbp
adox rdi, rcx
adox rbx, rbp
and r13, r15; x122 <- x121&0xfffffffffffff
and r9, r15; x96 <- x95&0xfffffffffffff
mov [ r11 + 0x18 ], r13; out1[3] = x122
mov [ r11 + 0x8 ], r9; out1[1] = x96
mov [ r11 + 0x20 ], rdi; out1[4] = x127
and r10, r15; x114 <- x113&0xfffffffffffff
mov [ r11 + 0x10 ], r10; out1[2] = x114
mov rbx, [ rsp - 0x80 ]; pop
mov rbp, [ rsp - 0x78 ]; pop
mov r12, [ rsp - 0x70 ]; pop
mov r13, [ rsp - 0x68 ]; pop
mov r14, [ rsp - 0x60 ]; pop
mov r15, [ rsp - 0x58 ]; pop
add rsp, 144
ret
; cpu 13th Gen Intel(R) Core(TM) i7-1360P
; ratio 1.1570
; seed 2863111219698706 
; CC / CFLAGS gcc / -march=native -mtune=native -O3 
; cyclegoal; 10000
; using counter; RDTSCP
; framePointer omit
; memoryConstraints none
; time needed: 63459 ms on 8000 evaluations.
; Time spent for assembling and measuring (initial batch_size=259, initial num_batches=31): 5165 ms
; number of used evaluations: 8000
; Ratio (time for assembling + measure)/(total runtime for 8000 evals): 0.08139113443325612
; number reverted permutation / tried permutation: 2950 / 3994 =73.861%
; number reverted decision / tried decision: 2463 / 4005 =61.498%
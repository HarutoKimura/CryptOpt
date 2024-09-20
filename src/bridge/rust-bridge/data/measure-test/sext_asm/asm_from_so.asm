SECTION .text
	GLOBAL asm_from_so
asm_from_so:
mov rax, 0xfffffffffffffffe ; moving imm to reg
mov r10, [ rsi + 0x0 ]; load m64 x4 to register64
xor r10, rax; x4 <- arg1[0]|0xfffffffffffffffe
mov r11, 0x0 ; moving imm to reg
sub r11, [ rsi + 0x0 ]
and r11, r10; x5 <- x3&x4
mov [ rdi + 0x0 ], r11; out1[0] = x5
ret
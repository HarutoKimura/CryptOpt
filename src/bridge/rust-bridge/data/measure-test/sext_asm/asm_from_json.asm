SECTION .text
	GLOBAL asm_from_json
asm_from_json:
mov rax, 0x0 ; moving imm to reg
sub rax, [ rsi + 0x0 ]
mov r10, 0xfffffffffffffffe ; moving imm to reg
mov r11, [ rsi + 0x0 ]; load m64 x4 to register64
xor r11, r10; x4 <- arg1[0]|0xfffffffffffffffe
and rax, r11; x5 <- x3&x4
mov [ rdi + 0x0 ], rax; out1[0] = x5
ret
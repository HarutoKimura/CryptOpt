SECTION .text
GLOBAL rust_ec_secp256k1_mul_inner_nasm
rust_ec_secp256k1_mul_inner_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rcx, rdx
	mov rbp, qword [rsi]
	mov r10, qword [rsi + 8]
	mov qword [rsp - 56], r10
	mov rbx, qword [rsi + 16]
	mov r11, qword [rsi + 24]
	mov qword [rsp - 64], r11
	mov rsi, qword [rsi + 32]
	mov r9, qword [rdx + 8]
	mov qword [rsp - 96], r9
	mov rax, qword [rdx + 24]
	mov qword [rsp - 72], rax
	mul rbp
	mov qword [rsp - 88], rbp
	mov qword [rsp - 120], rax
	mov qword [rsp - 112], rdx
	mov rax, qword [rcx + 16]
	mov qword [rsp - 80], rax
	mul r10
	mov qword [rsp - 104], rdx
	mov r10, rax
	mov rax, r9
	mul rbx
	mov qword [rsp - 24], rbx
	mov r13, rax
	mov r12, rdx
	mov rax, qword [rcx]
	mov qword [rsp - 48], rax
	mov r8, qword [rcx + 32]
	mul r11
	mov r14, rdx
	mov rcx, rax
	mov rax, r8
	mov qword [rsp - 32], r8
	mul rsi
	mov r9, rsi
	mov qword [rsp - 40], rsi
	mov r15, rax
	mov rsi, rdx
	mov rdx, 4503599627370495
	and rax, rdx
	mov rdx, 68719492368
	mul rdx
	add rcx, r13
	adc r14, r12
	add rcx, r10
	adc r14, qword [rsp - 104]
	add rcx, qword [rsp - 120]
	adc r14, qword [rsp - 112]
	add rcx, rax
	adc r14, rdx
	shld rsi, r15, 12
	shld r14, rcx, 12
	mov rax, r8
	mul rbp
	mov qword [rsp - 112], rdx
	mov qword [rsp - 120], rax
	mov rax, qword [rsp - 72]
	mov r10, qword [rsp - 56]
	mul r10
	mov qword [rsp - 104], rdx
	mov qword [rsp - 8], rax
	mov r13, qword [rsp - 80]
	mov rax, r13
	mul rbx
	mov qword [rsp - 16], rdx
	mov rbp, rax
	mov rax, qword [rsp - 96]
	mov rbx, qword [rsp - 64]
	mul rbx
	mov r11, rdx
	mov r8, rax
	mov r12, qword [rsp - 48]
	mov rax, r12
	mul r9
	mov r15, rdx
	mov r9, rax
	mov rax, rsi
	mov rdx, 68719492368
	mul rdx
	add r9, r8
	adc r15, r11
	add r9, rbp
	adc r15, qword [rsp - 16]
	add r9, qword [rsp - 8]
	adc r15, qword [rsp - 104]
	add r9, qword [rsp - 120]
	adc r15, qword [rsp - 112]
	add r9, rax
	adc r15, rdx
	add r9, r14
	adc r15, 0
	shld r15, r9, 12
	mov r14, r9
	shr r14, 48
	mov rax, r12
	mov r12, qword [rsp - 88]
	mul r12
	mov qword [rsp - 112], rdx
	mov qword [rsp - 120], rax
	mov rax, qword [rsp - 32]
	mul r10
	mov qword [rsp - 104], rdx
	mov rsi, rax
	mov rax, qword [rsp - 72]
	mov rbp, qword [rsp - 24]
	mul rbp
	mov r10, rax
	mov r11, rdx
	and r14d, 15
	mov rax, r13
	mul rbx
	mov r13, rdx
	mov rbx, rax
	mov r8, qword [rsp - 96]
	mov rax, r8
	mul qword [rsp - 40]
	add rax, rbx
	adc r13, rdx
	add rax, r10
	adc r13, r11
	add rax, rsi
	adc r13, qword [rsp - 104]
	add rax, r15
	adc r13, 0
	shld r13, rax, 12
	shl rax, 4
	mov rdx, 72057594037927920
	and rax, rdx
	or rax, r14
	mov rdx, 4294968273
	mul rdx
	mov rsi, rdx
	mov r14, rax
	add r14, qword [rsp - 120]
	adc rsi, qword [rsp - 112]
	shld rsi, r14, 12
	mov rax, r8
	mul r12
	mov qword [rsp - 112], rdx
	mov qword [rsp - 120], rax
	mov rax, qword [rsp - 48]
	mul qword [rsp - 56]
	mov r12, rdx
	mov r15, rax
	mov rax, qword [rsp - 32]
	mul rbp
	mov r11, rax
	mov rbx, rdx
	mov rax, 4503599627370495
	and r14, rax
	mov rax, qword [rsp - 72]
	mul qword [rsp - 64]
	mov rbp, rdx
	mov r8, rax
	mov r10, qword [rsp - 80]
	mov rax, r10
	mul qword [rsp - 40]
	add rax, r8
	adc rbp, rdx
	add rax, r11
	adc rbp, rbx
	add rax, r13
	adc rbp, 0
	shld rbp, rax, 12
	mov rbx, 4503599627370495
	and rax, rbx
	mov rdx, 68719492368
	mul rdx
	add r15, qword [rsp - 120]
	adc r12, qword [rsp - 112]
	add r15, rax
	adc r12, rdx
	add r15, rsi
	adc r12, 0
	shld r12, r15, 12
	mov rax, r10
	mul qword [rsp - 88]
	mov qword [rsp - 80], rdx
	mov qword [rsp - 88], rax
	mov rax, qword [rsp - 96]
	mul qword [rsp - 56]
	mov qword [rsp - 96], rdx
	mov r11, rax
	mov rax, qword [rsp - 48]
	mul qword [rsp - 24]
	mov r8, rax
	mov rsi, rdx
	and r15, rbx
	mov rax, qword [rsp - 32]
	mul qword [rsp - 64]
	mov r10, rdx
	mov rbx, rax
	mov rax, qword [rsp - 72]
	mul qword [rsp - 40]
	mov r13, rax
	add r13, rbx
	adc r10, rdx
	add r13, rbp
	adc r10, 0
	mov rax, r13
	mov rbp, 4503599627370495
	and rax, rbp
	mov rbx, 68719492368
	mul rbx
	add r8, r11
	adc rsi, qword [rsp - 96]
	add r8, qword [rsp - 88]
	adc rsi, qword [rsp - 80]
	add r8, rax
	adc rsi, rdx
	add r8, r12
	adc rsi, 0
	shld r10, r13, 12
	shld rsi, r8, 12
	mov r11, rbp
	and r8, rbp
	mov rax, r10
	mul rbx
	and rcx, rbp
	add rcx, rax
	adc rdx, 0
	mov rax, rdi
	add rcx, rsi
	adc rdx, 0
	and r11, rcx
	shld rdx, rcx, 12
	mov rcx, 281474976710655
	and rcx, r9
	add rcx, rdx
	mov qword [rdi], r14
	mov qword [rdi + 8], r15
	mov qword [rdi + 16], r8
	mov qword [rdi + 24], r11
	mov qword [rdi + 32], rcx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

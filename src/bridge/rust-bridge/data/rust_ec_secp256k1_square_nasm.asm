GLOBAL rust_ec_secp256k1_square_nasm
rust_ec_secp256k1_square_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rcx, qword [rsi]
	mov rbp, qword [rsi + 8]
	mov rbx, qword [rsi + 16]
	mov rax, qword [rsi + 24]
	mov qword [rsp - 48], rax
	mov r8, qword [rsi + 32]
	mul rcx
	mov r10, rdx
	mov r15, rax
	mov rax, rbx
	mul rbp
	mov r14, rdx
	mov rsi, rax
	mov rax, r8
	mul r8
	mov r12, r8
	mov r11, rax
	mov r9, rdx
	mov rax, 4503599627370493
	and rax, r11
	mov r8, 68719492368
	mul r8
	add rsi, r15
	adc r14, r10
	shld r14, rsi, 1
	add rsi, rsi
	add rsi, rax
	mov qword [rsp - 8], rsi
	adc r14, rdx
	shld r9, r11, 12
	shld r14, rsi, 12
	mov qword [rsp - 40], rbx
	mov rax, rbx
	mul rbx
	mov rsi, rdx
	mov r11, rax
	mov rax, r9
	mul r8
	mov r15, rdx
	mov r9, rax
	mov rbx, r12
	mov rax, r12
	mul rcx
	mov r12, rdx
	mov r13, rax
	mov r10, qword [rsp - 48]
	mov rax, r10
	mov qword [rsp - 56], rbp
	mul rbp
	add rax, r13
	adc r12, rdx
	shld r12, rax, 1
	add rax, rax
	add r9, r11
	adc r15, rsi
	add r9, r14
	adc r15, 0
	add r9, rax
	adc r15, r12
	shld r15, r9, 12
	mov rsi, r9
	shr rsi, 48
	mov rax, rcx
	mul rcx
	mov r8, rdx
	mov r12, rax
	mov rax, rbx
	mov r11, rbx
	mov qword [rsp - 16], rbx
	mul rbp
	mov r13, rdx
	mov r14, rax
	mov rax, r10
	mov rbx, qword [rsp - 40]
	mul rbx
	and esi, 15
	add rax, r14
	adc r13, rdx
	shld r13, rax, 1
	add rax, rax
	add rax, r15
	adc r13, 0
	shld r13, rax, 12
	shl rax, 4
	mov rdx, 72057594037927920
	and rax, rdx
	or rax, rsi
	mov rdx, 4294968273
	mul rdx
	mov rbp, rdx
	mov r14, rax
	add r14, r12
	adc rbp, r8
	mov rsi, 4503599627370495
	shld rbp, r14, 12
	and r14, rsi
	mov rax, r10
	mul r10
	mov r12, rdx
	mov r10, rax
	mov rax, rbx
	mul r11
	mov r11, rax
	shld rdx, rax, 1
	add r11, rax
	add r11, r10
	adc r12, rdx
	add r11, r13
	adc r12, 0
	mov rax, r11
	and rax, rsi
	mov rdx, 68719492368
	mul rdx
	mov r8, rax
	mov rbx, rdx
	lea rax, [rcx + rcx]
	mov qword [rsp - 24], rax
	shr rcx, 63
	mov r10, qword [rsp - 56]
	mul r10
	mov r15, rax
	mov r13, rdx
	mov rax, rcx
	imul rax, r10
	add r13, rax
	add r15, r8
	adc r13, rbx
	add r15, rbp
	adc r13, 0
	shld r12, r11, 12
	shld r13, r15, 12
	and r15, rsi
	mov rax, r10
	mul r10
	mov qword [rsp - 56], rdx
	mov qword [rsp - 32], rax
	mov rax, qword [rsp - 48]
	mul qword [rsp - 16]
	mov r11, rdx
	mov rbx, rax
	shld r11, rax, 1
	add rbx, rax
	add rbx, r12
	adc r11, 0
	mov rax, rbx
	and rax, rsi
	mov rdx, 68719492368
	mul rdx
	mov r12, rax
	mov rbp, rdx
	mov rdx, qword [rsp - 40]
	imul rcx, rdx
	mov rax, qword [rsp - 24]
	mul rdx
	mov r8, rax
	mov r10, rdx
	add r10, rcx
	add r8, qword [rsp - 32]
	adc r10, qword [rsp - 56]
	add r8, r12
	adc r10, rbp
	add r8, r13
	adc r10, 0
	shld r11, rbx, 12
	mov rcx, 4503599627370494
	and rcx, qword [rsp - 8]
	shld r10, r8, 12
	and r8, rsi
	mov rax, r11
	mov rdx, 68719492368
	mul rdx
	add rcx, rax
	adc rdx, 0
	mov rax, rdi
	add rcx, r10
	adc rdx, 0
	and rsi, rcx
	shld rdx, rcx, 12
	mov rcx, 281474976710655
	and rcx, r9
	add rcx, rdx
	mov qword [rdi], r14
	mov qword [rdi + 8], r15
	mov qword [rdi + 16], r8
	mov qword [rdi + 24], rsi
	mov qword [rdi + 32], rcx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
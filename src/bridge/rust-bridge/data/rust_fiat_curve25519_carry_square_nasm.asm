SECTION .text
GLOBAL rust_fiat_curve25519_carry_square_nasm
rust_fiat_curve25519_carry_square_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov rdx, qword [rsi + 32]
	lea rax, [rdx + 8*rdx]
	lea rax, [rdx + 2*rax]
	imul r10, rdx, 38
	lea rcx, [rdx + rdx]
	mov qword [rsp - 112], rcx
	mov r8, qword [rsi + 24]
	lea rcx, [r8 + 8*r8]
	lea rcx, [r8 + 2*rcx]
	imul r11, r8, 38
	mul rdx
	mov qword [rsp - 32], rax
	mov qword [rsp - 24], rdx
	mov r9, qword [rsi + 16]
	mov rax, r8
	mul r10
	mov qword [rsp - 8], rdx
	mov qword [rsp - 40], rax
	mov rax, rcx
	mul r8
	mov qword [rsp], rdx
	mov qword [rsp - 16], rax
	mov rax, r9
	mul r10
	mov rbx, rax
	mov rcx, rdx
	add r8, r8
	mov qword [rsp - 128], r8
	mov rax, r9
	mul r11
	mov qword [rsp - 72], rax
	mov qword [rsp - 64], rdx
	lea r14, [r9 + r9]
	mov qword [rsp - 120], r14
	mov rax, r9
	mul r9
	mov qword [rsp - 56], rax
	mov qword [rsp - 48], rdx
	mov rbp, qword [rsi + 8]
	mov rax, rbp
	mul r10
	mov r15, rdx
	mov r9, rax
	mov rax, rbp
	mul r8
	mov r11, rdx
	mov r13, rax
	mov rax, rbp
	mul r14
	mov r14, rax
	mov r8, rdx
	mov rsi, qword [rsi]
	mov rax, rbp
	mul rbp
	mov r10, rdx
	mov r12, rax
	mov rax, rsi
	mul qword [rsp - 112]
	mov qword [rsp - 80], rdx
	mov qword [rsp - 104], rax
	mov rax, rsi
	mul qword [rsp - 128]
	mov qword [rsp - 88], rax
	mov qword [rsp - 128], rdx
	add rbp, rbp
	mov rax, rsi
	mul qword [rsp - 120]
	mov qword [rsp - 112], rdx
	mov qword [rsp - 96], rax
	mov rax, rsi
	mul rbp
	mov rbp, rdx
	mov qword [rsp - 120], rax
	mov rax, rsi
	mul rsi
	add r9, qword [rsp - 72]
	adc r15, qword [rsp - 64]
	add r9, rax
	adc r15, rdx
	shld r15, r9, 13
	mov rax, 2251799813685247
	and r9, rax
	add r13, qword [rsp - 56]
	adc r11, qword [rsp - 48]
	add r13, qword [rsp - 104]
	adc r11, qword [rsp - 80]
	add r14, qword [rsp - 32]
	adc r8, qword [rsp - 24]
	add r14, qword [rsp - 88]
	adc r8, qword [rsp - 128]
	add r12, qword [rsp - 40]
	adc r10, qword [rsp - 8]
	add r12, qword [rsp - 96]
	adc r10, qword [rsp - 112]
	add rbx, qword [rsp - 16]
	adc rcx, qword [rsp]
	add rbx, qword [rsp - 120]
	adc rcx, rbp
	add rbx, r15
	adc rcx, 0
	shld rcx, rbx, 13
	and rbx, rax
	add rcx, r12
	adc r10, 0
	shld r10, rcx, 13
	and rcx, rax
	add r10, r14
	adc r8, 0
	shld r8, r10, 13
	and r10, rax
	add r8, r13
	adc r11, 0
	shld r11, r8, 13
	lea rdx, [r11 + 8*r11]
	lea rdx, [r11 + 2*rdx]
	add rdx, r9
	mov rsi, rdx
	shr rsi, 51
	add rsi, rbx
	mov r9, rsi
	shr r9, 51
	add r9, rcx
	and r8, rax
	and rdx, rax
	and rsi, rax
	mov qword [rdi], rdx
	mov qword [rdi + 8], rsi
	mov qword [rdi + 16], r9
	mov qword [rdi + 24], r10
	mov qword [rdi + 32], r8
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

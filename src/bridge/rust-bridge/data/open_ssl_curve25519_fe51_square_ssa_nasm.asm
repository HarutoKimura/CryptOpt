open_ssl_curve25519_fe51_square_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rcx, qword [rsi]
	mov r15, qword [rsi + 8]
	mov r9, qword [rsi + 16]
	mov rax, rcx
	mul rcx
	mov qword [rsp - 32], rax
	mov qword [rsp - 24], rdx
	mov r10, qword [rsi + 24]
	add rcx, rcx
	mov rax, rcx
	mul r15
	mov rbp, rdx
	mov r12, rax
	mov rax, r9
	mul rcx
	mov r8, rax
	mov r11, rdx
	mov rsi, qword [rsi + 32]
	mov rax, r10
	mul rcx
	mov qword [rsp - 40], rdx
	mov qword [rsp - 48], rax
	mov rax, rsi
	mul rcx
	mov qword [rsp - 16], rax
	mov qword [rsp - 8], rdx
	lea rax, [rsi + 8*rsi]
	lea rcx, [rsi + 2*rax]
	mov rax, rcx
	mul rsi
	mov qword [rsp - 56], rdx
	mov qword [rsp - 64], rax
	mov rax, r15
	mul r15
	mov r13, rdx
	mov rbx, rax
	add rbx, r8
	adc r13, r11
	add r15, r15
	mov rax, r15
	mul r9
	mov r14, rdx
	mov r8, rax
	mov rax, r10
	mul r15
	mov qword [rsp - 72], rdx
	mov qword [rsp - 80], rax
	mov rax, rcx
	mul r15
	mov qword [rsp - 96], rax
	mov qword [rsp - 88], rdx
	lea rax, [r10 + 8*r10]
	lea rax, [r10 + 2*rax]
	mov qword [rsp - 104], rax
	mul r10
	mov r11, rdx
	mov rsi, rax
	add rsi, r12
	adc r11, rbp
	add r10, r10
	mov rax, rcx
	mul r10
	mov rbp, rdx
	mov r10, rax
	add r10, rbx
	adc rbp, r13
	mov rax, r9
	mul r9
	mov r12, rax
	mov r15, rdx
	add r9, r9
	mov rax, qword [rsp - 104]
	mul r9
	mov rbx, rdx
	mov r13, rax
	add r13, qword [rsp - 32]
	adc rbx, qword [rsp - 24]
	add r13, qword [rsp - 96]
	adc rbx, qword [rsp - 88]
	mov rax, rcx
	mul r9
	add rax, rsi
	adc rdx, r11
	shld rbp, r10, 13
	add r8, qword [rsp - 48]
	adc r14, qword [rsp - 40]
	add r8, qword [rsp - 64]
	adc r14, qword [rsp - 56]
	add r8, rbp
	adc r14, 0
	mov rcx, 2251799813685247
	and r10, rcx
	shld rbx, r13, 13
	add rbx, rax
	adc rdx, 0
	shld r14, r8, 13
	and r13, rcx
	add r12, qword [rsp - 80]
	adc r15, qword [rsp - 72]
	add r12, qword [rsp - 16]
	adc r15, qword [rsp - 8]
	add r12, r14
	adc r15, 0
	shld rdx, rbx, 13
	shld r15, r12, 13
	add rdx, r10
	lea rax, [r15 + 8*r15]
	lea rax, [r15 + 2*rax]
	and r8, rcx
	and rbx, rcx
	add rax, r13
	mov rsi, rdx
	shr rsi, 51
	add rsi, r8
	mov r8, rax
	shr r8, 51
	add r8, rbx
	and r12, rcx
	and rdx, rcx
	and rax, rcx
	mov qword [rdi], rax
	mov qword [rdi + 8], r8
	mov qword [rdi + 16], rdx
	mov qword [rdi + 24], rsi
	mov qword [rdi + 32], r12
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
open_ssl_curve25519_fe51_mul_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov rcx, rdx
	mov r14, qword [rdx]
	mov r8, qword [rdx + 8]
	mov r9, qword [rsi]
	mov r11, rsi
	mov rax, r14
	mov qword [rsp - 24], r14
	mul r9
	mov rbx, rdx
	mov r13, rax
	mov rax, r8
	mov qword [rsp - 8], r8
	mul r9
	mov rbp, rax
	mov qword [rsp - 88], rdx
	mov r12, qword [rcx + 16]
	mov rax, r12
	mov qword [rsp - 40], r12
	mul r9
	mov r15, rax
	mov qword [rsp - 48], rdx
	mov r10, qword [rcx + 24]
	mov rax, r10
	mul r9
	mov qword [rsp - 56], rax
	mov qword [rsp - 72], rdx
	mov rcx, qword [rcx + 32]
	mov rax, rcx
	mul r9
	mov qword [rsp - 80], rax
	mov qword [rsp - 64], rdx
	lea rax, [rcx + 8*rcx]
	lea rcx, [rcx + 2*rax]
	mov qword [rsp - 32], rcx
	mov rsi, qword [rsi + 8]
	mov r9, r11
	mov qword [rsp - 16], r11
	mov rax, rsi
	mul rcx
	mov r11, rdx
	mov rcx, rax
	add rcx, r13
	adc r11, rbx
	mov rax, rsi
	mul r14
	mov r13, rax
	add r13, rbp
	adc rdx, qword [rsp - 88]
	mov qword [rsp - 88], rdx
	mov rax, rsi
	mul r8
	mov r14, rdx
	mov rbp, rax
	add rbp, r15
	adc r14, qword [rsp - 48]
	mov rax, rsi
	mul r12
	mov r15, rdx
	mov r8, rax
	add r8, qword [rsp - 56]
	adc r15, qword [rsp - 72]
	mov rax, rsi
	mul r10
	mov r12, rdx
	mov rsi, rax
	add rsi, qword [rsp - 80]
	adc r12, qword [rsp - 64]
	lea rax, [r10 + 8*r10]
	lea rdx, [r10 + 2*rax]
	mov qword [rsp - 64], rdx
	mov rbx, qword [r9 + 16]
	mov rax, rbx
	mul rdx
	mov r9, rax
	add r9, rcx
	adc rdx, r11
	mov qword [rsp - 72], rdx
	mov rax, rbx
	mul qword [rsp - 32]
	mov rcx, rax
	add rcx, r13
	adc rdx, qword [rsp - 88]
	mov qword [rsp - 80], rdx
	mov rax, rbx
	mov r13, qword [rsp - 24]
	mul r13
	mov r10, rax
	add r10, rbp
	adc rdx, r14
	mov rbp, rdx
	mov rax, rbx
	mul qword [rsp - 8]
	mov r11, rax
	add r11, r8
	adc rdx, r15
	mov qword [rsp - 88], rdx
	mov rax, rbx
	mov rbx, qword [rsp - 40]
	mul rbx
	mov r8, rax
	add r8, rsi
	adc rdx, r12
	mov qword [rsp - 48], rdx
	lea rax, [rbx + 8*rbx]
	lea rdx, [rbx + 2*rax]
	mov qword [rsp - 40], rdx
	mov rax, qword [rsp - 16]
	mov rsi, qword [rax + 24]
	mov rax, rsi
	mul rdx
	mov rbx, rax
	add rbx, r9
	adc rdx, qword [rsp - 72]
	mov qword [rsp - 56], rdx
	mov rax, rsi
	mul qword [rsp - 64]
	mov r14, rax
	add r14, rcx
	adc rdx, qword [rsp - 80]
	mov qword [rsp - 80], rdx
	mov rax, rsi
	mul qword [rsp - 32]
	mov r15, rax
	add r15, r10
	adc rdx, rbp
	mov r10, rdx
	mov rax, rsi
	mul r13
	mov rbp, rdx
	mov r12, rax
	add r12, r11
	adc rbp, qword [rsp - 88]
	mov rax, rsi
	mov rsi, qword [rsp - 8]
	mul rsi
	mov rcx, rax
	add rcx, r8
	adc rdx, qword [rsp - 48]
	mov qword [rsp - 72], rdx
	lea rax, [rsi + 8*rsi]
	lea rdx, [rsi + 2*rax]
	mov rax, qword [rsp - 16]
	mov r13, qword [rax + 32]
	mov rax, r13
	mul rdx
	mov rsi, rdx
	mov r9, rax
	add r9, rbx
	adc rsi, qword [rsp - 56]
	mov rax, r13
	mul qword [rsp - 40]
	mov r8, rdx
	mov rbx, rax
	add rbx, r14
	adc r8, qword [rsp - 80]
	mov rax, r13
	mul qword [rsp - 64]
	mov r11, rdx
	mov r14, rax
	add r14, r15
	adc r11, r10
	mov rax, r13
	mul qword [rsp - 32]
	mov r10, rdx
	mov r15, rax
	add r15, r12
	adc r10, rbp
	mov rax, r13
	mul qword [rsp - 24]
	add rax, rcx
	adc rdx, qword [rsp - 72]
	shld r11, r14, 13
	add r11, r15
	adc r10, 0
	mov rcx, 2251799813685247
	and r14, rcx
	shld rsi, r9, 13
	add rsi, rbx
	adc r8, 0
	shld r10, r11, 13
	and r9, rcx
	add r10, rax
	adc rdx, 0
	shld r8, rsi, 13
	shld rdx, r10, 13
	add r8, r14
	lea rax, [rdx + 8*rdx]
	lea rax, [rdx + 2*rax]
	and r11, rcx
	and rsi, rcx
	add rax, r9
	mov rdx, r8
	shr rdx, 51
	add rdx, r11
	mov r9, rax
	shr r9, 51
	add r9, rsi
	and r10, rcx
	and r8, rcx
	and rax, rcx
	mov qword [rdi], rax
	mov qword [rdi + 8], r9
	mov qword [rdi + 16], r8
	mov qword [rdi + 24], rdx
	mov qword [rdi + 32], r10
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
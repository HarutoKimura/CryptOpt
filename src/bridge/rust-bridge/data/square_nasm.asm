square:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov r15, qword [rsi + 32]
	mov rcx, qword [rsi + 24]
	mov r11, qword [rsi + 16]
	mov r12, qword [rsi]
	mov rbp, qword [rsi + 8]
	lea rax, [rcx + 8*rcx]
	lea r8, [rcx + 2*rax]
	mov rsi, rcx
	lea rcx, [r15 + 8*r15]
	mov rax, r12
	mul r12
	mov qword [rsp - 40], rax
	mov qword [rsp - 32], rdx
	lea r10, [r15 + 2*rcx]
	mov rax, rbp
	mul r10
	mov qword [rsp - 64], rdx
	mov qword [rsp - 72], rax
	mov rax, r11
	mul r8
	mov rcx, rdx
	mov r9, rax
	mov rax, r8
	mul rsi
	mov rbx, rsi
	mov qword [rsp - 128], rsi
	mov qword [rsp + 16], rdx
	mov qword [rsp + 8], rax
	mov rax, r12
	mul rbp
	mov qword [rsp], rdx
	mov qword [rsp - 8], rax
	mov rax, r11
	mul r10
	mov rsi, rdx
	mov r14, rax
	mov rax, rbp
	mul rbp
	mov qword [rsp - 16], rdx
	mov qword [rsp - 24], rax
	mov rax, r12
	mul r11
	mov qword [rsp - 48], rdx
	mov qword [rsp - 56], rax
	mov rax, r8
	mul r15
	mov r8, rdx
	mov r13, rax
	mov rax, r10
	mul r15
	mov qword [rsp - 80], rdx
	mov qword [rsp - 88], rax
	mov rax, r12
	mul rbx
	mov qword [rsp - 96], rdx
	mov qword [rsp - 104], rax
	mov rax, rbp
	mul r11
	mov r10, rdx
	mov rbx, rax
	mov rax, r11
	mul r11
	mov qword [rsp - 112], rdx
	mov qword [rsp - 120], rax
	mov rax, r12
	mul r15
	mov r12, rdx
	mov r11, rax
	mov rax, rbp
	mul qword [rsp - 128]
	add r9, qword [rsp - 72]
	adc rcx, qword [rsp - 64]
	shld rcx, r9, 1
	add r9, r9
	add r9, qword [rsp - 40]
	adc rcx, qword [rsp - 32]
	mov rbp, 2251799813685247
	mov r15, r9
	and r15, rbp
	add rax, r11
	adc rdx, r12
	shld rdx, rax, 1
	add rax, rax
	add rax, qword [rsp - 120]
	adc rdx, qword [rsp - 112]
	add rbx, qword [rsp - 104]
	adc r10, qword [rsp - 96]
	shld r10, rbx, 1
	add rbx, rbx
	add rbx, qword [rsp - 88]
	adc r10, qword [rsp - 80]
	add r13, qword [rsp - 56]
	adc r8, qword [rsp - 48]
	shld r8, r13, 1
	add r13, r13
	add r13, qword [rsp - 24]
	adc r8, qword [rsp - 16]
	add r14, qword [rsp - 8]
	adc rsi, qword [rsp]
	shld rsi, r14, 1
	add r14, r14
	add r14, qword [rsp + 8]
	adc rsi, qword [rsp + 16]
	shld rcx, r9, 13
	add rcx, r14
	adc rsi, 0
	shld rsi, rcx, 13
	add rsi, r13
	adc r8, 0
	shld r8, rsi, 13
	add r8, rbx
	adc r10, 0
	shld r10, r8, 13
	add r10, rax
	adc rdx, 0
	mov rax, rdi
	shld rdx, r10, 13
	lea rdi, [rdx + 8*rdx]
	lea rdx, [rdx + 2*rdi]
	add rdx, r15
	mov rdi, rdx
	and rcx, rbp
	shr rdx, 51
	add rdx, rcx
	and rdi, rbp
	and r10, rbp
	and r8, rbp
	and rsi, rbp
	mov qword [rax], rdi
	mov qword [rax + 8], rdx
	mov qword [rax + 16], rsi
	mov qword [rax + 24], r8
	mov qword [rax + 32], r10
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
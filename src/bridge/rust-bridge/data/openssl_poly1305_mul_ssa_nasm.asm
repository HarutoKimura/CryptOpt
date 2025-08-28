poly1305_mul:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r10, rdx
	mov r14, qword [rdi]
	mov rax, r14
	mul rcx
	mov r15, rax
	mov r12, rdx
	mov r13, qword [rsi]
	mov rax, r13
	mul r9
	mov r11, rdx
	mov rbx, rax
	add rbx, r15
	adc r11, r12
	mov rax, r14
	mul r8
	mov r8, rdx
	mov r14, rax
	mov rax, r13
	mul rcx
	add rax, r14
	adc rdx, r8
	mov r8, qword [r10]
	imul r9, r8
	add r9, rax
	adc rdx, 0
	imul r8, rcx
	mov qword [r10], r8
	mov qword [rdi], rbx
	add r9, r11
	mov qword [rsi], r9
	adc rdx, qword [r10]
	mov rax, rdx
	shr rax, 2
	mov rcx, rdx
	and rcx, -4
	add rcx, rax
	and edx, 3
	mov qword [r10], rdx
	add qword [rdi], rcx
	adc qword [rsi], 0
	adc qword [r10], 0
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
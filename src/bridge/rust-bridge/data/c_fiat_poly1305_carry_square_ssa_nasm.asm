c_fiat_poly1305_carry_square:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r10, qword [rsi + 16]
	lea rax, [r10 + 4*r10]
	lea r11, [r10 + r10]
	mov rbx, qword [rsi]
	mov r9, qword [rsi + 8]
	lea rcx, [r9 + r9]
	mul r10
	mov r8, rax
	mov rsi, rdx
	shl r10, 2
	lea rdx, [r10 + 4*r10]
	mov rax, r9
	mul rdx
	mov r15, rdx
	mov r13, rax
	mov rax, rcx
	mul r9
	mov r14, rdx
	mov r12, rax
	mov rax, rbx
	mul r11
	mov r9, rdx
	mov r11, rax
	mov rax, rbx
	mul rcx
	mov rcx, rdx
	mov r10, rax
	mov rax, rbx
	mul rbx
	add rax, r13
	adc rdx, r15
	shld rdx, rax, 20
	mov rbx, 17592186044415
	and rax, rbx
	add r11, r12
	adc r9, r14
	add r10, r8
	adc rcx, rsi
	add r10, rdx
	adc rcx, 0
	shld rcx, r10, 21
	mov rdx, 8796093022207
	and r10, rdx
	add rcx, r11
	adc r9, 0
	shld r9, rcx, 21
	and rcx, rdx
	lea rsi, [r9 + 4*r9]
	add rsi, rax
	mov rax, rsi
	shr rax, 44
	add rax, r10
	and rsi, rbx
	mov r8, rax
	shr r8, 43
	add r8, rcx
	and rax, rdx
	mov qword [rdi], rsi
	mov qword [rdi + 8], rax
	mov qword [rdi + 16], r8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
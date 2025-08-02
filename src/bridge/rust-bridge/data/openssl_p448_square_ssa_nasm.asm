openssl_p448_square:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov rax, qword [rsi + 32]
	mov rdx, qword [rsi]
	mov qword [rsp - 128], rdx
	lea r10, [rax + rdx]
	mov qword [rsp - 120], r10
	mov r14, rax
	mov qword [rsp - 112], rax
	mov rax, qword [rsi + 24]
	mov qword [rsp - 80], rax
	mov rcx, qword [rsi + 56]
	lea r8, [rcx + rax]
	mov qword [rsp - 96], r8
	mov qword [rsp - 88], rcx
	mul rdx
	mov r9, rdx
	mov r11, rax
	mov rax, r8
	mul r10
	mov r10, rdx
	mov rbx, rax
	mov rax, rcx
	mul r14
	mov qword [rsp - 48], rax
	mov qword [rsp - 40], rdx
	mov rcx, qword [rsi + 8]
	mov rax, qword [rsi + 16]
	mov r12, rax
	mov qword [rsp - 32], rax
	mul rcx
	mov r15, rcx
	mov qword [rsp - 24], rcx
	mov rcx, rdx
	mov r8, rax
	add r8, r11
	adc rcx, r9
	mov r9, qword [rsi + 40]
	mov r14, qword [rsi + 48]
	lea rsi, [r9 + r15]
	lea r15, [r14 + r12]
	mov rax, r15
	mul rsi
	mov rbp, rsi
	mov qword [rsp + 8], rsi
	mov rsi, rdx
	mov r12, rax
	mov rax, r14
	mul r9
	mov r13, r9
	mov qword [rsp], r9
	mov r11, rax
	mov r9, rdx
	sub rbx, r8
	sbb r10, rcx
	add rbx, r12
	adc r10, rsi
	add r11, qword [rsp - 48]
	adc r9, qword [rsp - 40]
	add r11, r8
	adc r9, rcx
	lea rcx, [r11 + r11]
	mov rax, 72057594037927935
	dec rax
	and rcx, rax
	mov qword [rsp - 48], rcx
	lea rcx, [rbx + rbx]
	and rcx, rax
	mov qword [rsp - 40], rcx
	mov r8, r10
	shld r10, rbx, 9
	shr r8, 55
	shrd r11, r9, 55
	shr r9, 55
	lea rcx, [2*rbp]
	mov rax, qword [rsp - 96]
	mul rcx
	mov rcx, rax
	mov rsi, rdx
	lea rdx, [2*r13]
	mov rax, qword [rsp - 88]
	mul rdx
	mov rbx, rdx
	mov rbp, rax
	mov qword [rsp - 8], r15
	mov rax, r15
	mul r15
	mov r13, rdx
	mov r15, rax
	add r15, rcx
	adc r13, rsi
	add r15, r10
	adc r13, r8
	mov qword [rsp - 16], r14
	mov rax, r14
	mul r14
	mov rcx, rdx
	mov r8, rax
	mov rax, qword [rsp - 128]
	mul rax
	mov rsi, rdx
	mov qword [rsp - 104], rdx
	mov r12, rax
	mov rax, qword [rsp - 120]
	mul rax
	mov r10, rdx
	mov r14, rax
	sub r14, r12
	sbb r10, rsi
	add r14, r8
	adc r10, rcx
	add r14, rbp
	adc r10, rbx
	add r14, r11
	adc r10, r9
	add r14, r15
	adc r10, r13
	mov rax, qword [rsp - 112]
	mul rax
	mov rbx, rdx
	mov r11, rax
	mov rsi, qword [rsp - 32]
	mov rax, rsi
	mul rsi
	mov rcx, rax
	mov r8, rdx
	mov rbp, qword [rsp - 24]
	lea rdx, [2*rbp]
	mov r9, qword [rsp - 80]
	mov rax, r9
	mul rdx
	add rax, rcx
	adc rdx, r8
	add r11, r12
	adc rbx, qword [rsp - 104]
	sub r11, rax
	sbb rbx, rdx
	add r11, r15
	adc rbx, r13
	mov r12, rbx
	shld rbx, r11, 8
	shr r12, 56
	mov rax, 72057594037927935
	and r11, rax
	mov r8, r10
	shr r8, 56
	shld r10, r14, 8
	mov rax, qword [rsp - 8]
	lea rcx, [rax + rax]
	mov rax, qword [rsp - 96]
	mul rcx
	mov qword [rsp - 72], rax
	mov qword [rsp - 64], rdx
	lea rcx, [rsi + rsi]
	mov rax, r9
	mul rcx
	mov qword [rsp - 56], rax
	mov qword [rsp - 104], rdx
	mov rax, qword [rsp - 16]
	lea rcx, [rax + rax]
	mov rax, qword [rsp - 88]
	mul rcx
	mov r15, rax
	mov qword [rsp + 16], rdx
	mov rcx, qword [rsp - 128]
	add rcx, rcx
	mov qword [rsp - 128], rcx
	mov rax, rbp
	mul rcx
	mov rcx, rax
	mov rbp, rdx
	mov rdx, qword [rsp - 120]
	add rdx, rdx
	mov qword [rsp - 120], rdx
	mov rax, qword [rsp + 8]
	mul rdx
	mov rsi, rax
	mov r9, rdx
	mov rdx, qword [rsp - 112]
	add rdx, rdx
	mov qword [rsp - 112], rdx
	mov rax, qword [rsp]
	mul rdx
	mov r13, rdx
	mov rdx, 72057594037927935
	and r14, rdx
	sub rsi, rcx
	sbb r9, rbp
	add rsi, r15
	adc r9, qword [rsp + 16]
	mov rdx, qword [rsp - 72]
	add rsi, rdx
	mov r15, qword [rsp - 64]
	adc r9, r15
	add rsi, r10
	adc r9, r8
	add rax, rcx
	adc r13, rbp
	sub rax, qword [rsp - 56]
	sbb r13, qword [rsp - 104]
	add rax, rdx
	adc r13, r15
	add rax, rbx
	adc r13, r12
	mov rcx, r13
	shld r13, rax, 8
	mov r8, rax
	mov rax, 72057594037927935
	and r8, rax
	mov qword [rsp - 104], r8
	mov r10, r9
	shld r9, rsi, 8
	mov rbx, rsi
	and rbx, rax
	mov rax, qword [rsp - 96]
	mul rax
	mov qword [rsp - 64], rdx
	mov r8, rax
	mov rax, qword [rsp - 80]
	mul rax
	mov qword [rsp - 56], rax
	mov qword [rsp - 80], rdx
	shr rcx, 56
	mov qword [rsp - 96], rcx
	mov rax, qword [rsp - 88]
	mul rax
	mov qword [rsp - 88], rdx
	mov qword [rsp - 72], rax
	mov rax, qword [rsp - 32]
	mul qword [rsp - 128]
	mov rcx, rdx
	mov rsi, rax
	mov rax, qword [rsp - 8]
	mul qword [rsp - 120]
	mov rbp, rax
	mov qword [rsp - 128], rdx
	shr r10, 56
	mov rax, qword [rsp - 16]
	mul qword [rsp - 112]
	mov qword [rsp - 112], rdx
	mov qword [rsp - 120], rax
	mov rax, qword [rsp - 24]
	mul rax
	mov r12, rdx
	mov r15, rax
	add r15, rsi
	adc r12, rcx
	mov rax, qword [rsp + 8]
	mul rax
	mov rcx, rdx
	mov rsi, rax
	mov rax, qword [rsp]
	mul rax
	sub rsi, r15
	sbb rcx, r12
	add rsi, rbp
	adc rcx, qword [rsp - 128]
	add rsi, qword [rsp - 72]
	adc rcx, qword [rsp - 88]
	add rsi, r8
	mov rbp, qword [rsp - 64]
	adc rcx, rbp
	add rsi, r9
	adc rcx, r10
	add rax, r15
	adc rdx, r12
	add rax, qword [rsp - 120]
	adc rdx, qword [rsp - 112]
	mov r9, qword [rsp - 104]
	mov qword [rdi + 8], r9
	sub rax, qword [rsp - 56]
	sbb rdx, qword [rsp - 80]
	mov qword [rdi + 40], rbx
	add rax, r8
	adc rdx, rbp
	add rax, r13
	adc rdx, qword [rsp - 96]
	mov r8, rdx
	shld rdx, rax, 8
	mov r9, 72057594037927935
	and rax, r9
	mov qword [rdi + 16], rax
	mov rax, rcx
	shld rcx, rsi, 8
	and rsi, r9
	shr r8, 56
	shr rax, 56
	add rdx, qword [rsp - 48]
	adc r8, 0
	add rcx, qword [rsp - 40]
	adc rax, 0
	shld r8, rdx, 8
	mov qword [rdi + 48], rsi
	mov rsi, r9
	and rdx, r9
	mov qword [rdi + 24], rdx
	and rsi, rcx
	mov qword [rdi + 56], rsi
	add r8, r14
	shld rax, rcx, 8
	add r8, rax
	mov qword [rdi + 32], r8
	add rax, r11
	mov qword [rdi], rax
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
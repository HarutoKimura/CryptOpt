openssl_p448_mul:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 208
	mov rcx, rdx
	mov rdx, qword [rdx + 8]
	mov qword [rsp + 176], rdx
	mov r10, qword [rsi + 48]
	mov rax, qword [rcx + 16]
	mov qword [rsp + 184], rax
	mov r9, qword [rcx + 48]
	lea r8, [r9 + rax]
	mov r11, r9
	mov rbx, qword [rsi + 56]
	mov r9, qword [rcx + 40]
	lea rax, [r9 + rdx]
	mov r12, r9
	mov r9, rax
	mov qword [rsp + 80], rax
	mul rbx
	mov qword [rsp + 40], rbx
	mov qword [rsp - 16], rdx
	mov qword [rsp - 24], rax
	mov rax, r8
	mov qword [rsp + 72], r8
	mul r10
	mov rbp, r10
	mov qword [rsp + 32], r10
	mov qword [rsp - 40], rax
	mov qword [rsp - 32], rdx
	mov r10, qword [rcx + 32]
	mov qword [rsp - 112], r10
	mov rax, qword [rcx]
	mov qword [rsp + 88], rax
	mov rax, qword [rcx + 24]
	mov qword [rsp + 200], rax
	mov rcx, qword [rcx + 56]
	mov qword [rsp + 120], rcx
	add rcx, rax
	mov r13, qword [rsi + 40]
	mov rax, r13
	mov qword [rsp + 8], r13
	mul rcx
	mov r15, rcx
	mov qword [rsp + 160], rcx
	mov qword [rsp - 56], rax
	mov qword [rsp - 48], rdx
	mov r14, qword [rsi + 32]
	mov rax, r10
	mul r14
	mov qword [rsp + 16], r14
	mov qword [rsp + 168], rax
	mov r10, rdx
	mov rax, qword [rsi + 24]
	mov qword [rsp - 104], rax
	lea rcx, [rbx + rax]
	mov qword [rsp + 64], rcx
	mov rbx, r12
	mov qword [rsp - 8], r12
	lea rax, [r9 + r12]
	mul rcx
	mov qword [rsp - 64], rax
	mov qword [rsp + 112], rdx
	mov rcx, qword [rsi]
	mov r9, qword [rsi + 8]
	mov rax, qword [rsi + 16]
	lea rdx, [rbp + rax]
	mov qword [rsp + 56], rdx
	mov rbp, rax
	mov qword [rsp + 136], rax
	mov qword [rsp], r11
	lea rax, [r8 + r11]
	mov qword [rsp - 128], rax
	mul rdx
	mov qword [rsp - 88], rax
	mov qword [rsp - 72], rdx
	mov r12, qword [rsp + 120]
	lea rdx, [r15 + r12]
	mov qword [rsp - 120], rdx
	lea rax, [r9 + r13]
	mov qword [rsp + 48], rax
	mov r8, r9
	mov qword [rsp + 144], r9
	mul rdx
	mov qword [rsp - 96], rax
	mov qword [rsp - 80], rdx
	lea rdx, [r14 + rcx]
	mov qword [rsp + 128], rdx
	mov qword [rsp + 152], rcx
	mov r14, qword [rsp + 88]
	mov rax, qword [rsp - 112]
	add rax, r14
	mov qword [rsp + 24], rax
	mul rdx
	mov r9, rdx
	mov rsi, rax
	mov rax, rbx
	mul qword [rsp - 104]
	mov rbx, rdx
	mov r13, rax
	mov rax, r11
	mul rbp
	mov r15, rdx
	mov rbp, rax
	mov rax, r8
	mul r12
	mov r8, rdx
	mov r11, rax
	mov rax, r14
	mul rcx
	add rax, rbp
	adc rdx, r15
	add rax, r13
	adc rdx, rbx
	add rax, r11
	adc rdx, r8
	add rsi, qword [rsp - 88]
	adc r9, qword [rsp - 72]
	add rsi, qword [rsp - 64]
	adc r9, qword [rsp + 112]
	add rsi, qword [rsp - 96]
	adc r9, qword [rsp - 80]
	sub rsi, rax
	mov r11, rsi
	mov qword [rsp + 112], rsi
	sbb r9, rdx
	mov rcx, qword [rsp + 168]
	add rcx, qword [rsp - 40]
	adc r10, qword [rsp - 32]
	add rcx, qword [rsp - 56]
	adc r10, qword [rsp - 48]
	add rcx, qword [rsp - 24]
	adc r10, qword [rsp - 16]
	add rcx, rax
	mov qword [rsp + 168], rcx
	adc r10, rdx
	mov rax, qword [rsp + 40]
	mul qword [rsp + 72]
	mov qword [rsp - 16], rdx
	mov qword [rsp - 32], rax
	mov rax, qword [rsp + 160]
	mul qword [rsp + 32]
	mov qword [rsp - 24], rdx
	mov qword [rsp - 48], rax
	mov rax, qword [rsp + 8]
	mul qword [rsp - 112]
	mov qword [rsp - 40], rdx
	mov qword [rsp - 56], rax
	mov rax, qword [rsp - 8]
	mul qword [rsp + 16]
	mov r14, rax
	mov rbp, rdx
	mov rsi, r10
	shld r10, rcx, 8
	mov rax, qword [rsp + 64]
	mul qword [rsp - 128]
	mov qword [rsp - 64], rdx
	mov qword [rsp - 72], rax
	mov rax, qword [rsp - 120]
	mul qword [rsp + 56]
	mov qword [rsp - 88], rax
	mov qword [rsp - 80], rdx
	shr rsi, 56
	mov qword [rsp - 128], rsi
	mov rax, qword [rsp + 48]
	mul qword [rsp + 24]
	mov qword [rsp - 96], rdx
	mov qword [rsp + 104], rax
	mov rax, qword [rsp + 80]
	mul qword [rsp + 128]
	mov r15, rax
	mov r8, rdx
	mov rsi, r9
	shld r9, r11, 8
	mov rax, qword [rsp - 104]
	mul qword [rsp]
	mov qword [rsp + 96], rdx
	mov r13, rax
	mov rax, r12
	mul qword [rsp + 136]
	mov r12, rax
	mov r11, rdx
	shr rsi, 56
	mov rax, qword [rsp + 144]
	mul qword [rsp + 88]
	mov rbx, rdx
	mov rcx, rax
	mov rax, qword [rsp + 176]
	mul qword [rsp + 152]
	add rax, r13
	adc rdx, qword [rsp + 96]
	add rax, r12
	adc rdx, r11
	add rax, rcx
	adc rdx, rbx
	add r15, qword [rsp - 72]
	adc r8, qword [rsp - 64]
	add r15, qword [rsp - 88]
	adc r8, qword [rsp - 80]
	add r15, qword [rsp + 104]
	adc r8, qword [rsp - 96]
	sub r15, rax
	sbb r8, rdx
	add r15, r9
	adc r8, rsi
	add r14, qword [rsp - 32]
	adc rbp, qword [rsp - 16]
	add r14, qword [rsp - 48]
	adc rbp, qword [rsp - 24]
	add r14, qword [rsp - 56]
	adc rbp, qword [rsp - 40]
	add r14, rax
	adc rbp, rdx
	add r14, r10
	adc rbp, qword [rsp - 128]
	mov r9, rbp
	shld rbp, r14, 8
	mov rax, qword [rsp + 160]
	mul qword [rsp + 40]
	mov qword [rsp - 32], rax
	mov qword [rsp - 128], rdx
	mov rax, 72057594037927935
	and r14, rax
	mov rsi, rax
	mov qword [rsp - 16], r14
	mov rbx, r8
	shld r8, r15, 8
	mov rcx, r15
	mov rax, qword [rsp + 32]
	mul qword [rsp - 112]
	mov qword [rsp - 48], rdx
	mov qword [rsp - 64], rax
	mov rax, qword [rsp + 8]
	mul qword [rsp - 8]
	mov qword [rsp - 40], rdx
	mov qword [rsp - 56], rax
	mov rax, qword [rsp]
	mul qword [rsp + 16]
	mov r15, rax
	mov r10, rdx
	and rcx, rsi
	mov qword [rsp - 24], rcx
	mov rax, qword [rsp - 120]
	mul qword [rsp + 64]
	mov qword [rsp - 72], rdx
	mov qword [rsp - 80], rax
	mov rax, qword [rsp + 56]
	mul qword [rsp + 24]
	mov qword [rsp - 96], rdx
	mov qword [rsp + 96], rax
	mov rax, qword [rsp + 48]
	mul qword [rsp + 80]
	mov qword [rsp + 104], rax
	mov qword [rsp - 88], rdx
	shr r9, 56
	mov qword [rsp - 120], r9
	mov rax, qword [rsp + 72]
	mul qword [rsp + 128]
	mov r13, rdx
	mov r9, rax
	mov rax, qword [rsp + 120]
	mul qword [rsp - 104]
	mov rcx, rdx
	mov rsi, rax
	mov rax, qword [rsp + 136]
	mul qword [rsp + 88]
	mov r12, rax
	mov r11, rdx
	shr rbx, 56
	mov qword [rsp + 192], rbx
	mov rax, qword [rsp + 144]
	mul qword [rsp + 176]
	mov r14, rdx
	mov rbx, rax
	mov rax, qword [rsp + 184]
	mul qword [rsp + 152]
	add rax, r12
	adc rdx, r11
	add rax, rsi
	adc rdx, rcx
	add rax, rbx
	adc rdx, r14
	add r9, qword [rsp + 96]
	adc r13, qword [rsp - 96]
	add r9, qword [rsp - 80]
	adc r13, qword [rsp - 72]
	add r9, qword [rsp + 104]
	adc r13, qword [rsp - 88]
	sub r9, rax
	sbb r13, rdx
	add r9, r8
	adc r13, qword [rsp + 192]
	add r15, qword [rsp - 64]
	adc r10, qword [rsp - 48]
	add r15, qword [rsp - 32]
	adc r10, qword [rsp - 128]
	add r15, qword [rsp - 56]
	adc r10, qword [rsp - 40]
	add r15, rax
	adc r10, rdx
	add r15, rbp
	adc r10, qword [rsp - 120]
	mov rsi, r10
	shld r10, r15, 8
	mov rcx, 72057594037927935
	and r15, rcx
	mov qword [rsp - 120], r15
	mov rbx, r13
	shld r13, r9, 8
	mov rax, qword [rsp + 40]
	mul qword [rsp - 112]
	mov qword [rsp - 112], rdx
	mov qword [rsp - 128], rax
	mov rax, qword [rsp - 8]
	mul qword [rsp + 32]
	mov qword [rsp + 40], rdx
	mov qword [rsp - 8], rax
	mov rax, qword [rsp + 8]
	mul qword [rsp]
	mov qword [rsp], rax
	mov qword [rsp + 32], rdx
	and r9, rcx
	mov qword [rsp + 8], r9
	mov rax, qword [rsp + 120]
	mul qword [rsp + 16]
	mov r8, rdx
	mov r11, rax
	mov rax, qword [rsp + 64]
	mul qword [rsp + 24]
	mov qword [rsp + 64], rdx
	mov qword [rsp + 24], rax
	mov rax, qword [rsp + 80]
	mul qword [rsp + 56]
	mov qword [rsp + 16], rax
	mov qword [rsp + 56], rdx
	shr rsi, 56
	mov qword [rsp + 80], rsi
	mov rax, qword [rsp + 48]
	mul qword [rsp + 72]
	mov qword [rsp + 72], rdx
	mov qword [rsp + 48], rax
	mov rax, qword [rsp + 160]
	mul qword [rsp + 128]
	mov r9, rdx
	mov r14, rax
	mov rax, qword [rsp - 104]
	mul qword [rsp + 88]
	mov rcx, rax
	mov rsi, rdx
	shr rbx, 56
	mov qword [rsp - 104], rbx
	mov rax, qword [rsp + 136]
	mul qword [rsp + 176]
	mov r15, rdx
	mov rbx, rax
	mov rax, qword [rsp + 144]
	mul qword [rsp + 184]
	mov rbp, rdx
	mov r12, rax
	mov rax, qword [rsp + 200]
	mul qword [rsp + 152]
	add rbx, rcx
	adc r15, rsi
	add rbx, rax
	adc r15, rdx
	add rbx, r12
	adc r15, rbp
	add r14, qword [rsp + 24]
	adc r9, qword [rsp + 64]
	add r14, qword [rsp + 16]
	adc r9, qword [rsp + 56]
	add r14, qword [rsp + 48]
	adc r9, qword [rsp + 72]
	sub r14, rbx
	sbb r9, r15
	add r14, r13
	adc r9, qword [rsp - 104]
	add r11, qword [rsp - 128]
	adc r8, qword [rsp - 112]
	add r11, qword [rsp - 8]
	adc r8, qword [rsp + 40]
	mov rax, qword [rsp - 120]
	mov qword [rdi + 16], rax
	add r11, qword [rsp]
	adc r8, qword [rsp + 32]
	mov rax, qword [rsp + 8]
	mov qword [rdi + 48], rax
	add r11, rbx
	adc r8, r15
	add r11, r10
	adc r8, qword [rsp + 80]
	mov rax, r8
	shld r8, r11, 8
	mov r10, 72057594037927935
	and r11, r10
	mov qword [rdi + 24], r11
	mov rcx, r9
	shld r9, r14, 8
	and r14, r10
	shr rax, 56
	shr rcx, 56
	mov rdx, qword [rsp + 112]
	and rdx, r10
	add rdx, r8
	adc rax, 0
	mov qword [rdi + 56], r14
	add rdx, r9
	adc rax, rcx
	mov rsi, qword [rsp + 168]
	and rsi, r10
	add rsi, r9
	adc rcx, 0
	shld rax, rdx, 8
	and rdx, r10
	mov qword [rdi + 32], rdx
	and r10, rsi
	mov qword [rdi], r10
	shld rcx, rsi, 8
	add rax, qword [rsp - 24]
	add rcx, qword [rsp - 16]
	mov qword [rdi + 40], rax
	mov qword [rdi + 8], rcx
	add rsp, 208
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
SECTION .text
GLOBAL rust_fiat_curve25519_carry_mul_updated_nasm
rust_fiat_curve25519_carry_mul:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 192
	mov r8, rdx
	mov r15, qword [rsi + 32]
	mov r13, rsi
	mov qword [rsp - 104], rsi
	mov rcx, qword [rdx + 32]
	mov qword [rsp - 96], rcx
	lea rax, [rcx + 8*rcx]
	lea rbx, [rcx + 2*rax]
	mov rax, rbx
	mul r15
	mov qword [rsp + 176], rax
	mov qword [rsp + 184], rdx
	mov rcx, qword [r8 + 24]
	mov qword [rsp - 120], rcx
	lea rax, [rcx + 8*rcx]
	lea r9, [rcx + 2*rax]
	mov rax, r9
	mul r15
	mov qword [rsp + 144], rax
	mov qword [rsp + 152], rdx
	mov rcx, qword [r8 + 16]
	mov qword [rsp - 128], rcx
	lea rax, [rcx + 8*rcx]
	lea r10, [rcx + 2*rax]
	mov rax, r10
	mul r15
	mov qword [rsp + 128], rax
	mov qword [rsp + 136], rdx
	mov rcx, qword [r8 + 8]
	lea rax, [rcx + 8*rcx]
	lea rax, [rcx + 2*rax]
	mul r15
	mov qword [rsp + 56], rax
	mov qword [rsp + 64], rdx
	mov r14, qword [rsi + 24]
	mov rax, r14
	mul rbx
	mov r11, rdx
	mov qword [rsp + 40], rax
	mov rax, r14
	mul r9
	mov rbp, rdx
	mov rsi, rax
	mov rax, r14
	mul r10
	mov qword [rsp + 16], rax
	mov r12, rdx
	mov r10, qword [r13 + 16]
	mov rax, r10
	mul rbx
	mov qword [rsp + 72], rdx
	mov qword [rsp + 48], rax
	mov rax, r10
	mul r9
	mov qword [rsp - 16], rax
	mov qword [rsp - 8], rdx
	mov r9, qword [r13 + 8]
	mov rax, r9
	mul rbx
	mov qword [rsp - 32], rax
	mov qword [rsp - 24], rdx
	mov r8, qword [r8]
	mov rax, r8
	mul r15
	mov qword [rsp + 168], rdx
	mov qword [rsp + 160], rax
	mov rax, r14
	mov r15, rcx
	mov qword [rsp - 112], rcx
	mul rcx
	mov qword [rsp + 120], rdx
	mov qword [rsp + 112], rax
	mov rax, r8
	mov qword [rsp - 88], r8
	mul r14
	mov qword [rsp + 104], rdx
	mov qword [rsp + 96], rax
	mov rax, r10
	mov rcx, qword [rsp - 128]
	mul rcx
	mov r13, rdx
	mov rbx, rax
	mov rax, r10
	mul r15
	mov r15, rdx
	mov r14, rax
	mov rax, r8
	mul r10
	mov qword [rsp + 8], rdx
	mov qword [rsp], rax
	mov rax, r9
	mul qword [rsp - 120]
	mov qword [rsp + 88], rdx
	mov qword [rsp + 80], rax
	mov rax, r9
	mul rcx
	mov qword [rsp + 32], rdx
	mov qword [rsp + 24], rax
	mov rax, r9
	mov r8, qword [rsp - 112]
	mul r8
	mov qword [rsp - 56], rax
	mov qword [rsp - 48], rdx
	mov rax, qword [rsp - 104]
	mov r10, qword [rax]
	mov rcx, qword [rsp - 88]
	mov rax, rcx
	mul r9
	mov qword [rsp - 72], rdx
	mov qword [rsp - 80], rax
	mov rax, r10
	mul qword [rsp - 96]
	mov qword [rsp - 96], rdx
	mov qword [rsp - 104], rax
	mov rax, r10
	mul qword [rsp - 120]
	mov qword [rsp - 120], rdx
	mov qword [rsp - 40], rax
	mov rax, r10
	mul qword [rsp - 128]
	mov qword [rsp - 128], rdx
	mov qword [rsp - 64], rax
	mov rax, r10
	mul r8
	mov qword [rsp - 112], rdx
	mov r9, rax
	mov rax, r10
	mul rcx
	mov r8, qword [rsp + 16]
	add r8, qword [rsp + 56]
	adc r12, qword [rsp + 64]
	add r8, qword [rsp - 16]
	adc r12, qword [rsp - 8]
	add r8, qword [rsp - 32]
	adc r12, qword [rsp - 24]
	add r8, rax
	adc r12, rdx
	shld r12, r8, 13
	mov rax, 2251799813685247
	and r8, rax
	mov rcx, qword [rsp + 40]
	add rcx, qword [rsp + 144]
	adc r11, qword [rsp + 152]
	add rsi, qword [rsp + 128]
	adc rbp, qword [rsp + 136]
	add rsi, qword [rsp + 48]
	adc rbp, qword [rsp + 72]
	add rsi, qword [rsp - 80]
	adc rbp, qword [rsp - 72]
	add rsi, r9
	adc rbp, qword [rsp - 112]
	add rsi, r12
	adc rbp, 0
	shld rbp, rsi, 13
	and rsi, rax
	add rcx, qword [rsp - 56]
	adc r11, qword [rsp - 48]
	add rcx, qword [rsp]
	adc r11, qword [rsp + 8]
	add rcx, qword [rsp - 64]
	adc r11, qword [rsp - 128]
	add rcx, rbp
	adc r11, 0
	shld r11, rcx, 13
	and rcx, rax
	add r14, qword [rsp + 176]
	adc r15, qword [rsp + 184]
	add r14, qword [rsp + 24]
	adc r15, qword [rsp + 32]
	add r14, qword [rsp + 96]
	adc r15, qword [rsp + 104]
	add r14, qword [rsp - 40]
	adc r15, qword [rsp - 120]
	add r14, r11
	adc r15, 0
	shld r15, r14, 13
	and r14, rax
	add rbx, qword [rsp + 112]
	adc r13, qword [rsp + 120]
	add rbx, qword [rsp + 80]
	adc r13, qword [rsp + 88]
	add rbx, qword [rsp + 160]
	adc r13, qword [rsp + 168]
	add rbx, qword [rsp - 104]
	adc r13, qword [rsp - 96]
	add rbx, r15
	adc r13, 0
	shld r13, rbx, 13
	lea rdx, [8*r13]
	add rdx, r13
	lea rdx, [2*rdx]
	add rdx, r13
	add rdx, r8
	mov r8, rdx
	shr r8, 51
	add r8, rsi
	mov rsi, r8
	shr rsi, 51
	add rsi, rcx
	and rbx, rax
	and rdx, rax
	and r8, rax
	mov qword [rdi], rdx
	mov qword [rdi + 8], r8
	mov qword [rdi + 16], rsi
	mov qword [rdi + 24], r14
	mov qword [rdi + 32], rbx
	add rsp, 192
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

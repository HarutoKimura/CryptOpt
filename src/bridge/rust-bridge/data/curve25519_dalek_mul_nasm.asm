SECTION .text
GLOBAL curve25519_dalek_mul_nasm
curve25519_dalek_mul_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 144
	mov r8, rdx
	mov rax, qword [rdx]
	mov qword [rsp - 120], rax
	mov r15, qword [rdx + 8]
	lea rcx, [r15 + 8*r15]
	lea r11, [r15 + 2*rcx]
	mov rcx, qword [rdx + 16]
	mov qword [rsp - 112], rcx
	lea rdx, [rcx + 8*rcx]
	lea r10, [rcx + 2*rdx]
	mov qword [rsp - 96], r10
	mov rcx, qword [rsi]
	mov qword [rsp - 80], rcx
	mul rcx
	mov rcx, rax
	mov r9, rdx
	mov r12, qword [r8 + 24]
	mov rax, qword [rsi + 32]
	mov qword [rsp - 104], rax
	mul r11
	mov r11, rdx
	mov rbx, rax
	add rbx, rcx
	adc r11, r9
	mov r13, qword [rsi + 24]
	mov rax, r13
	mov qword [rsp - 128], r13
	mul r10
	mov r9, rdx
	mov r14, rax
	add r14, rbx
	mov qword [rsp], r12
	lea rax, [r12 + 8*r12]
	lea r12, [r12 + 2*rax]
	adc r9, r11
	mov rcx, qword [rsi + 16]
	mov rax, rcx
	mul r12
	mov r11, rdx
	mov rbx, rax
	add rbx, r14
	adc r11, r9
	mov rdx, qword [r8 + 32]
	mov qword [rsp + 120], rdx
	lea rax, [rdx + 8*rdx]
	lea rbp, [rdx + 2*rax]
	mov r9, qword [rsi + 8]
	mov rax, r9
	mul rbp
	add rax, rbx
	mov qword [rsp + 96], rax
	adc rdx, r11
	mov qword [rsp + 80], rdx
	mov rax, r9
	mov r10, qword [rsp - 120]
	mul r10
	mov qword [rsp + 136], rdx
	mov qword [rsp + 128], rax
	mov r14, qword [rsp - 80]
	mov rax, r14
	mul r15
	mov qword [rsp + 64], rdx
	mov qword [rsp + 32], rax
	mov r8, qword [rsp - 104]
	mov rax, r8
	mul qword [rsp - 96]
	mov rbx, rdx
	mov rsi, rax
	mov rax, r13
	mul r12
	mov qword [rsp + 8], rdx
	mov qword [rsp - 24], rax
	mov qword [rsp - 88], rcx
	mov rax, rcx
	mul rbp
	mov qword [rsp - 16], rdx
	mov qword [rsp - 40], rax
	mov rax, rcx
	mul r10
	mov qword [rsp - 96], rdx
	mov qword [rsp + 104], rax
	mov rax, r9
	mul r15
	mov qword [rsp + 112], rdx
	mov qword [rsp + 88], rax
	mov rax, r14
	mov r11, qword [rsp - 112]
	mul r11
	mov qword [rsp - 8], rdx
	mov qword [rsp - 32], rax
	mov rax, r8
	mov r13, r8
	mul r12
	mov r12, rdx
	mov r8, rax
	mov rcx, qword [rsp - 128]
	mov rax, rcx
	mul rbp
	mov qword [rsp - 48], rdx
	mov qword [rsp - 56], rax
	mov rax, rcx
	mul r10
	mov qword [rsp + 72], rdx
	mov qword [rsp + 48], rax
	mov rcx, qword [rsp - 88]
	mov rax, rcx
	mul r15
	mov qword [rsp + 56], rdx
	mov qword [rsp + 24], rax
	mov rax, r9
	mul r11
	mov qword [rsp + 40], rdx
	mov qword [rsp + 16], rax
	mov rax, r14
	mov r10, qword [rsp]
	mul r10
	mov qword [rsp - 64], rdx
	mov qword [rsp - 72], rax
	mov rax, r13
	mul rbp
	mov rbp, rdx
	mov r11, rax
	mov rax, r13
	mul qword [rsp - 120]
	mov qword [rsp - 120], rdx
	mov qword [rsp - 104], rax
	mov rax, qword [rsp - 128]
	mul r15
	mov qword [rsp - 128], rdx
	mov r13, rax
	mov rax, rcx
	mul qword [rsp - 112]
	mov qword [rsp - 112], rdx
	mov r15, rax
	mov rax, r9
	mul r10
	mov r9, rdx
	mov rcx, rax
	mov rax, r14
	mul qword [rsp + 120]
	mov r14, qword [rsp + 96]
	mov r10, qword [rsp + 80]
	shld r10, r14, 13
	add rsi, qword [rsp + 32]
	adc rbx, qword [rsp + 64]
	add rsi, qword [rsp - 24]
	adc rbx, qword [rsp + 8]
	add rsi, qword [rsp - 40]
	adc rbx, qword [rsp - 16]
	add rsi, qword [rsp + 128]
	adc rbx, qword [rsp + 136]
	add rsi, r10
	adc rbx, 0
	shld rbx, rsi, 13
	mov r10, 2251799813685247
	and r14, r10
	add r8, qword [rsp - 32]
	adc r12, qword [rsp - 8]
	add r8, qword [rsp - 56]
	adc r12, qword [rsp - 48]
	add r8, qword [rsp + 104]
	adc r12, qword [rsp - 96]
	add r8, qword [rsp + 88]
	adc r12, qword [rsp + 112]
	add r8, rbx
	adc r12, 0
	shld r12, r8, 13
	and rsi, r10
	add r11, qword [rsp - 72]
	adc rbp, qword [rsp - 64]
	add r11, qword [rsp + 48]
	adc rbp, qword [rsp + 72]
	add r11, qword [rsp + 24]
	adc rbp, qword [rsp + 56]
	add r11, qword [rsp + 16]
	adc rbp, qword [rsp + 40]
	add r11, r12
	adc rbp, 0
	and r8, r10
	shld rbp, r11, 13
	add rax, qword [rsp - 104]
	adc rdx, qword [rsp - 120]
	add rax, r13
	adc rdx, qword [rsp - 128]
	add rax, r15
	adc rdx, qword [rsp - 112]
	add rax, rcx
	adc rdx, r9
	add rax, rbp
	adc rdx, 0
	shld rdx, rax, 13
	lea rcx, [rdx + 8*rdx]
	lea rcx, [rdx + 2*rcx]
	add rcx, r14
	mov rdx, rcx
	shr rdx, 51
	add rdx, rsi
	and r11, r10
	and rax, r10
	and rcx, r10
	mov qword [rdi], rcx
	mov qword [rdi + 8], rdx
	mov qword [rdi + 16], r8
	mov qword [rdi + 24], r11
	mov qword [rdi + 32], rax
	mov rax, rdi
	add rsp, 144
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

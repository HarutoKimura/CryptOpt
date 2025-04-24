SECTION .text
GLOBAL rust_fiat_poly1305_carry_mul_nasm
rust_fiat_poly1305_carry_mul_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r8, rdx
	mov r10, qword [rsi + 16]
	mov r15, qword [rdx + 16]
	lea rax, [r15 + 4*r15]
	mul r10
	mov qword [rsp - 16], rax
	mov qword [rsp - 8], rdx
	mov r13, qword [r8 + 8]
	lea r11, [2*r13]
	lea rax, [r11 + 4*r11]
	mul r10
	mov qword [rsp - 32], rax
	mov qword [rsp - 24], rdx
	mov r9, qword [rsi + 8]
	lea rax, [r15 + r15]
	lea rcx, [rax + 4*rax]
	mov rax, r9
	mul rcx
	mov rcx, rax
	mov rbx, rdx
	mov r12, qword [r8]
	mov rax, r12
	mul r10
	mov qword [rsp - 40], rdx
	mov qword [rsp - 48], rax
	mov rax, r9
	mul r11
	mov r10, rdx
	mov r14, rax
	mov rax, r12
	mul r9
	mov r11, rax
	mov r9, rdx
	mov rbp, qword [rsi]
	mov rax, rbp
	mul r15
	mov r8, rdx
	mov rsi, rax
	mov rax, rbp
	mul r13
	mov r13, rdx
	mov r15, rax
	mov rax, rbp
	mul r12
	add rcx, qword [rsp - 32]
	adc rbx, qword [rsp - 24]
	add rcx, rax
	adc rbx, rdx
	shld rbx, rcx, 20
	mov rax, 17592186044415
	and rcx, rax
	add r14, qword [rsp - 48]
	adc r10, qword [rsp - 40]
	add r14, rsi
	adc r10, r8
	add r11, qword [rsp - 16]
	adc r9, qword [rsp - 8]
	add r11, r15
	adc r9, r13
	add r11, rbx
	adc r9, 0
	shld r9, r11, 21
	mov rdx, 8796093022207
	and r11, rdx
	add r9, r14
	adc r10, 0
	shld r10, r9, 21
	lea rsi, [r10 + 4*r10]
	add rsi, rcx
	mov rcx, rsi
	shr rcx, 44
	add rcx, r11
	and r9, rdx
	and rsi, rax
	mov rax, rcx
	shr rax, 43
	add rax, r9
	and rcx, rdx
	mov qword [rdi], rsi
	mov qword [rdi + 8], rcx
	mov qword [rdi + 16], rax
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

SECTION .text
GLOBAL rust_fiat_poly1305_carry_square_nasm
rust_fiat_poly1305_carry_square_nasm:
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r10, qword [rsi + 16]
	lea rax, [r10 + 4*r10]
	lea r11, [r10 + r10]
	mov rbx, qword [rsi]
	mov rsi, qword [rsi + 8]
	lea rcx, [rsi + rsi]
	mul r10
	mov r9, rax
	mov r8, rdx
	shl r10, 2
	lea rdx, [r10 + 4*r10]
	mov rax, rsi
	mul rdx
	mov r15, rdx
	mov r13, rax
	mov rax, rcx
	mul rsi
	mov r14, rdx
	mov r12, rax
	mov rax, rbx
	mul r11
	mov r10, rdx
	mov r11, rax
	mov rax, rbx
	mul rcx
	mov rcx, rdx
	mov rsi, rax
	mov rax, rbx
	mul rbx
	add rax, r13
	adc rdx, r15
	shld rdx, rax, 20
	mov rbx, 17592186044413
	and rax, rbx
	add r11, r12
	adc r10, r14
	add rsi, r9
	adc rcx, r8
	add rsi, rdx
	adc rcx, 0
	shld rcx, rsi, 21
	mov rdx, 8796093022207
	and rsi, rdx
	add rcx, r11
	adc r10, 0
	shld r10, rcx, 21
	and rcx, rdx
	lea r8, [r10 + 4*r10]
	add r8, rax
	or rbx, 2
	and rbx, r8
	shr r8, 44
	add r8, rsi
	mov rax, r8
	shr rax, 43
	add rax, rcx
	and r8, rdx
	mov qword [rdi], rbx
	mov qword [rdi + 8], r8
	mov qword [rdi + 16], rax
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret

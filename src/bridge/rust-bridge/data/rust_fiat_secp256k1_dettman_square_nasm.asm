SECTION .text
GLOBAL rust_fiat_secp256k1_dettman_square_nasm
rust_fiat_secp256k1_dettman_square_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov r10, qword [rsi + 24]
	mov r13, qword [rsi + 16]
	mov r11, qword [rsi]
	mov rax, qword [rsi + 8]
	mov qword [rsp - 16], rax
	lea rbx, [rax + rax]
	mov rcx, qword [rsi + 32]
	mov rax, rcx
	mul rcx
	mov r8, rcx
	mov rsi, rax
	mov r14, rdx
	lea r9, [r11 + r11]
	mov rax, r9
	mov qword [rsp - 24], r9
	mul r10
	mov r15, rdx
	mov r12, rax
	mov rax, rbx
	mul r13
	mov rbp, rdx
	mov rcx, rax
	add rcx, r12
	adc rbp, r15
	mov rdx, 68719492368
	mov rax, rsi
	mul rdx
	mov r15, rdx
	mov rsi, rax
	add rsi, rcx
	adc r15, rbp
	shld r15, rsi, 12
	mov rax, r9
	mul r8
	mov r9, r8
	mov rcx, rdx
	mov rbp, rax
	mov rax, rbx
	mul r10
	mov r8, rax
	mov r12, rdx
	mov rax, 4503599627370495
	lea rdx, [rax - 1]
	and rdx, rsi
	mov qword [rsp - 8], rdx
	mov rax, r13
	mul r13
	mov qword [rsp - 32], r13
	mov rsi, rax
	add rsi, r8
	adc r12, rdx
	add rsi, rbp
	adc r12, rcx
	mov rcx, 281475040739328
	mov rax, r14
	mul rcx
	mov r14, rax
	add r14, rsi
	adc r12, rdx
	add r14, r15
	adc r12, 0
	shld r12, r14, 12
	mov qword [rsp - 48], r9
	mov rax, r9
	mul rbx
	mov rcx, rax
	mov rbx, rdx
	lea r15, [2*r13]
	mov rax, r15
	mul r10
	add rax, rcx
	adc rbx, rdx
	add rax, r12
	adc rbx, 0
	shld rbx, rax, 12
	shl rax, 4
	mov rcx, 72057594037927920
	and rcx, rax
	mov r12, r14
	shr r12, 48
	and r12d, 15
	mov rax, r11
	mul r11
	mov rsi, rax
	mov r8, rdx
	or rcx, r12
	mov rdx, 4294968273
	mov rax, rcx
	mul rdx
	mov r11, rax
	mov r12, rdx
	mov rax, 281474976710655
	and rax, r14
	mov qword [rsp - 40], rax
	add r11, rsi
	adc r12, r8
	shld r12, r11, 12
	mov rax, r9
	mul r15
	mov rcx, rax
	mov r14, rdx
	mov rbp, 4503599627370495
	and r11, rbp
	mov r9, r10
	mov rax, r10
	mul r10
	mov rsi, rax
	add rsi, rcx
	adc r14, rdx
	add rsi, rbx
	adc r14, 0
	shld r14, rsi, 12
	mov r10, qword [rsp - 24]
	mov rax, r10
	mov r13, qword [rsp - 16]
	mul r13
	mov rcx, rax
	mov r8, rdx
	and rsi, rbp
	mov rax, rsi
	mov rdx, 68719492368
	mul rdx
	mov r15, rdx
	mov rbx, rax
	add rbx, rcx
	adc r15, r8
	add rbx, r12
	adc r15, 0
	lea rcx, [r9 + r9]
	shld r15, rbx, 12
	and rbx, rbp
	mov rax, qword [rsp - 48]
	mul rcx
	mov r9, rdx
	mov rcx, rax
	add rcx, r14
	adc r9, 0
	mov rax, r10
	mul qword [rsp - 32]
	mov rsi, rdx
	mov r8, rax
	mov rax, r13
	mul r13
	mov r10, rdx
	mov r14, rax
	add r14, r8
	adc r10, rsi
	mov rax, rcx
	mov rcx, 68719492368
	mul rcx
	mov rsi, rdx
	mov rcx, rax
	add rcx, r14
	adc rsi, r10
	add rcx, r15
	adc rsi, 0
	shld rsi, rcx, 12
	add rsi, qword [rsp - 8]
	mov rax, r9
	mov rdx, 281475040739328
	mul rdx
	and rcx, rbp
	add rax, rsi
	adc rdx, 0
	shld rdx, rax, 12
	add rdx, qword [rsp - 40]
	and rax, rbp
	mov qword [rdi], r11
	mov qword [rdi + 8], rbx
	mov qword [rdi + 16], rcx
	mov qword [rdi + 24], rax
	mov qword [rdi + 32], rdx
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

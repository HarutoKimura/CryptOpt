c_fiat_secp256k1_dettman_mul:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	mov r11, rdx
	mov rcx, qword [rsi + 32]
	mov qword [rsp - 72], rcx
	mov rax, qword [rdx + 32]
	mov qword [rsp - 80], rax
	mul rcx
	mov r8, rax
	mov qword [rsp - 104], rdx
	mov rax, qword [r11 + 24]
	mov qword [rsp - 88], rax
	mov r9, qword [rsi]
	mov r15, qword [rsi + 8]
	mul r9
	mov qword [rsp - 32], r9
	mov qword [rsp - 120], rax
	mov qword [rsp - 112], rdx
	mov rax, qword [r11 + 16]
	mov r12, rax
	mov qword [rsp - 56], rax
	mul r15
	mov r10, rax
	mov qword [rsp - 128], rdx
	mov rcx, qword [r11]
	mov rax, qword [r11 + 8]
	mov qword [rsp - 40], rax
	mov r11, qword [rsi + 16]
	mul r11
	mov qword [rsp - 48], r11
	mov rbx, rax
	mov r13, rdx
	mov rdx, qword [rsi + 24]
	mov qword [rsp - 96], rdx
	mov rax, rcx
	mov qword [rsp - 64], rcx
	mul rdx
	mov rsi, rax
	mov r14, rdx
	mov rdx, 68719492368
	mov rax, r8
	mul rdx
	mov rbp, rdx
	mov r8, rax
	add r8, qword [rsp - 120]
	adc rbp, qword [rsp - 112]
	add r8, r10
	adc rbp, qword [rsp - 128]
	add r8, rbx
	adc rbp, r13
	add r8, rsi
	adc rbp, r14
	shld rbp, r8, 12
	mov rax, r9
	mov r9, qword [rsp - 80]
	mul r9
	mov r13, rdx
	mov qword [rsp - 120], rax
	mov rax, r15
	mov qword [rsp], r15
	mov r10, qword [rsp - 88]
	mul r10
	mov qword [rsp - 112], rdx
	mov qword [rsp - 8], rax
	mov rax, r11
	mul r12
	mov qword [rsp - 128], rdx
	mov qword [rsp - 24], rax
	mov r11, qword [rsp - 96]
	mov rax, r11
	mov r14, qword [rsp - 40]
	mul r14
	mov qword [rsp - 16], rdx
	mov rbx, rax
	mov rax, rcx
	mul qword [rsp - 72]
	mov rsi, rax
	mov r12, rdx
	mov rax, 4503599627370495
	and r8, rax
	mov rcx, 281475040739328
	mov rax, qword [rsp - 104]
	mul rcx
	mov rcx, rax
	add rcx, qword [rsp - 120]
	adc r13, rdx
	add rcx, qword [rsp - 8]
	adc r13, qword [rsp - 112]
	add rcx, qword [rsp - 24]
	adc r13, qword [rsp - 128]
	add rcx, rbx
	adc r13, qword [rsp - 16]
	add rcx, rsi
	adc r13, r12
	add rcx, rbp
	adc r13, 0
	shld r13, rcx, 12
	mov rax, r15
	mul r9
	mov rsi, rdx
	mov r9, rax
	mov r12, qword [rsp - 48]
	mov rax, r12
	mul r10
	mov rbp, rdx
	mov r10, rax
	mov rax, r11
	mul qword [rsp - 56]
	mov r11, rdx
	mov rbx, rax
	mov rax, r14
	mov r15, qword [rsp - 72]
	mul r15
	add r10, r9
	adc rbp, rsi
	add rax, r10
	adc rbp, rdx
	add rax, rbx
	adc rbp, r11
	add rax, r13
	adc rbp, 0
	shld rbp, rax, 12
	shl rax, 4
	mov rsi, 72057594037927920
	and rsi, rax
	mov r9, rcx
	shr r9, 48
	and r9d, 15
	mov rax, qword [rsp - 64]
	mov r14, qword [rsp - 32]
	mul r14
	mov r10, rax
	mov r11, rdx
	or rsi, r9
	mov rdx, 4294968273
	mov rax, rsi
	mul rdx
	mov r13, rax
	mov r9, rdx
	mov rax, 281474976710655
	and rax, rcx
	mov qword [rsp - 104], rax
	add r13, r10
	adc r9, r11
	shld r9, r13, 12
	mov rax, r12
	mul qword [rsp - 80]
	mov r10, rax
	mov rsi, rdx
	mov rax, 4503599627370495
	and r13, rax
	mov rax, qword [rsp - 96]
	mul qword [rsp - 88]
	mov r11, rdx
	mov rbx, rax
	mov rax, qword [rsp - 56]
	mul r15
	mov rcx, rax
	add rcx, r10
	adc rsi, rdx
	add rcx, rbx
	adc rsi, r11
	add rcx, rbp
	adc rsi, 0
	shld rsi, rcx, 12
	mov r12, qword [rsp - 40]
	mov rax, r12
	mul r14
	mov r10, rdx
	mov r11, rax
	mov rax, qword [rsp - 64]
	mov r15, qword [rsp]
	mul r15
	mov rbx, rdx
	mov r14, rax
	add r14, r11
	adc rbx, r10
	mov r10, 4503599627370495
	and rcx, r10
	mov rax, rcx
	mov rcx, 68719492368
	mul rcx
	mov rbp, rdx
	mov rcx, rax
	add rcx, r14
	adc rbp, rbx
	add rcx, r9
	adc rbp, 0
	shld rbp, rcx, 12
	and rcx, r10
	mov rax, qword [rsp - 96]
	mul qword [rsp - 80]
	mov r9, rdx
	mov r10, rax
	mov rax, qword [rsp - 88]
	mul qword [rsp - 72]
	mov rbx, rax
	add rbx, r10
	adc r9, rdx
	add rbx, rsi
	adc r9, 0
	mov rax, qword [rsp - 56]
	mul qword [rsp - 32]
	mov r10, rdx
	mov r14, rax
	mov rax, r12
	mul r15
	mov r11, rdx
	mov rsi, rax
	mov rax, qword [rsp - 64]
	mul qword [rsp - 48]
	mov r15, rdx
	mov r12, rax
	mov rax, rbx
	mov rdx, 68719492368
	mul rdx
	add rsi, r14
	adc r11, r10
	add rsi, r12
	adc r11, r15
	add rsi, rax
	adc r11, rdx
	add rsi, rbp
	adc r11, 0
	shld r11, rsi, 12
	add r11, r8
	mov rax, r9
	mov rdx, 281475040739328
	mul rdx
	mov r8, 4503599627370495
	and rsi, r8
	add rax, r11
	adc rdx, 0
	shld rdx, rax, 12
	add rdx, qword [rsp - 104]
	and rax, r8
	mov qword [rdi], r13
	mov qword [rdi + 8], rcx
	mov qword [rdi + 16], rsi
	mov qword [rdi + 24], rax
	mov qword [rdi + 32], rdx
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
c_fiat_p448_carry_square:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 392
	mov rax, qword [rsi + 56]
	lea rbx, [rax + rax]
	mov r8, qword [rsi + 48]
	lea r9, [r8 + r8]
	mul rax
	mov qword [rsp - 72], rdx
	mov qword [rsp - 80], rax
	mov rax, r8
	mul rbx
	mov qword [rsp - 96], rax
	mov qword [rsp - 88], rdx
	mov rcx, qword [rsi + 40]
	mov rax, r8
	mul r8
	mov qword [rsp + 264], rdx
	mov qword [rsp + 256], rax
	mov rax, rcx
	mul rbx
	mov qword [rsp - 104], rdx
	mov qword [rsp + 232], rax
	mov rax, rcx
	mov r8, r9
	mul r9
	mov qword [rsp + 160], rdx
	mov qword [rsp + 144], rax
	mov rax, rcx
	mul rcx
	mov qword [rsp + 376], rax
	mov qword [rsp + 384], rdx
	mov r9, qword [rsi + 32]
	mov rax, r9
	mul rbx
	mov qword [rsp - 120], rax
	mov r14, rdx
	lea r12, [rcx + rcx]
	mov rax, r9
	mul r8
	mov rcx, r8
	mov r15, rdx
	mov qword [rsp + 128], rax
	mov rax, r9
	mul r12
	mov qword [rsp + 328], rdx
	mov qword [rsp + 312], rax
	mov rax, r9
	mul r9
	mov qword [rsp + 176], rax
	mov qword [rsp + 184], rdx
	mov r8, qword [rsi + 24]
	mov rax, r8
	mul rbx
	mov qword [rsp + 368], rdx
	mov qword [rsp + 360], rax
	mov rax, r8
	mul rcx
	mov qword [rsp + 304], rax
	mov qword [rsp + 136], rdx
	lea rbp, [r9 + r9]
	mov rax, r8
	mul r12
	mov r13, rdx
	mov r10, rax
	mov rax, r8
	mul rbp
	mov qword [rsp + 64], rdx
	mov qword [rsp + 40], rax
	mov rax, r8
	mul r8
	mov qword [rsp + 344], rax
	mov qword [rsp + 352], rdx
	mov r9, qword [rsi + 16]
	mov rax, r9
	mul rbx
	mov qword [rsp + 248], rdx
	mov qword [rsp + 240], rax
	mov rax, r9
	mul rcx
	mov r11, rcx
	mov qword [rsp - 128], rcx
	mov qword [rsp + 120], rdx
	mov qword [rsp + 112], rax
	mov rax, r9
	mul r12
	mov qword [rsp + 8], rax
	mov qword [rsp + 16], rdx
	lea rcx, [r8 + r8]
	mov rax, r9
	mul rbp
	mov qword [rsp + 336], rdx
	mov qword [rsp + 320], rax
	mov rax, r9
	mul rcx
	mov qword [rsp + 224], rdx
	mov qword [rsp + 216], rax
	mov rax, r9
	mul r9
	mov qword [rsp + 72], rax
	mov qword [rsp + 88], rdx
	mov r8, qword [rsi + 8]
	mov rax, r8
	mul rbx
	mov qword [rsp + 56], rdx
	mov qword [rsp + 32], rax
	mov rax, r8
	mul r11
	mov qword [rsp - 8], rdx
	mov qword [rsp - 24], rax
	mov rax, r8
	mul r12
	mov qword [rsp + 288], rax
	mov qword [rsp + 296], rdx
	lea r11, [r9 + r9]
	mov rax, r8
	mul rbp
	mov qword [rsp + 168], rdx
	mov qword [rsp + 152], rax
	mov rax, r8
	mul rcx
	mov r9, rcx
	mov qword [rsp + 24], rdx
	mov qword [rsp], rax
	mov rax, r8
	mul r11
	mov qword [rsp - 112], rax
	mov rcx, rdx
	mov rsi, qword [rsi]
	mov rax, r8
	mul r8
	mov qword [rsp + 280], rdx
	mov qword [rsp + 272], rax
	mov rax, rsi
	mul rbx
	mov qword [rsp - 56], rdx
	mov qword [rsp - 64], rax
	mov rax, rsi
	mul qword [rsp - 128]
	mov qword [rsp - 128], rdx
	mov qword [rsp + 208], rax
	mov rax, rsi
	mul r12
	mov qword [rsp + 104], rdx
	mov qword [rsp + 96], rax
	mov rax, rsi
	mul rbp
	mov qword [rsp - 40], rdx
	mov qword [rsp - 48], rax
	mov rax, rsi
	mul r9
	mov r9, rax
	mov rbx, rdx
	add r8, r8
	mov rax, rsi
	mul r11
	mov qword [rsp + 200], rdx
	mov qword [rsp + 192], rax
	mov rax, rsi
	mul r8
	mov qword [rsp + 80], rdx
	mov qword [rsp + 48], rax
	mov rax, rsi
	mul rsi
	mov qword [rsp - 32], rax
	mov qword [rsp - 16], rdx
	mov r8, qword [rsp - 120]
	add r8, qword [rsp + 144]
	adc r14, qword [rsp + 160]
	mov rax, qword [rsp - 112]
	add rax, r8
	adc rcx, r14
	add rax, r9
	adc rcx, rbx
	shld rcx, rax, 8
	mov rdx, 72057594037927935
	and rax, rdx
	mov qword [rsp - 112], rax
	mov r9, rdx
	add r8, qword [rsp + 40]
	adc r14, qword [rsp + 64]
	add r8, qword [rsp + 8]
	adc r14, qword [rsp + 16]
	add r8, qword [rsp - 24]
	adc r14, qword [rsp - 8]
	add r8, qword [rsp - 64]
	mov rsi, r8
	adc r14, qword [rsp - 56]
	mov r8, qword [rsp - 72]
	mov rdx, qword [rsp - 80]
	shld r8, rdx, 1
	mov r12, qword [rsp - 88]
	mov rax, qword [rsp - 96]
	shld r12, rax, 1
	mov rax, qword [rsp + 232]
	add rax, qword [rsp + 256]
	mov r11, qword [rsp - 104]
	adc r11, qword [rsp + 264]
	mov qword [rsp - 104], r11
	shld r14, rsi, 8
	shld r11, rax, 1
	and rsi, r9
	mov qword [rsp - 120], rsi
	add r10, qword [rsp + 176]
	adc r13, qword [rsp + 184]
	lea r9, [rax + rax]
	add r9, r10
	adc r11, r13
	mov rdx, qword [rsp + 112]
	add r9, rdx
	mov rsi, qword [rsp + 120]
	adc r11, rsi
	add r9, qword [rsp + 72]
	adc r11, qword [rsp + 88]
	mov rbp, qword [rsp + 32]
	add r9, rbp
	mov rbx, qword [rsp + 56]
	adc r11, rbx
	add r9, qword [rsp]
	adc r11, qword [rsp + 24]
	add r9, qword [rsp - 48]
	adc r11, qword [rsp - 40]
	add r9, rcx
	adc r11, 0
	add r9, r14
	adc r11, 0
	shld r11, r9, 8
	mov rcx, 72057594037927935
	and r9, rcx
	add r10, rax
	adc r13, qword [rsp - 104]
	add r10, rdx
	adc r13, rsi
	add r10, rbp
	adc r13, rbx
	add r10, qword [rsp - 32]
	adc r13, qword [rsp - 16]
	add r10, r14
	adc r13, 0
	mov r14, qword [rsp + 304]
	add r14, qword [rsp + 312]
	mov rbx, qword [rsp + 136]
	adc rbx, qword [rsp + 328]
	add r14, qword [rsp + 240]
	adc rbx, qword [rsp + 248]
	mov rbp, qword [rsp - 96]
	lea rax, [2*rbp]
	add rax, r14
	adc r12, rbx
	add rax, qword [rsp + 216]
	adc r12, qword [rsp + 224]
	add rax, qword [rsp + 152]
	adc r12, qword [rsp + 168]
	add rax, qword [rsp + 96]
	adc r12, qword [rsp + 104]
	add rax, r11
	adc r12, 0
	shld r13, r10, 8
	mov rsi, rcx
	and r10, rcx
	add r14, rbp
	adc rbx, qword [rsp - 88]
	add r14, qword [rsp + 48]
	adc rbx, qword [rsp + 80]
	add r14, r13
	adc rbx, 0
	shld r12, rax, 8
	and rax, rcx
	mov rcx, qword [rsp + 128]
	add rcx, qword [rsp + 376]
	adc r15, qword [rsp + 384]
	add rcx, qword [rsp + 360]
	adc r15, qword [rsp + 368]
	mov r11, qword [rsp - 80]
	lea rdx, [r11 + r11]
	add rdx, rcx
	adc r8, r15
	add rdx, qword [rsp + 344]
	adc r8, qword [rsp + 352]
	add rdx, qword [rsp + 320]
	adc r8, qword [rsp + 336]
	add rdx, qword [rsp + 288]
	adc r8, qword [rsp + 296]
	add rdx, qword [rsp + 208]
	adc r8, qword [rsp - 128]
	add rdx, r12
	adc r8, 0
	shld rbx, r14, 8
	and r14, rsi
	add rcx, r11
	adc r15, qword [rsp - 72]
	add rcx, qword [rsp + 272]
	adc r15, qword [rsp + 280]
	add rcx, qword [rsp + 192]
	adc r15, qword [rsp + 200]
	add rcx, rbx
	adc r15, 0
	shld r8, rdx, 8
	add r8, qword [rsp - 120]
	shld r15, rcx, 8
	add r15, qword [rsp - 112]
	mov r11, r15
	shr r11, 56
	add r11, r9
	mov r9, r8
	shr r9, 56
	add r10, r9
	add r11, r9
	mov r9, r11
	shr r9, 56
	add r9, rax
	mov rax, r10
	shr rax, 56
	add rax, r14
	and rdx, rsi
	and rcx, rsi
	and r8, rsi
	and r15, rsi
	and r11, rsi
	and r10, rsi
	mov qword [rdi], r10
	mov qword [rdi + 8], rax
	mov qword [rdi + 16], rcx
	mov qword [rdi + 24], r15
	mov qword [rdi + 32], r11
	mov qword [rdi + 40], r9
	mov qword [rdi + 48], rdx
	mov qword [rdi + 56], r8
	add rsp, 392
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
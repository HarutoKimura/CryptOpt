fiat_p448_solinas_carry_square:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 384
	mov rbp, rsi
	mov rax, qword [rsi + 56]
	lea r13, [rax + rax]
	mov rcx, qword [rsi + 48]
	lea r8, [rcx + rcx]
	mul rax
	mov qword [rsp - 56], rdx
	mov qword [rsp - 64], rax
	mov rax, rcx
	mul r13
	mov qword [rsp - 80], rax
	mov qword [rsp - 72], rdx
	mov rsi, qword [rsi + 40]
	mov rax, rcx
	mul rcx
	mov qword [rsp + 240], rdx
	mov qword [rsp + 232], rax
	mov rax, rsi
	mul r13
	mov r12, rdx
	mov r9, rax
	mov rax, rsi
	mov rcx, r8
	mul r8
	mov qword [rsp - 120], rdx
	mov qword [rsp + 136], rax
	mov rax, rsi
	mul rsi
	mov qword [rsp + 368], rax
	mov qword [rsp + 376], rdx
	mov r11, qword [rbp + 32]
	mov rax, r11
	mul r13
	mov qword [rsp - 128], rax
	mov r8, rdx
	lea r14, [rsi + rsi]
	mov rax, r11
	mul rcx
	mov rsi, rcx
	mov qword [rsp + 144], rdx
	mov qword [rsp + 296], rax
	mov rax, r11
	mul r14
	mov qword [rsp + 312], rdx
	mov qword [rsp + 304], rax
	mov rax, r11
	mul r11
	mov qword [rsp - 104], rax
	mov qword [rsp + 16], rdx
	mov r10, qword [rbp + 24]
	mov rax, r10
	mul r13
	mov qword [rsp + 360], rdx
	mov qword [rsp + 352], rax
	mov rax, r10
	mul rcx
	mov qword [rsp + 216], rax
	mov qword [rsp + 224], rdx
	lea rcx, [r11 + r11]
	mov rax, r10
	mul r14
	mov qword [rsp + 128], rdx
	mov qword [rsp + 120], rax
	mov rax, r10
	mul rcx
	mov qword [rsp + 48], rdx
	mov qword [rsp + 32], rax
	mov rax, r10
	mul r10
	mov qword [rsp + 336], rax
	mov qword [rsp + 344], rdx
	mov r11, qword [rbp + 16]
	mov rax, r11
	mul r13
	mov qword [rsp + 256], rdx
	mov qword [rsp + 248], rax
	mov rax, r11
	mul rsi
	mov qword [rsp + 96], rdx
	mov qword [rsp + 80], rax
	mov rax, r11
	mul r14
	mov qword [rsp], rax
	mov qword [rsp + 8], rdx
	lea r15, [r10 + r10]
	mov rax, r11
	mul rcx
	mov qword [rsp + 328], rdx
	mov qword [rsp + 320], rax
	mov rax, r11
	mul r15
	mov qword [rsp + 192], rdx
	mov qword [rsp + 168], rax
	mov rax, r11
	mul r11
	mov qword [rsp + 104], rax
	mov qword [rsp + 112], rdx
	mov r10, qword [rbp + 8]
	mov rax, r10
	mul r13
	mov qword [rsp - 88], rdx
	mov qword [rsp - 96], rax
	mov rax, r10
	mul rsi
	mov qword [rsp - 24], rdx
	mov qword [rsp - 32], rax
	mov rax, r10
	mul r14
	mov qword [rsp + 280], rax
	mov qword [rsp + 288], rdx
	lea rbx, [r11 + r11]
	mov rax, r10
	mul rcx
	mov qword [rsp + 160], rdx
	mov qword [rsp + 152], rax
	mov rax, r10
	mul r15
	mov qword [rsp + 40], rdx
	mov qword [rsp + 24], rax
	mov rax, r10
	mul rbx
	mov qword [rsp - 112], rax
	mov r11, rdx
	mov rbp, qword [rbp]
	mov rax, r10
	mul r10
	mov qword [rsp + 272], rdx
	mov qword [rsp + 264], rax
	mov rax, rbp
	mul r13
	mov qword [rsp - 40], rdx
	mov qword [rsp - 48], rax
	mov rax, rbp
	mul rsi
	mov qword [rsp + 208], rdx
	mov qword [rsp + 184], rax
	mov rax, rbp
	mul r14
	mov qword [rsp + 88], rdx
	mov qword [rsp + 72], rax
	mov rax, rbp
	mul rcx
	mov qword [rsp - 8], rdx
	mov qword [rsp - 16], rax
	mov rax, rbp
	mul r15
	mov r13, rax
	mov rcx, rdx
	add r10, r10
	mov rax, rbp
	mul rbx
	mov qword [rsp + 200], rdx
	mov qword [rsp + 176], rax
	mov rax, rbp
	mul r10
	mov qword [rsp + 64], rdx
	mov qword [rsp + 56], rax
	mov rax, rbp
	mul rbp
	mov rsi, rax
	mov r10, qword [rsp - 128]
	add r10, qword [rsp + 136]
	adc r8, qword [rsp - 120]
	mov rax, qword [rsp - 112]
	add rax, r10
	adc r11, r8
	add rax, r13
	adc r11, rcx
	shld r11, rax, 8
	mov qword [rsp - 120], r11
	mov rcx, 72057594037927935
	and rax, rcx
	mov qword [rsp - 112], rax
	add r10, qword [rsp + 32]
	adc r8, qword [rsp + 48]
	add r10, qword [rsp]
	adc r8, qword [rsp + 8]
	add r10, qword [rsp - 32]
	adc r8, qword [rsp - 24]
	add r10, qword [rsp - 48]
	mov qword [rsp - 128], r10
	adc r8, qword [rsp - 40]
	mov r13, qword [rsp - 56]
	mov rbx, qword [rsp - 64]
	shld r13, rbx, 1
	mov rbp, qword [rsp - 72]
	mov rax, qword [rsp - 80]
	shld rbp, rax, 1
	add r9, qword [rsp + 232]
	adc r12, qword [rsp + 240]
	mov rbx, qword [rsp - 104]
	add rbx, r9
	mov r14, qword [rsp + 16]
	mov r15, r14
	adc r15, r12
	mov rcx, qword [rsp + 120]
	add rbx, rcx
	mov r11, qword [rsp + 128]
	adc r15, r11
	mov r10, qword [rsp + 80]
	add rbx, r10
	mov rax, qword [rsp + 96]
	adc r15, rax
	add rbx, qword [rsp - 96]
	adc r15, qword [rsp - 88]
	add rbx, rsi
	adc r15, rdx
	mov rdx, qword [rsp - 128]
	shld r8, rdx, 8
	mov rsi, 72057594037927935
	and rdx, rsi
	mov qword [rsp - 128], rdx
	add r9, r9
	adc r12, r12
	add r9, qword [rsp - 104]
	adc r12, r14
	add r9, rcx
	adc r12, r11
	add r9, r10
	adc r12, rax
	add r9, qword [rsp + 104]
	adc r12, qword [rsp + 112]
	add r9, qword [rsp - 96]
	adc r12, qword [rsp - 88]
	add r9, qword [rsp + 24]
	adc r12, qword [rsp + 40]
	add r9, qword [rsp - 16]
	adc r12, qword [rsp - 8]
	add r9, qword [rsp - 120]
	adc r12, 0
	add r9, r8
	adc r12, 0
	shld r12, r9, 8
	mov r10, 72057594037927935
	and r9, r10
	add r8, rbx
	adc r15, 0
	mov rbx, qword [rsp + 216]
	add rbx, qword [rsp + 304]
	mov rcx, qword [rsp + 224]
	adc rcx, qword [rsp + 312]
	mov rdx, qword [rsp - 80]
	lea rax, [rdx + rdx]
	add rax, rbx
	adc rbp, rcx
	mov r14, qword [rsp + 248]
	add rax, r14
	mov r11, qword [rsp + 256]
	adc rbp, r11
	add rax, qword [rsp + 168]
	adc rbp, qword [rsp + 192]
	add rax, qword [rsp + 152]
	adc rbp, qword [rsp + 160]
	add rax, qword [rsp + 72]
	adc rbp, qword [rsp + 88]
	add rax, r12
	adc rbp, 0
	shld r15, r8, 8
	and r8, r10
	add rbx, rdx
	adc rcx, qword [rsp - 72]
	add rbx, r14
	adc rcx, r11
	add rbx, qword [rsp + 56]
	adc rcx, qword [rsp + 64]
	add rbx, r15
	adc rcx, 0
	shld rbp, rax, 8
	and rax, r10
	mov r14, qword [rsp + 296]
	add r14, qword [rsp + 368]
	mov rsi, qword [rsp + 144]
	adc rsi, qword [rsp + 376]
	mov r11, qword [rsp - 64]
	lea rdx, [r11 + r11]
	add rdx, r14
	adc r13, rsi
	mov r12, qword [rsp + 352]
	add rdx, r12
	mov r15, qword [rsp + 360]
	adc r13, r15
	add rdx, qword [rsp + 336]
	adc r13, qword [rsp + 344]
	add rdx, qword [rsp + 320]
	adc r13, qword [rsp + 328]
	add rdx, qword [rsp + 280]
	adc r13, qword [rsp + 288]
	add rdx, qword [rsp + 184]
	adc r13, qword [rsp + 208]
	add rdx, rbp
	adc r13, 0
	shld rcx, rbx, 8
	and rbx, r10
	add r14, r11
	adc rsi, qword [rsp - 56]
	add r14, r12
	adc rsi, r15
	add r14, qword [rsp + 264]
	adc rsi, qword [rsp + 272]
	add r14, qword [rsp + 176]
	adc rsi, qword [rsp + 200]
	add r14, rcx
	mov rcx, r14
	adc rsi, 0
	shld r13, rdx, 8
	add r13, qword [rsp - 128]
	shld rsi, r14, 8
	add rsi, qword [rsp - 112]
	mov r11, rsi
	shr r11, 56
	add r11, r9
	mov r9, r13
	shr r9, 56
	add r8, r9
	add r11, r9
	mov r9, r11
	shr r9, 56
	add r9, rax
	mov rax, r8
	shr rax, 56
	add rax, rbx
	and rdx, r10
	and rcx, r10
	and r13, r10
	and rsi, r10
	and r11, r10
	and r8, r10
	mov qword [rdi], r8
	mov qword [rdi + 8], rax
	mov qword [rdi + 16], rcx
	mov qword [rdi + 24], rsi
	mov qword [rdi + 32], r11
	mov qword [rdi + 40], r9
	mov qword [rdi + 48], rdx
	mov qword [rdi + 56], r13
	add rsp, 384
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
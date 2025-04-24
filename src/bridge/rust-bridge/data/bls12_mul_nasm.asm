SECTION .text
GLOBAL bls12_mul_nasm
bls12_mul_nasm:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 392
	test rcx, rcx
	je .LBB0_19
	cmp rcx, 1
	je .LBB0_21
	cmp rcx, 2
	jbe .LBB0_22
	cmp rcx, 3
	je .LBB0_23
	cmp rcx, 4
	jbe .LBB0_24
	cmp rcx, 5
	je .LBB0_25
	test r9, r9
	je .LBB0_26
	cmp r9, 1
	je .LBB0_27
	cmp r9, 2
	jbe .LBB0_28
	cmp r9, 3
	je .LBB0_29
	cmp r9, 4
	jbe .LBB0_30
	mov qword [rsp + 384], rsi
	mov qword [rsp + 376], rdi
	cmp r9, 5
	je .LBB0_31
	mov r12, qword [rdx]
	mov rcx, qword [r8 + 8]
	mov qword [rsp + 280], rcx
	mov rax, qword [r8 + 16]
	mov qword [rsp + 104], rax
	mov qword [rsp + 56], rdx
	mul r12
	mov qword [rsp + 24], rdx
	mov rsi, rax
	mov rax, rcx
	mul r12
	mov r11, rax
	mov r14, rdx
	mov rax, qword [r8]
	mov qword [rsp + 64], rax
	mul r12
	mov rdi, rdx
	mov rcx, -8506173809081122819
	mov rdx, rax
	mov r10, rax
	imul r10, rcx
	mov qword [rsp + 48], r10
	mov rax, 5532603552561700244
	mov rbx, rdx
	mov rcx, rdx
	imul rbx, rax
	mov rbp, r8
	mov rdx, 2210141511517208575
	mov rax, r10
	mul rdx
	mov r9, rdx
	mov rax, 436827220531937283
	mov r8, rcx
	mov r13, rcx
	mov qword [rsp + 8], rcx
	imul r8, rax
	mov rcx, -5044313057631688021
	mov rax, r10
	mul rcx
	mov rcx, rdx
	add rcx, r8
	adc r9, rbx
	xor eax, eax
	test r13, r13
	setne al
	add rdi, r11
	adc r14, rsi
	setb r15b
	lea rdx, [rdi + rax]
	xor esi, esi
	add rcx, rdx
	setb sil
	add rdi, rax
	adc rsi, r14
	setb r10b
	mov qword [rsp + 112], rbp
	mov rax, qword [rbp + 32]
	mov qword [rsp + 128], rax
	mov qword [rsp + 152], r12
	mul r12
	mov qword [rsp + 40], rax
	mov qword [rsp + 272], rdx
	mov rax, qword [rbp + 24]
	mov qword [rsp + 120], rax
	mul r12
	mov r12, rax
	mov r13, rdx
	mov rax, qword [rsp + 56]
	mov r11, qword [rax + 8]
	mov qword [rsp + 144], r11
	mov rax, qword [rsp + 104]
	mul r11
	mov qword [rsp + 16], rdx
	mov r8, rax
	mov rax, qword [rsp + 280]
	mul r11
	mov rdi, rdx
	mov rbp, rax
	mov rax, qword [rsp + 64]
	mul r11
	mov r14, rax
	mov r11, rdx
	add r11, rbp
	adc rdi, r8
	setb byte [rsp + 136]
	add r15b, 255
	adc r12, qword [rsp + 24]
	adc r13, qword [rsp + 40]
	mov qword [rsp + 32], r13
	setb byte [rsp + 5]
	xor ebp, ebp
	mov r13, rsi
	add r13, r9
	setb bpl
	add r10b, 255
	adc rbp, r12
	setb byte [rsp + 264]
	mov rax, 3064711249896130499
	mov r15, qword [rsp + 8]
	imul r15, rax
	mov rdx, 7435674573564081700
	mov rax, qword [rsp + 48]
	mul rdx
	mov r10, rdx
	cmp r9, rbx
	adc r10, r15
	xor r8d, r8d
	add rbp, r10
	setb r8b
	mov rax, rcx
	add rax, r14
	adc rsi, r9
	add rcx, r14
	adc r13, r11
	lea r9, [rsi + r11]
	adc rbp, rdi
	setb sil
	mov rbx, rcx
	mov rax, -8506173809081122819
	imul rbx, rax
	mov qword [rsp + 160], rbx
	mov r14, rcx
	mov rax, 5532603552561700244
	imul r14, rax
	mov r11, rcx
	mov r12, rcx
	mov qword [rsp + 40], rcx
	mov rax, 436827220531937283
	imul r11, rax
	mov rax, rbx
	mov rcx, 2210141511517208575
	mul rcx
	mov rdi, rdx
	mov rax, rbx
	mov rcx, -5044313057631688021
	mul rcx
	add rdx, r11
	mov rcx, rdx
	adc rdi, r14
	xor eax, eax
	test r12, r12
	setne al
	lea rdx, [r9 + rax]
	xor r13d, r13d
	add rcx, rdx
	mov qword [rsp + 24], rcx
	setb r13b
	add r9, rax
	adc r13, rbp
	setb r12b
	mov rax, qword [rsp + 128]
	mov rcx, qword [rsp + 144]
	mul rcx
	mov qword [rsp + 288], rdx
	mov r9, rax
	mov rax, qword [rsp + 120]
	mul rcx
	mov r11, rax
	add byte [rsp + 136], 255
	adc r11, qword [rsp + 16]
	adc rdx, r9
	mov qword [rsp + 248], rdx
	setb byte [rsp + 328]
	add byte [rsp + 264], 255
	adc r8, qword [rsp + 32]
	setb byte [rsp + 232]
	mov rax, 2995800253092329851
	mov r9, qword [rsp + 8]
	imul r9, rax
	mov qword [rsp + 88], r9
	mov rcx, 7239337960414712511
	mov rax, qword [rsp + 48]
	mul rcx
	cmp r10, r15
	adc rdx, r9
	mov qword [rsp + 80], rdx
	xor ebx, ebx
	add r8, rdx
	setb bl
	add sil, 255
	adc r8, r11
	setb byte [rsp + 96]
	xor esi, esi
	mov rbp, r13
	add rbp, rdi
	setb sil
	add r12b, 255
	adc rsi, r8
	setb byte [rsp + 72]
	mov rcx, qword [rsp + 40]
	mov rax, 3064711249896130499
	imul rcx, rax
	mov qword [rsp + 224], rcx
	mov rax, qword [rsp + 160]
	mov rdx, 7435674573564081700
	mul rdx
	cmp rdi, r14
	adc rdx, rcx
	mov r11, rdx
	mov qword [rsp + 184], rdx
	mov rax, qword [rsp + 56]
	mov r9, qword [rax + 16]
	mov rax, qword [rsp + 64]
	mul r9
	mov r14, rax
	mov qword [rsp + 16], rdx
	mov r12, qword [rsp + 24]
	mov r8, r12
	add r8, rax
	adc r13, rdi
	mov rdi, r8
	mov rax, -8506173809081122819
	imul rdi, rax
	mov qword [rsp + 32], rdi
	mov rax, r8
	mov rcx, 5532603552561700244
	imul rax, rcx
	mov rcx, rax
	mov qword [rsp + 216], rax
	mov rax, 436827220531937283
	imul r8, rax
	mov rax, rdi
	mov rdx, 2210141511517208575
	mul rdx
	mov r15, rdx
	mov rax, rdi
	mov rdx, -5044313057631688021
	mul rdx
	mov r10, rdx
	add r10, r8
	adc r15, rcx
	mov qword [rsp + 200], r15
	xor r15d, r15d
	add rsi, r11
	setb r15b
	mov r11, qword [rsp + 104]
	mov rax, r11
	mul r9
	mov qword [rsp + 256], rdx
	mov rdi, rax
	mov rcx, qword [rsp + 280]
	mov rax, rcx
	mul r9
	add rax, qword [rsp + 16]
	adc rdx, rdi
	setb dil
	add r12, r14
	lea r8, [r13 + rax]
	adc rax, rbp
	adc rdx, rsi
	setb byte [rsp + 176]
	xor eax, eax
	test r12, r12
	mov qword [rsp + 24], r12
	setne al
	lea rsi, [r8 + rax]
	xor r14d, r14d
	add r10, rsi
	mov qword [rsp + 16], r10
	setb r14b
	add r8, rax
	adc r14, rdx
	setb byte [rsp + 296]
	mov rax, qword [rsp + 128]
	mov qword [rsp + 264], r9
	mul r9
	mov qword [rsp + 336], rdx
	mov rsi, rax
	mov rax, qword [rsp + 120]
	mul r9
	mov r8, rax
	mov r13, rdx
	mov rax, qword [rsp + 56]
	mov r9, qword [rax + 24]
	mov qword [rsp + 136], r9
	mov rax, r11
	mul r9
	mov qword [rsp + 240], rdx
	mov r10, rax
	mov rax, rcx
	mul r9
	mov rcx, rdx
	mov r11, rax
	mov rax, qword [rsp + 64]
	mul r9
	mov r9, rax
	add rdx, r11
	mov qword [rsp + 168], rdx
	adc rcx, r10
	mov qword [rsp + 304], rcx
	setb byte [rsp + 312]
	add dil, 255
	adc r8, qword [rsp + 256]
	adc r13, rsi
	mov qword [rsp + 320], r13
	setb byte [rsp + 256]
	movzx edi, byte [rsp + 5]
	mov eax, edi
	add al, 255
	mov rcx, qword [rsp + 272]
	mov rax, rcx
	adc rax, 0
	mov rax, qword [rsp + 112]
	mov rax, qword [rax + 40]
	mov qword [rsp + 112], rax
	setb sil
	mul qword [rsp + 152]
	add dil, 255
	adc rax, rcx
	movzx ecx, sil
	adc rcx, rdx
	mov qword [rsp + 208], rcx
	add byte [rsp + 232], 255
	adc rbx, rax
	setb byte [rsp + 4]
	mov rax, 326064518108171314
	mov rsi, qword [rsp + 8]
	imul rsi, rax
	mov qword [rsp + 8], rsi
	mov rcx, 5412103778470702295
	mov rax, qword [rsp + 48]
	mul rcx
	mov rax, qword [rsp + 80]
	cmp rax, qword [rsp + 88]
	adc rdx, rsi
	mov qword [rsp + 192], rdx
	xor r11d, r11d
	add rbx, rdx
	setb r11b
	add byte [rsp + 96], 255
	adc rbx, qword [rsp + 248]
	setb byte [rsp + 96]
	add byte [rsp + 72], 255
	adc r15, rbx
	setb byte [rsp + 232]
	mov rsi, qword [rsp + 40]
	mov rax, 2995800253092329851
	imul rsi, rax
	mov qword [rsp + 80], rsi
	mov rax, qword [rsp + 160]
	mov rcx, 7239337960414712511
	mul rcx
	mov rax, qword [rsp + 184]
	cmp rax, qword [rsp + 224]
	adc rdx, rsi
	mov qword [rsp + 72], rdx
	xor ebx, ebx
	add r15, rdx
	setb bl
	add byte [rsp + 176], 255
	adc r15, r8
	setb byte [rsp + 88]
	xor ecx, ecx
	mov rdi, r14
	mov rsi, qword [rsp + 200]
	add rdi, rsi
	setb cl
	add byte [rsp + 296], 255
	adc rcx, r15
	setb byte [rsp + 184]
	mov rax, 3064711249896130499
	imul r12, rax
	mov qword [rsp + 176], r12
	mov rax, qword [rsp + 32]
	mov rdx, 7435674573564081700
	mul rdx
	cmp rsi, qword [rsp + 216]
	adc rdx, r12
	mov rbp, rdx
	mov r10, qword [rsp + 16]
	mov r8, r10
	add r8, r9
	adc r14, rsi
	mov r12, r8
	mov rax, -8506173809081122819
	imul r12, rax
	mov qword [rsp + 152], r12
	mov rdx, r8
	mov rax, 5532603552561700244
	imul rdx, rax
	mov r13, rdx
	mov rax, 436827220531937283
	imul r8, rax
	mov rax, r12
	mov rdx, 2210141511517208575
	mul rdx
	mov r15, rdx
	mov rax, r12
	mov rdx, -5044313057631688021
	mul rdx
	add rdx, r8
	mov rsi, rdx
	adc r15, r13
	mov r12, r13
	xor r8d, r8d
	add rcx, rbp
	mov r13, rbp
	setb r8b
	add r10, r9
	mov qword [rsp + 16], r10
	mov rax, qword [rsp + 168]
	adc rdi, rax
	lea rax, [r14 + rax]
	adc rcx, qword [rsp + 304]
	setb byte [rsp + 200]
	xor edx, edx
	test r10, r10
	setne dl
	lea rdi, [rax + rdx]
	xor ebp, ebp
	add rsi, rdi
	mov r14, rsi
	setb bpl
	add rax, rdx
	adc rbp, rcx
	setb byte [rsp + 168]
	mov rax, qword [rsp + 128]
	mov rdi, qword [rsp + 136]
	mul rdi
	mov qword [rsp + 272], rdx
	mov rcx, rax
	mov rax, qword [rsp + 120]
	mul rdi
	mov r10, rax
	add byte [rsp + 312], 255
	adc r10, qword [rsp + 240]
	adc rdx, rcx
	mov qword [rsp + 248], rdx
	setb byte [rsp + 5]
	movzx esi, byte [rsp + 328]
	mov eax, esi
	add al, 255
	mov rdi, qword [rsp + 288]
	mov rax, rdi
	adc rax, 0
	setb r9b
	mov rax, qword [rsp + 112]
	mul qword [rsp + 144]
	mov rcx, rax
	add sil, 255
	adc rcx, rdi
	movzx eax, r9b
	adc rax, rdx
	mov rsi, rax
	mov qword [rsp + 240], rax
	add byte [rsp + 4], 255
	adc r11, qword [rsp + 208]
	setb dil
	mov rdx, 1873798617647539866
	mov rax, qword [rsp + 48]
	mul rdx
	mov rax, qword [rsp + 192]
	cmp rax, qword [rsp + 8]
	adc rdx, 0
	add rdx, r11
	movzx eax, dil
	adc rax, rsi
	add byte [rsp + 96], 255
	adc rdx, rcx
	adc rax, 0
	mov qword [rsp + 96], rax
	add byte [rsp + 232], 255
	adc rbx, rdx
	setb byte [rsp + 4]
	mov rcx, qword [rsp + 40]
	mov rax, 326064518108171314
	imul rcx, rax
	mov qword [rsp + 40], rcx
	mov rax, qword [rsp + 160]
	mov rdx, 5412103778470702295
	mul rdx
	mov rax, qword [rsp + 72]
	cmp rax, qword [rsp + 80]
	adc rdx, rcx
	mov qword [rsp + 192], rdx
	xor eax, eax
	add rbx, rdx
	setb al
	mov qword [rsp + 304], rax
	add byte [rsp + 88], 255
	adc rbx, qword [rsp + 320]
	setb byte [rsp + 224]
	add byte [rsp + 184], 255
	adc r8, rbx
	setb byte [rsp + 88]
	mov rsi, qword [rsp + 24]
	mov rax, 2995800253092329851
	imul rsi, rax
	mov qword [rsp + 72], rsi
	mov rax, qword [rsp + 32]
	mov rcx, 7239337960414712511
	mul rcx
	cmp r13, qword [rsp + 176]
	adc rdx, rsi
	mov qword [rsp + 216], rdx
	xor eax, eax
	add r8, rdx
	setb al
	mov qword [rsp + 184], rax
	add byte [rsp + 200], 255
	adc r8, r10
	setb byte [rsp + 80]
	xor ebx, ebx
	mov r13, rbp
	add r13, r15
	setb bl
	add byte [rsp + 168], 255
	adc rbx, r8
	setb byte [rsp + 208]
	mov rsi, qword [rsp + 16]
	mov rax, 3064711249896130499
	imul rsi, rax
	mov qword [rsp + 312], rsi
	mov rax, qword [rsp + 152]
	mov rcx, 7435674573564081700
	mul rcx
	cmp r15, r12
	adc rdx, rsi
	mov rsi, rdx
	mov qword [rsp + 296], rdx
	mov rax, qword [rsp + 56]
	mov rdi, qword [rax + 32]
	mov rax, qword [rsp + 64]
	mul rdi
	mov r9, rax
	mov qword [rsp + 8], rdx
	mov r12, r14
	mov r8, r14
	add r8, rax
	adc rbp, r15
	mov r10, r8
	mov rax, -8506173809081122819
	imul r10, rax
	mov qword [rsp + 48], r10
	mov rcx, r8
	mov rax, 5532603552561700244
	imul rcx, rax
	mov r11, rcx
	mov qword [rsp + 200], rcx
	mov rax, 436827220531937283
	imul r8, rax
	mov rax, r10
	mov rcx, 2210141511517208575
	mul rcx
	mov r15, rdx
	mov rax, r10
	mov rcx, -5044313057631688021
	mul rcx
	mov rcx, rdx
	add rcx, r8
	adc r15, r11
	mov qword [rsp + 168], r15
	xor r14d, r14d
	add rbx, rsi
	setb r14b
	mov r10, qword [rsp + 104]
	mov rax, r10
	mul rdi
	mov qword [rsp + 344], rdx
	mov r11, rax
	mov r8, qword [rsp + 280]
	mov rax, r8
	mul rdi
	add rax, qword [rsp + 8]
	adc rdx, r11
	setb r15b
	add r12, r9
	mov qword [rsp + 8], r12
	lea r9, [rbp + rax]
	adc rax, r13
	adc rdx, rbx
	setb byte [rsp + 7]
	xor eax, eax
	test r12, r12
	setne al
	lea r11, [r9 + rax]
	xor esi, esi
	add rcx, r11
	mov qword [rsp + 144], rcx
	setb sil
	add r9, rax
	adc rsi, rdx
	mov r9, rsi
	setb byte [rsp + 6]
	mov rax, qword [rsp + 128]
	mov qword [rsp + 320], rdi
	mul rdi
	mov rsi, rax
	mov qword [rsp + 328], rdx
	mov rax, qword [rsp + 56]
	mov rcx, qword [rax + 40]
	mov qword [rsp + 288], rcx
	mov rax, qword [rsp + 120]
	mul rdi
	mov rdi, rdx
	mov rbx, rax
	mov rax, r10
	mul rcx
	mov qword [rsp + 232], rdx
	mov r11, rax
	mov rax, r8
	mul rcx
	mov r8, rdx
	mov r13, rax
	mov rax, qword [rsp + 64]
	mul rcx
	mov qword [rsp + 352], rax
	add rdx, r13
	mov qword [rsp + 360], rdx
	adc r8, r11
	mov qword [rsp + 368], r8
	setb byte [rsp + 176]
	add r15b, 255
	adc rbx, qword [rsp + 344]
	adc rdi, rsi
	mov qword [rsp + 104], rdi
	setb byte [rsp + 280]
	movzx edi, byte [rsp + 256]
	mov eax, edi
	add al, 255
	mov rsi, qword [rsp + 336]
	mov rax, rsi
	adc rax, 0
	setb r11b
	mov rax, qword [rsp + 112]
	mul qword [rsp + 264]
	mov r10, rax
	add dil, 255
	adc r10, rsi
	movzx r12d, r11b
	adc r12, rdx
	mov qword [rsp + 336], r12
	add byte [rsp + 4], 255
	mov rsi, qword [rsp + 96]
	mov rcx, qword [rsp + 304]
	adc rcx, rsi
	setb bpl
	mov rax, qword [rsp + 160]
	mov rdx, 1873798617647539866
	mul rdx
	mov rax, qword [rsp + 192]
	cmp rax, qword [rsp + 40]
	adc rdx, 0
	cmp rsi, qword [rsp + 240]
	adc r12, 0
	add rdx, rcx
	movzx eax, bpl
	adc r12, rax
	add byte [rsp + 224], 255
	adc rdx, r10
	adc r12, 0
	add byte [rsp + 88], 255
	mov rcx, qword [rsp + 184]
	adc rcx, rdx
	setb byte [rsp + 4]
	mov rsi, qword [rsp + 24]
	mov rax, 326064518108171314
	imul rsi, rax
	mov qword [rsp + 24], rsi
	mov rax, qword [rsp + 32]
	mov rdx, 5412103778470702295
	mul rdx
	mov rax, qword [rsp + 216]
	cmp rax, qword [rsp + 72]
	adc rdx, rsi
	mov qword [rsp + 216], rdx
	xor esi, esi
	mov rax, rcx
	add rax, rdx
	setb sil
	mov qword [rsp + 192], rsi
	add byte [rsp + 80], 255
	adc rax, qword [rsp + 248]
	setb byte [rsp + 88]
	add byte [rsp + 208], 255
	adc r14, rax
	setb byte [rsp + 248]
	mov rcx, qword [rsp + 16]
	mov rax, 2995800253092329851
	imul rcx, rax
	mov qword [rsp + 96], rcx
	mov rax, qword [rsp + 152]
	mov rdx, 7239337960414712511
	mul rdx
	mov rax, qword [rsp + 296]
	cmp rax, qword [rsp + 312]
	adc rdx, rcx
	mov qword [rsp + 80], rdx
	xor ebp, ebp
	add r14, rdx
	setb bpl
	add byte [rsp + 7], 255
	adc r14, rbx
	setb byte [rsp + 240]
	xor r8d, r8d
	mov r13, r9
	mov r10, r9
	mov rsi, qword [rsp + 168]
	add r10, rsi
	setb r8b
	add byte [rsp + 6], 255
	adc r8, r14
	setb byte [rsp + 72]
	mov rdi, qword [rsp + 8]
	mov rax, 3064711249896130499
	imul rdi, rax
	mov qword [rsp + 224], rdi
	mov rax, qword [rsp + 48]
	mov rcx, 7435674573564081700
	mul rcx
	mov r11, rdx
	cmp rsi, qword [rsp + 200]
	adc r11, rdi
	mov r15, qword [rsp + 144]
	mov rbx, r15
	mov r14, qword [rsp + 352]
	add rbx, r14
	adc r13, rsi
	mov rcx, -8506173809081122819
	imul rcx, rbx
	mov qword [rsp + 64], rcx
	mov rsi, 5532603552561700244
	imul rsi, rbx
	mov qword [rsp + 264], rsi
	mov rax, 436827220531937283
	imul rbx, rax
	mov rax, rcx
	mov rdx, 2210141511517208575
	mul rdx
	mov rdi, rdx
	mov rax, rcx
	mov rcx, -5044313057631688021
	mul rcx
	mov r9, rdx
	add r9, rbx
	adc rdi, rsi
	mov qword [rsp + 56], rdi
	xor ebx, ebx
	add r8, r11
	setb bl
	mov rcx, r15
	add rcx, r14
	mov qword [rsp + 144], rcx
	mov rax, qword [rsp + 360]
	adc r10, rax
	lea rax, [r13 + rax]
	adc r8, qword [rsp + 368]
	setb r15b
	xor edx, edx
	test rcx, rcx
	setne dl
	lea rsi, [rax + rdx]
	xor ecx, ecx
	add r9, rsi
	mov qword [rsp + 160], r9
	setb cl
	add rax, rdx
	adc rcx, r8
	mov qword [rsp + 40], rcx
	setb byte [rsp + 208]
	mov rax, qword [rsp + 128]
	mov rcx, qword [rsp + 288]
	mul rcx
	mov qword [rsp + 128], rdx
	mov rdi, rax
	mov rax, qword [rsp + 120]
	mul rcx
	mov r10, rax
	add byte [rsp + 176], 255
	adc r10, qword [rsp + 232]
	adc rdx, rdi
	mov qword [rsp + 256], rdx
	setb byte [rsp + 120]
	movzx edi, byte [rsp + 5]
	mov eax, edi
	add al, 255
	mov rcx, qword [rsp + 272]
	mov rax, rcx
	adc rax, 0
	setb sil
	mov rax, qword [rsp + 112]
	mul qword [rsp + 136]
	mov r13, rax
	add dil, 255
	adc r13, rcx
	movzx edi, sil
	adc rdi, rdx
	mov qword [rsp + 136], rdi
	add byte [rsp + 4], 255
	mov r8, qword [rsp + 192]
	adc r8, r12
	setb sil
	mov rax, qword [rsp + 32]
	mov rcx, 1873798617647539866
	mul rcx
	mov rax, qword [rsp + 216]
	cmp rax, qword [rsp + 24]
	adc rdx, 0
	cmp r12, qword [rsp + 336]
	adc rdi, 0
	add rdx, r8
	movzx eax, sil
	adc rdi, rax
	add byte [rsp + 88], 255
	adc rdx, r13
	adc rdi, 0
	add byte [rsp + 248], 255
	adc rbp, rdx
	setb sil
	mov rax, 326064518108171314
	mov rcx, qword [rsp + 16]
	imul rcx, rax
	mov qword [rsp + 16], rcx
	mov rax, qword [rsp + 152]
	mov rdx, 5412103778470702295
	mul rdx
	mov r13, rdx
	mov rax, qword [rsp + 80]
	cmp rax, qword [rsp + 96]
	adc r13, rcx
	xor r12d, r12d
	add rbp, r13
	setb r12b
	add byte [rsp + 240], 255
	adc rbp, qword [rsp + 104]
	setb byte [rsp + 272]
	add byte [rsp + 72], 255
	adc rbx, rbp
	setb byte [rsp + 32]
	mov r9, qword [rsp + 8]
	mov rax, 2995800253092329851
	imul r9, rax
	mov rax, qword [rsp + 48]
	mov rdx, 7239337960414712511
	mul rdx
	mov r14, rdx
	cmp r11, qword [rsp + 224]
	adc r14, r9
	xor r8d, r8d
	add rbx, r14
	setb r8b
	add r15b, 255
	adc rbx, r10
	setb byte [rsp + 104]
	xor eax, eax
	mov rcx, qword [rsp + 56]
	add qword [rsp + 40], rcx
	setb al
	add byte [rsp + 208], 255
	adc rax, rbx
	mov rbx, rax
	setb byte [rsp + 24]
	movzx ecx, byte [rsp + 280]
	mov eax, ecx
	add al, 255
	mov r15, qword [rsp + 328]
	mov rax, r15
	adc rax, 0
	setb r11b
	mov rax, qword [rsp + 112]
	mul qword [rsp + 320]
	mov r10, rax
	add cl, 255
	adc r10, r15
	movzx r11d, r11b
	adc r11, rdx
	add sil, 255
	adc r12, rdi
	setb bpl
	mov rax, qword [rsp + 152]
	mov rdx, 1873798617647539866
	mul rdx
	cmp r13, qword [rsp + 16]
	adc rdx, 0
	cmp rdi, qword [rsp + 136]
	mov rdi, r11
	adc rdi, 0
	add rdx, r12
	movzx eax, bpl
	adc rdi, rax
	add byte [rsp + 272], 255
	adc rdx, r10
	adc rdi, 0
	add byte [rsp + 32], 255
	adc r8, rdx
	setb r13b
	mov rsi, qword [rsp + 8]
	mov rax, 326064518108171314
	imul rsi, rax
	mov qword [rsp + 8], rsi
	mov rax, qword [rsp + 48]
	mov rcx, 5412103778470702295
	mul rcx
	mov r10, rdx
	cmp r14, r9
	adc r10, rsi
	xor r14d, r14d
	add r8, r10
	setb r14b
	add byte [rsp + 104], 255
	adc r8, qword [rsp + 256]
	setb r12b
	mov rsi, 3064711249896130499
	mov r15, qword [rsp + 144]
	imul rsi, r15
	mov qword [rsp + 32], rsi
	mov rax, qword [rsp + 64]
	mov rcx, 7435674573564081700
	mul rcx
	mov rcx, rdx
	mov rax, qword [rsp + 264]
	cmp qword [rsp + 56], rax
	adc rcx, rsi
	xor ebp, ebp
	add rbx, rcx
	mov qword [rsp + 16], rbx
	setb bpl
	add byte [rsp + 24], 255
	adc rbp, r8
	setb byte [rsp + 24]
	movzx esi, byte [rsp + 120]
	mov eax, esi
	add al, 255
	mov r9, qword [rsp + 128]
	mov rax, r9
	adc rax, 0
	setb bl
	mov rax, qword [rsp + 112]
	mul qword [rsp + 288]
	mov r8, rax
	add sil, 255
	adc r8, r9
	movzx ebx, bl
	adc rbx, rdx
	add r13b, 255
	adc r14, rdi
	setb r13b
	mov rax, qword [rsp + 48]
	mov rdx, 1873798617647539866
	mul rdx
	mov r9, rdx
	cmp r10, qword [rsp + 8]
	adc r9, 0
	cmp rdi, r11
	mov r10, rbx
	adc r10, 0
	add r9, r14
	movzx eax, r13b
	adc r10, rax
	add r12b, 255
	adc r9, r8
	adc r10, 0
	mov r8, 2995800253092329851
	imul r8, r15
	mov r13, qword [rsp + 64]
	mov rax, r13
	mov r14, 7239337960414712511
	mul r14
	mov rdi, rdx
	cmp rcx, qword [rsp + 32]
	adc rdi, r8
	mov r11, r8
	xor r8d, r8d
	add rbp, rdi
	setb r8b
	add byte [rsp + 24], 255
	mov r14, qword [rsp + 160]
	adc r8, r9
	setb r9b
	mov rax, 326064518108171314
	imul r15, rax
	mov rax, r13
	mov r12, 5412103778470702295
	mul r12
	mov rcx, rdx
	cmp rdi, r11
	adc rcx, r15
	xor edi, edi
	add r8, rcx
	setb dil
	add r9b, 255
	adc rdi, r10
	setb r9b
	xor r11d, r11d
	cmp r10, rbx
	setb r11b
	mov rax, r13
	mov r13, 1873798617647539866
	mul r13
	cmp rcx, r15
	adc rdx, 0
	movzx eax, r9b
	add rdx, rdi
	adc rax, r11
	xor ecx, ecx
	mov rsi, qword [rsp + 40]
	mov r9, rsi
	mov rdi, 2210141511517208575
	sub r9, rdi
	mov r10d, 0
	sbb r10, r10
	mov rdi, -5044313057631688021
	mov r13, r14
	cmp r14, rdi
	mov rdi, r9
	sbb rdi, 0
	cmp r9, rdi
	sbb r10, 0
	mov r15, qword [rsp + 16]
	mov r9, r15
	mov r11, 7435674573564081700
	sub r9, r11
	mov r11d, 0
	sbb r11, r11
	add r10, r9
	cmp r9, r10
	sbb r11, 0
	mov r9, rbp
	mov rbx, 7239337960414712511
	sub r9, rbx
	mov ebx, 0
	sbb rbx, rbx
	add r11, r9
	cmp r9, r11
	sbb rbx, 0
	mov r9, r8
	sub r9, r12
	mov r14d, 0
	sbb r14, r14
	add rbx, r9
	cmp r9, rbx
	sbb r14, 0
	mov r12, rdx
	mov r9, 1873798617647539866
	sub r12, r9
	sbb rcx, rcx
	lea r9, [r14 + r12]
	mov r14, r15
	cmp r12, r9
	sbb rcx, 0
	add rcx, rax
	cmp rax, rcx
	cmovb rdi, rsi
	cmovae r14, r10
	cmovae rbp, r11
	cmovae r8, rbx
	mov rbx, qword [rsp + 384]
	test rbx, rbx
	je .LBB0_32
	mov r10, 5044313057631688021
	add r10, r13
	cmp rax, rcx
	cmovb r10, r13
	mov r11, qword [rsp + 376]
	mov qword [r11], r10
	cmp rbx, 1
	je .LBB0_33
	mov r10, r11
	mov qword [r11 + 8], rdi
	cmp rbx, 2
	jbe .LBB0_34
	mov qword [r10 + 16], r14
	cmp rbx, 3
	je .LBB0_35
	mov qword [r10 + 24], rbp
	cmp rbx, 4
	jbe .LBB0_36
	mov qword [r10 + 32], r8
	cmp rbx, 5
	je .LBB0_37
	cmp rax, rcx
	cmovb r9, rdx
	mov qword [r10 + 40], r9
	add rsp, 392
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

	mov edx, offset .Lalloc_e8cac02189bd7a405ad2b53622fe1143
	jmp .LBB0_20
	mov edi, 1
	mov esi, 1
	mov edx, offset .Lalloc_d7ce3f885025317e6a164d2c73057b7e
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 2
	mov esi, 2
	mov edx, offset .Lalloc_703bb6b668b15acef845aa09977de9fb
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 3
	mov esi, 3
	mov edx, offset .Lalloc_2ea0f783860f66f46ef03abfee65112d
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 4
	mov esi, 4
	mov edx, offset .Lalloc_9d33bc96039359bb93aaabf29c608d9f
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 5
	mov esi, 5
	mov edx, offset .Lalloc_efdd8329b16de238fd8a71e95fa454a5
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edx, offset .Lalloc_16a1a84875f44f130dabe943ef01f2d2
	jmp .LBB0_20
	mov edi, 1
	mov esi, 1
	mov edx, offset .Lalloc_cc34f355ecc6068278e267b40d47643f
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 2
	mov esi, 2
	mov edx, offset .Lalloc_9ca61acb6ce6e3bcbb5e5764f26377e8
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 3
	mov esi, 3
	mov edx, offset .Lalloc_326e6c60a4fd64f7e077cd0a9e4770c3
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 4
	mov esi, 4
	mov edx, offset .Lalloc_708af0fdb1c7a53dc0651d482901f26d
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 5
	mov esi, 5
	mov edx, offset .Lalloc_9ae28ae489bfab987f81ba2e958394d1
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edx, offset .Lalloc_e58e1a0b27ac165d9154a40fb6f20cdf
	xor edi, edi
	xor esi, esi
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 1
	mov esi, 1
	mov edx, offset .Lalloc_9ee9b07be7eb7b0fc9be04f91383faf6
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 2
	mov esi, 2
	mov edx, offset .Lalloc_e5dee71d315257586b56d094d418b0c1
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 3
	mov esi, 3
	mov edx, offset .Lalloc_b77e677c38ad01440c91282a19c41f79
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 4
	mov esi, 4
	mov edx, offset .Lalloc_45931150e230eac558bb17f0c291b01c
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
	mov edi, 5
	mov esi, 5
	mov edx, offset .Lalloc_f909be82e69270cbafd144449ab946cd
	call qword [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
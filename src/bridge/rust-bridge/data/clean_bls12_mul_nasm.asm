SECTION .text
GLOBAL clean_bls12_mul_nasm
bls12_mul:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 224
	mov qword [rsp - 88], rdx
	mov qword [rsp + 216], rdi
	mov r12, qword [rdx]
	mov qword [rsp - 72], r8
	mov rdi, qword [r8]
	mov qword [rsp - 112], rdi
	mov rcx, qword [r8 + 8]
	mov qword [rsp + 112], rcx
	mov rbp, qword [r8 + 16]
	mov rax, rbp
	mov qword [rsp + 120], rbp
	mul r12
	mov qword [rsp - 104], rdx
	mov rsi, rax
	mov rax, rcx
	mul r12
	mov rcx, rdx
	mov r14, rax
	mov rax, rdi
	mul r12
	mov rdi, rdx
	mov rdx, -8506173809081122819
	mov r9, rax
	mov rbx, rax
	imul rbx, rdx
	mov qword [rsp - 56], rbx
	mov rax, 5532603552561700244
	mov r8, r9
	imul r8, rax
	mov rax, 436827220531937283
	mov r10, r9
	mov r13, r9
	mov qword [rsp - 80], r9
	imul r10, rax
	mov rdx, 2210141511517208575
	mov rax, rbx
	mul rdx
	mov r15, rdx
	mov rdx, -5044313057631688021
	mov rax, rbx
	mul rdx
	mov r9, rdx
	add r9, r10
	adc r15, r8
	xor eax, eax
	test r13, r13
	setne al
	add rdi, r14
	adc rcx, rsi
	setb r11b
	lea rdx, [rdi + rax]
	xor ebx, ebx
	add r9, rdx
	setb bl
	add rdi, rax
	adc rbx, rcx
	setb r10b
	mov rcx, qword [rsp - 72]
	mov rax, qword [rcx + 32]
	mov qword [rsp + 16], rax
	mov qword [rsp + 32], r12
	mul r12
	mov qword [rsp - 120], rax
	mov qword [rsp + 96], rdx
	mov rax, qword [rcx + 24]
	mov qword [rsp + 8], rax
	mul r12
	mov r12, rax
	mov r13, rdx
	mov rax, qword [rsp - 88]
	mov rcx, qword [rax + 8]
	mov qword [rsp + 104], rcx
	mov rax, rbp
	mul rcx
	mov qword [rsp - 96], rdx
	mov rbp, rax
	mov rax, qword [rsp + 112]
	mul rcx
	mov rsi, rdx
	mov rdi, rax
	mov rax, qword [rsp - 112]
	mul rcx
	mov rcx, rax
	mov r14, rdx
	add r14, rdi
	adc rsi, rbp
	setb byte [rsp - 64]
	add r11b, 255
	adc r12, qword [rsp - 104]
	adc r13, qword [rsp - 120]
	mov qword [rsp - 104], r13
	setb byte [rsp - 122]
	xor edi, edi
	mov rbp, rbx
	add rbp, r15
	setb dil
	add r10b, 255
	adc rdi, r12
	setb byte [rsp - 120]
	mov rax, 3064711249896130499
	mov r13, qword [rsp - 80]
	imul r13, rax
	mov rdx, 7435674573564081700
	mov rax, qword [rsp - 56]
	mul rdx
	mov r10, rdx
	cmp r15, r8
	adc r10, r13
	xor r8d, r8d
	add rdi, r10
	setb r8b
	mov rax, r9
	add rax, rcx
	adc rbx, r15
	add r9, rcx
	adc rbp, r14
	lea rbx, [rbx + r14]
	adc rdi, rsi
	setb byte [rsp + 24]
	mov rcx, r9
	mov rax, -8506173809081122819
	imul rcx, rax
	mov qword [rsp], rcx
	mov r14, r9
	mov rax, 5532603552561700244
	imul r14, rax
	mov rsi, r9
	mov r15, r9
	mov rax, 436827220531937283
	imul rsi, rax
	mov rax, rcx
	mov rdx, 2210141511517208575
	mul rdx
	mov r9, rdx
	mov rax, rcx
	mov rcx, -5044313057631688021
	mul rcx
	mov r11, rdx
	add r11, rsi
	adc r9, r14
	xor eax, eax
	test r15, r15
	mov qword [rsp - 8], r15
	setne al
	lea rdx, [rbx + rax]
	xor r12d, r12d
	add r11, rdx
	setb r12b
	add rbx, rax
	adc r12, rdi
	setb bpl
	mov rax, qword [rsp + 16]
	mov rcx, qword [rsp + 104]
	mul rcx
	mov qword [rsp + 200], rdx
	mov rdi, rax
	mov rax, qword [rsp + 8]
	mul rcx
	mov rsi, rax
	add byte [rsp - 64], 255
	adc rsi, qword [rsp - 96]
	adc rdx, rdi
	mov qword [rsp + 80], rdx
	setb byte [rsp + 192]
	add byte [rsp - 120], 255
	adc r8, qword [rsp - 104]
	setb byte [rsp - 16]
	mov rax, 2995800253092329851
	mov rdi, qword [rsp - 80]
	imul rdi, rax
	mov qword [rsp - 24], rdi
	mov rcx, 7239337960414712511
	mov rax, qword [rsp - 56]
	mul rcx
	cmp r10, r13
	adc rdx, rdi
	mov qword [rsp - 32], rdx
	xor ebx, ebx
	add r8, rdx
	setb bl
	add byte [rsp + 24], 255
	adc r8, rsi
	setb byte [rsp + 56]
	xor ecx, ecx
	mov rsi, r12
	add rsi, r9
	setb cl
	add bpl, 255
	adc rcx, r8
	setb byte [rsp - 40]
	mov rax, 3064711249896130499
	imul r15, rax
	mov qword [rsp - 48], r15
	mov rax, qword [rsp]
	mov rdx, 7435674573564081700
	mul rdx
	cmp r9, r14
	adc rdx, r15
	mov rbp, rdx
	mov qword [rsp + 160], rdx
	mov rax, qword [rsp - 88]
	mov r8, qword [rax + 16]
	mov rax, qword [rsp - 112]
	mul r8
	mov rdi, rax
	mov r13, rdx
	mov r10, r11
	add r10, rax
	adc r12, r9
	mov r9, r10
	mov rax, -8506173809081122819
	imul r9, rax
	mov qword [rsp - 120], r9
	mov rax, r10
	mov rdx, 5532603552561700244
	imul rax, rdx
	mov r14, rax
	mov qword [rsp + 48], rax
	mov rax, 436827220531937283
	imul r10, rax
	mov rax, r9
	mov rdx, 2210141511517208575
	mul rdx
	mov r15, rdx
	mov rax, r9
	mov rdx, -5044313057631688021
	mul rdx
	mov r9, rdx
	add r9, r10
	adc r15, r14
	mov qword [rsp + 176], r15
	xor r15d, r15d
	add rcx, rbp
	setb r15b
	mov r14, qword [rsp + 120]
	mov rax, r14
	mul r8
	mov qword [rsp - 104], rdx
	mov rbp, rax
	mov r10, qword [rsp + 112]
	mov rax, r10
	mul r8
	add rax, r13
	adc rdx, rbp
	setb bpl
	add r11, rdi
	mov qword [rsp - 64], r11
	lea rdi, [r12 + rax]
	adc rax, rsi
	adc rdx, rcx
	setb byte [rsp - 125]
	xor eax, eax
	test r11, r11
	setne al
	lea rsi, [rdi + rax]
	xor r13d, r13d
	add r9, rsi
	mov qword [rsp - 96], r9
	setb r13b
	add rdi, rax
	adc r13, rdx
	setb byte [rsp + 40]
	mov rax, qword [rsp + 16]
	mov qword [rsp + 208], r8
	mul r8
	mov qword [rsp + 88], rdx
	mov rsi, rax
	mov rax, qword [rsp + 8]
	mul r8
	mov rdi, rax
	mov r8, rdx
	mov rax, qword [rsp - 88]
	mov rcx, qword [rax + 24]
	mov qword [rsp + 24], rcx
	mov rax, r14
	mul rcx
	mov qword [rsp + 64], rdx
	mov r9, rax
	mov rax, r10
	mul rcx
	mov r11, rdx
	mov r10, rax
	mov rax, qword [rsp - 112]
	mul rcx
	mov qword [rsp + 128], rax
	mov r14, rdx
	add r14, r10
	adc r11, r9
	mov qword [rsp + 144], r11
	setb byte [rsp - 124]
	add bpl, 255
	adc rdi, qword [rsp - 104]
	adc r8, rsi
	mov qword [rsp + 72], r8
	setb byte [rsp - 123]
	movzx r9d, byte [rsp - 122]
	mov eax, r9d
	add al, 255
	mov r8, qword [rsp + 96]
	mov rax, r8
	adc rax, 0
	mov rax, qword [rsp - 72]
	mov rax, qword [rax + 40]
	mov qword [rsp - 104], rax
	setb sil
	mul qword [rsp + 32]
	add r9b, 255
	adc rax, r8
	movzx ecx, sil
	adc rcx, rdx
	mov qword [rsp + 184], rcx
	add byte [rsp - 16], 255
	adc rbx, rax
	setb byte [rsp - 16]
	mov rax, 326064518108171314
	mov rcx, qword [rsp - 80]
	imul rcx, rax
	mov qword [rsp - 80], rcx
	mov rdx, 5412103778470702295
	mov rax, qword [rsp - 56]
	mul rdx
	mov rax, qword [rsp - 32]
	cmp rax, qword [rsp - 24]
	adc rdx, rcx
	mov qword [rsp + 152], rdx
	xor ebp, ebp
	add rbx, rdx
	setb bpl
	add byte [rsp + 56], 255
	adc rbx, qword [rsp + 80]
	setb byte [rsp + 168]
	add byte [rsp - 40], 255
	adc r15, rbx
	setb byte [rsp - 24]
	mov rcx, qword [rsp - 8]
	mov rax, 2995800253092329851
	imul rcx, rax
	mov qword [rsp - 40], rcx
	mov rax, qword [rsp]
	mov rdx, 7239337960414712511
	mul rdx
	mov rax, qword [rsp + 160]
	cmp rax, qword [rsp - 48]
	adc rdx, rcx
	mov qword [rsp - 48], rdx
	xor r12d, r12d
	add r15, rdx
	setb r12b
	add byte [rsp - 125], 255
	adc r15, rdi
	setb byte [rsp - 32]
	xor r9d, r9d
	mov rsi, r13
	mov rcx, qword [rsp + 176]
	add rsi, rcx
	setb r9b
	add byte [rsp + 40], 255
	adc r9, r15
	setb byte [rsp - 125]
	mov r8, qword [rsp - 64]
	mov rax, 3064711249896130499
	imul r8, rax
	mov qword [rsp + 40], r8
	mov rax, qword [rsp - 120]
	mov rdx, 7435674573564081700
	mul rdx
	mov rdi, rdx
	cmp rcx, qword [rsp + 48]
	adc rdi, r8
	mov r11, qword [rsp - 96]
	mov rbx, r11
	mov r10, qword [rsp + 128]
	add rbx, r10
	adc r13, rcx
	mov r8, rbx
	mov rax, -8506173809081122819
	imul r8, rax
	mov qword [rsp + 32], r8
	mov rdx, rbx
	mov rax, 5532603552561700244
	imul rdx, rax
	mov r15, rdx
	mov qword [rsp + 56], rdx
	mov rax, 436827220531937283
	imul rbx, rax
	mov rax, r8
	mov rdx, 2210141511517208575
	mul rdx
	mov rcx, rdx
	mov rax, r8
	mov rdx, -5044313057631688021
	mul rdx
	add rdx, rbx
	mov r8, rdx
	adc rcx, r15
	mov qword [rsp + 136], rcx
	xor r15d, r15d
	add r9, rdi
	setb r15b
	add r11, r10
	mov qword [rsp - 96], r11
	adc rsi, r14
	lea rax, [r13 + r14]
	adc r9, qword [rsp + 144]
	setb r10b
	xor ecx, ecx
	test r11, r11
	setne cl
	lea rdx, [rax + rcx]
	xor esi, esi
	add r8, rdx
	mov qword [rsp - 72], r8
	setb sil
	add rax, rcx
	adc rsi, r9
	setb r11b
	mov rax, qword [rsp + 16]
	mov r8, qword [rsp + 24]
	mul r8
	mov qword [rsp + 96], rdx
	mov rcx, rax
	mov rax, qword [rsp + 8]
	mul r8
	mov r9, rax
	add byte [rsp - 124], 255
	adc r9, qword [rsp + 64]
	adc rdx, rcx
	mov qword [rsp + 80], rdx
	setb byte [rsp - 122]
	movzx r14d, byte [rsp + 192]
	mov eax, r14d
	add al, 255
	mov r8, qword [rsp + 200]
	mov rax, r8
	adc rax, 0
	setb bl
	mov rax, qword [rsp - 104]
	mul qword [rsp + 104]
	mov rcx, rax
	add r14b, 255
	adc rcx, r8
	movzx eax, bl
	adc rax, rdx
	mov r8, rax
	mov qword [rsp + 64], rax
	add byte [rsp - 16], 255
	adc rbp, qword [rsp + 184]
	setb bl
	mov rdx, 1873798617647539866
	mov rax, qword [rsp - 56]
	mul rdx
	mov rax, qword [rsp + 152]
	cmp rax, qword [rsp - 80]
	adc rdx, 0
	add rdx, rbp
	movzx eax, bl
	adc rax, r8
	add byte [rsp + 168], 255
	adc rdx, rcx
	adc rax, 0
	mov qword [rsp - 16], rax
	add byte [rsp - 24], 255
	adc r12, rdx
	setb byte [rsp + 184]
	mov rcx, qword [rsp - 8]
	mov rax, 326064518108171314
	imul rcx, rax
	mov qword [rsp - 8], rcx
	mov rax, qword [rsp]
	mov rdx, 5412103778470702295
	mul rdx
	mov rax, qword [rsp - 48]
	cmp rax, qword [rsp - 40]
	adc rdx, rcx
	mov qword [rsp + 160], rdx
	xor eax, eax
	add r12, rdx
	setb al
	mov qword [rsp + 152], rax
	add byte [rsp - 32], 255
	adc r12, qword [rsp + 72]
	setb byte [rsp - 48]
	add byte [rsp - 125], 255
	adc r15, r12
	setb byte [rsp - 24]
	mov r8, qword [rsp - 64]
	mov rax, 2995800253092329851
	imul r8, rax
	mov qword [rsp - 40], r8
	mov rax, qword [rsp - 120]
	mov rcx, 7239337960414712511
	mul rcx
	cmp rdi, qword [rsp + 40]
	adc rdx, r8
	mov qword [rsp + 48], rdx
	xor ebx, ebx
	add r15, rdx
	setb bl
	add r10b, 255
	adc r15, r9
	setb byte [rsp - 32]
	xor r13d, r13d
	mov r14, rsi
	mov rdi, qword [rsp + 136]
	add r14, rdi
	setb r13b
	add r11b, 255
	adc r13, r15
	setb byte [rsp - 124]
	mov rcx, qword [rsp - 96]
	mov rax, 3064711249896130499
	imul rcx, rax
	mov qword [rsp + 176], rcx
	mov rax, qword [rsp + 32]
	mov rdx, 7435674573564081700
	mul rdx
	cmp rdi, qword [rsp + 56]
	mov r10, rdi
	adc rdx, rcx
	mov r15, rdx
	mov qword [rsp + 144], rdx
	mov rax, qword [rsp - 88]
	mov rcx, qword [rax + 32]
	mov rax, qword [rsp - 112]
	mul rcx
	mov rdi, rax
	mov r12, rdx
	mov r8, qword [rsp - 72]
	mov r9, r8
	add r9, rax
	adc rsi, r10
	mov r10, r9
	mov rax, -8506173809081122819
	imul r10, rax
	mov qword [rsp - 56], r10
	mov rdx, r9
	mov rax, 5532603552561700244
	imul rdx, rax
	mov r11, rdx
	mov qword [rsp + 168], rdx
	mov rax, 436827220531937283
	imul r9, rax
	mov rax, r10
	mov rdx, 2210141511517208575
	mul rdx
	mov rbp, rdx
	mov rax, r10
	mov rdx, -5044313057631688021
	mul rdx
	mov r10, rdx
	add r10, r9
	adc rbp, r11
	mov qword [rsp + 40], rbp
	xor r11d, r11d
	add r13, r15
	setb r11b
	mov r15, qword [rsp + 120]
	mov rax, r15
	mul rcx
	mov qword [rsp + 72], rdx
	mov rbp, rax
	mov r9, qword [rsp + 112]
	mov rax, r9
	mul rcx
	add rax, r12
	adc rdx, rbp
	setb bpl
	add r8, rdi
	mov qword [rsp - 72], r8
	lea rsi, [rsi + rax]
	adc rax, r14
	adc rdx, r13
	setb byte [rsp + 128]
	xor eax, eax
	test r8, r8
	setne al
	lea r8, [rsi + rax]
	xor edi, edi
	add r10, r8
	mov qword [rsp - 80], r10
	setb dil
	add rsi, rax
	adc rdi, rdx
	mov rax, qword [rsp - 88]
	mov r8, qword [rax + 40]
	mov qword [rsp + 104], r8
	setb byte [rsp - 121]
	mov rax, qword [rsp + 16]
	mov qword [rsp + 192], rcx
	mul rcx
	mov qword [rsp + 200], rdx
	mov r14, rax
	mov rax, qword [rsp + 8]
	mul rcx
	mov rcx, rdx
	mov rsi, rax
	mov rax, r15
	mul r8
	mov qword [rsp + 56], rdx
	mov r10, rax
	mov rax, r9
	mul r8
	mov r9, rdx
	mov r13, rax
	mov rax, qword [rsp - 112]
	mul r8
	mov r8, rax
	add rdx, r13
	mov qword [rsp - 88], rdx
	adc r9, r10
	mov qword [rsp - 112], r9
	setb byte [rsp - 125]
	add bpl, 255
	adc rsi, qword [rsp + 72]
	adc rcx, r14
	mov qword [rsp + 72], rcx
	setb byte [rsp + 112]
	movzx ecx, byte [rsp - 123]
	mov eax, ecx
	add al, 255
	mov r14, qword [rsp + 88]
	mov rax, r14
	adc rax, 0
	setb r10b
	mov rax, qword [rsp - 104]
	mul qword [rsp + 208]
	mov r9, rax
	add cl, 255
	adc r9, r14
	movzx r15d, r10b
	adc r15, rdx
	mov qword [rsp + 136], r15
	add byte [rsp + 184], 255
	mov rcx, qword [rsp - 16]
	mov r12, qword [rsp + 152]
	adc r12, rcx
	setb r14b
	mov rax, qword [rsp]
	mov rdx, 1873798617647539866
	mul rdx
	mov rax, qword [rsp + 160]
	cmp rax, qword [rsp - 8]
	adc rdx, 0
	cmp rcx, qword [rsp + 64]
	adc r15, 0
	add rdx, r12
	movzx eax, r14b
	adc r15, rax
	add byte [rsp - 48], 255
	adc rdx, r9
	adc r15, 0
	add byte [rsp - 24], 255
	adc rbx, rdx
	setb byte [rsp - 48]
	mov rcx, qword [rsp - 64]
	mov rax, 326064518108171314
	imul rcx, rax
	mov qword [rsp - 64], rcx
	mov rax, qword [rsp - 120]
	mov rdx, 5412103778470702295
	mul rdx
	mov rax, qword [rsp + 48]
	cmp rax, qword [rsp - 40]
	adc rdx, rcx
	mov qword [rsp - 40], rdx
	xor r14d, r14d
	add rbx, rdx
	setb r14b
	add byte [rsp - 32], 255
	adc rbx, qword [rsp + 80]
	setb byte [rsp + 64]
	add byte [rsp - 124], 255
	adc r11, rbx
	setb byte [rsp + 88]
	mov r9, qword [rsp - 96]
	mov rax, 2995800253092329851
	imul r9, rax
	mov qword [rsp + 80], r9
	mov rax, qword [rsp + 32]
	mov rcx, 7239337960414712511
	mul rcx
	mov rax, qword [rsp + 144]
	cmp rax, qword [rsp + 176]
	adc rdx, r9
	mov qword [rsp - 16], rdx
	xor r10d, r10d
	add r11, rdx
	setb r10b
	add byte [rsp + 128], 255
	adc r11, rsi
	setb byte [rsp - 123]
	xor esi, esi
	mov r12, rdi
	mov r9, rdi
	mov rbx, qword [rsp + 40]
	add r9, rbx
	setb sil
	add byte [rsp - 121], 255
	adc rsi, r11
	setb byte [rsp - 24]
	mov rcx, qword [rsp - 72]
	mov rax, 3064711249896130499
	imul rcx, rax
	mov qword [rsp - 32], rcx
	mov rax, qword [rsp - 56]
	mov rdx, 7435674573564081700
	mul rdx
	cmp rbx, qword [rsp + 168]
	adc rdx, rcx
	mov rcx, rdx
	mov rbp, qword [rsp - 80]
	mov r11, rbp
	mov rdi, r8
	add r11, r8
	adc r12, rbx
	mov r8, r12
	mov rbx, -8506173809081122819
	imul rbx, r11
	mov qword [rsp], rbx
	mov r13, 5532603552561700244
	imul r13, r11
	mov qword [rsp + 120], r13
	mov rax, 436827220531937283
	imul r11, rax
	mov rax, rbx
	mov rdx, 2210141511517208575
	mul rdx
	mov r12, rdx
	mov rax, rbx
	mov rdx, -5044313057631688021
	mul rdx
	add rdx, r11
	mov rbx, rdx
	adc r12, r13
	mov qword [rsp - 8], r12
	xor r11d, r11d
	add rsi, rcx
	setb r11b
	mov r12, rbp
	add r12, rdi
	mov qword [rsp - 80], r12
	mov rax, qword [rsp - 88]
	adc r9, rax
	lea rax, [r8 + rax]
	adc rsi, qword [rsp - 112]
	setb r13b
	xor edx, edx
	test r12, r12
	setne dl
	lea rdi, [rax + rdx]
	xor r8d, r8d
	add rbx, rdi
	mov qword [rsp - 88], rbx
	setb r8b
	add rax, rdx
	adc r8, rsi
	mov qword [rsp - 112], r8
	setb byte [rsp + 48]
	mov rax, qword [rsp + 16]
	mov rdi, qword [rsp + 104]
	mul rdi
	mov qword [rsp + 16], rdx
	mov rsi, rax
	mov rax, qword [rsp + 8]
	mul rdi
	mov r9, rax
	add byte [rsp - 125], 255
	adc r9, qword [rsp + 56]
	adc rdx, rsi
	mov qword [rsp + 208], rdx
	setb byte [rsp + 8]
	movzx r8d, byte [rsp - 122]
	mov eax, r8d
	add al, 255
	mov rdi, qword [rsp + 96]
	mov rax, rdi
	adc rax, 0
	setb sil
	mov rax, qword [rsp - 104]
	mul qword [rsp + 24]
	mov r12, rax
	add r8b, 255
	adc r12, rdi
	movzx esi, sil
	adc rsi, rdx
	mov qword [rsp + 24], rsi
	add byte [rsp - 48], 255
	adc r14, r15
	setb dil
	mov rax, qword [rsp - 120]
	mov rdx, 1873798617647539866
	mul rdx
	mov rax, qword [rsp - 40]
	cmp rax, qword [rsp - 64]
	adc rdx, 0
	cmp r15, qword [rsp + 136]
	adc rsi, 0
	add rdx, r14
	movzx eax, dil
	adc rsi, rax
	add byte [rsp + 64], 255
	adc rdx, r12
	adc rsi, 0
	add byte [rsp + 88], 255
	adc r10, rdx
	setb bl
	mov rax, 326064518108171314
	mov rdi, qword [rsp - 96]
	imul rdi, rax
	mov qword [rsp - 96], rdi
	mov rax, qword [rsp + 32]
	mov rdx, 5412103778470702295
	mul rdx
	mov r12, rdx
	mov rax, qword [rsp - 16]
	cmp rax, qword [rsp + 80]
	adc r12, rdi
	xor ebp, ebp
	add r10, r12
	setb bpl
	add byte [rsp - 123], 255
	adc r10, qword [rsp + 72]
	setb byte [rsp + 88]
	add byte [rsp - 24], 255
	adc r11, r10
	setb byte [rsp - 120]
	mov r8, qword [rsp - 72]
	mov rax, 2995800253092329851
	imul r8, rax
	mov r15, qword [rsp - 56]
	mov rax, r15
	mov rdx, 7239337960414712511
	mul rdx
	mov r14, rdx
	cmp rcx, qword [rsp - 32]
	adc r14, r8
	xor r10d, r10d
	add r11, r14
	setb r10b
	add r13b, 255
	adc r11, r9
	setb byte [rsp + 96]
	xor r13d, r13d
	mov rax, qword [rsp - 8]
	add qword [rsp - 112], rax
	setb r13b
	add byte [rsp + 48], 255
	adc r13, r11
	setb byte [rsp - 64]
	movzx r11d, byte [rsp + 112]
	mov eax, r11d
	add al, 255
	mov rcx, qword [rsp + 200]
	mov rax, rcx
	adc rax, 0
	setb dil
	mov rax, qword [rsp - 104]
	mul qword [rsp + 192]
	mov r9, rax
	add r11b, 255
	adc r9, rcx
	movzx r11d, dil
	adc r11, rdx
	add bl, 255
	adc rbp, rsi
	setb bl
	mov rax, qword [rsp + 32]
	mov rcx, 1873798617647539866
	mul rcx
	cmp r12, qword [rsp - 96]
	adc rdx, 0
	cmp rsi, qword [rsp + 24]
	mov rsi, r11
	adc rsi, 0
	add rdx, rbp
	movzx eax, bl
	adc rsi, rax
	add byte [rsp + 88], 255
	adc rdx, r9
	adc rsi, 0
	add byte [rsp - 120], 255
	adc r10, rdx
	setb bpl
	mov rdi, qword [rsp - 72]
	mov rax, 326064518108171314
	imul rdi, rax
	mov qword [rsp - 72], rdi
	mov rax, r15
	mov rcx, 5412103778470702295
	mul rcx
	mov r9, rdx
	cmp r14, r8
	adc r9, rdi
	xor r14d, r14d
	add r10, r9
	setb r14b
	add byte [rsp + 96], 255
	adc r10, qword [rsp + 208]
	setb r12b
	mov rdi, 3064711249896130499
	imul rdi, qword [rsp - 80]
	mov qword [rsp - 120], rdi
	mov rax, qword [rsp]
	mov rcx, 7435674573564081700
	mul rcx
	mov rcx, rdx
	mov rax, qword [rsp + 120]
	cmp qword [rsp - 8], rax
	adc rcx, rdi
	xor edi, edi
	add r13, rcx
	setb dil
	add byte [rsp - 64], 255
	adc rdi, r10
	setb byte [rsp - 96]
	movzx r15d, byte [rsp + 8]
	mov eax, r15d
	add al, 255
	mov r8, qword [rsp + 16]
	mov rax, r8
	adc rax, 0
	setb bl
	mov rax, qword [rsp - 104]
	mul qword [rsp + 104]
	mov r10, rax
	add r15b, 255
	adc r10, r8
	movzx r15d, bl
	adc r15, rdx
	add bpl, 255
	adc r14, rsi
	setb bl
	mov rax, qword [rsp - 56]
	mov rbp, 1873798617647539866
	mul rbp
	mov r8, rdx
	cmp r9, qword [rsp - 72]
	adc r8, 0
	cmp rsi, r11
	mov r11, r15
	adc r11, 0
	add r8, r14
	movzx eax, bl
	adc r11, rax
	add r12b, 255
	adc r8, r10
	adc r11, 0
	mov r9, 2995800253092329851
	mov r14, qword [rsp - 80]
	imul r9, r14
	mov rbx, qword [rsp]
	mov rax, rbx
	mov r12, 7239337960414712511
	mul r12
	mov rsi, rdx
	cmp rcx, qword [rsp - 120]
	adc rsi, r9
	mov r10, r9
	xor r9d, r9d
	add rdi, rsi
	setb r9b
	add byte [rsp - 96], 255
	adc r9, r8
	setb r8b
	mov rax, 326064518108171314
	imul r14, rax
	mov rax, rbx
	mov r12, 5412103778470702295
	mul r12
	mov rcx, rdx
	cmp rsi, r10
	adc rcx, r14
	xor esi, esi
	add r9, rcx
	setb sil
	add r8b, 255
	adc rsi, r11
	setb r8b
	xor r10d, r10d
	cmp r11, r15
	setb r10b
	mov rax, rbx
	mul rbp
	cmp rcx, r14
	adc rdx, 0
	add rdx, rsi
	movzx r8d, r8b
	adc r8, r10
	xor ecx, ecx
	mov r10, qword [rsp - 112]
	mov rax, 2210141511517208575
	sub r10, rax
	mov r11d, 0
	sbb r11, r11
	mov rax, qword [rsp - 88]
	mov rsi, -5044313057631688021
	sub rax, rsi
	mov rsi, r10
	sbb rsi, 0
	cmp r10, rsi
	sbb r11, 0
	mov rbx, r13
	mov r10, 7435674573564081700
	sub rbx, r10
	mov r14d, 0
	sbb r14, r14
	lea r10, [r11 + rbx]
	cmp rbx, r10
	sbb r14, 0
	mov r11, rdi
	mov rbx, 7239337960414712511
	sub r11, rbx
	mov r15d, 0
	sbb r15, r15
	lea rbx, [r14 + r11]
	cmp r11, rbx
	sbb r15, 0
	mov r11, r9
	sub r11, r12
	mov r12d, 0
	sbb r12, r12
	lea r14, [r15 + r11]
	cmp r11, r14
	sbb r12, 0
	mov r15, rdx
	sub r15, rbp
	mov ebp, 0
	sbb rbp, rbp
	lea r11, [r12 + r15]
	cmp r15, r11
	sbb rbp, 0
	add rbp, r8
	cmp r8, rbp
	mov r12d, 0
	sbb r12, r12
	cmp r8, rbp
	cmovb rsi, rcx
	cmovb r10, rcx
	cmovb rbx, rcx
	cmovb r14, rcx
	cmovb rax, rcx
	cmovb r11, rcx
	mov rcx, qword [rsp - 112]
	and rcx, r12
	or rcx, rsi
	mov rsi, rcx
	and r13, r12
	or r13, r10
	and rdi, r12
	or rdi, rbx
	and r9, r12
	or r9, r14
	mov rcx, qword [rsp - 88]
	and rcx, r12
	or rcx, rax
	mov rax, qword [rsp + 216]
	mov qword [rax], rcx
	mov qword [rax + 8], rsi
	mov qword [rax + 16], r13
	mov qword [rax + 24], rdi
	mov qword [rax + 32], r9
	and r12, rdx
	or r12, r11
	mov qword [rax + 40], r12
	add rsp, 224
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

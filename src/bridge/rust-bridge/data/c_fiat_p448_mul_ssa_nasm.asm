c_fiat_p448_carry_mul:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 848
	mov rcx, qword [rsi + 56]
	mov r13, rsi
	mov rsi, rdx
	mov rax, qword [rdx + 56]
	mov r8, rax
	mov qword [rsp - 88], rax
	mul rcx
	mov qword [rsp - 32], rax
	mov qword [rsp + 120], rdx
	mov rax, qword [rsi + 48]
	mov r10, rax
	mul rcx
	mov qword [rsp + 744], rax
	mov qword [rsp + 752], rdx
	mov rax, qword [rsi + 40]
	mov r9, rsi
	mov qword [rsp - 128], rsi
	mov r15, rax
	mul rcx
	mov r11, rcx
	mov qword [rsp - 120], rcx
	mov qword [rsp + 712], rax
	mov qword [rsp + 728], rdx
	mov r14, qword [r13 + 48]
	mov rax, r14
	mul r8
	mov qword [rsp - 104], rdx
	mov qword [rsp - 112], rax
	mov rax, r14
	mul r10
	mov rcx, rax
	mov rbp, rdx
	mov r12, qword [r13 + 40]
	mov rax, r12
	mul r8
	mov qword [rsp + 648], rax
	mov qword [rsp + 656], rdx
	mov r8, qword [rsi + 32]
	mov rax, r8
	mul r11
	mov qword [rsp + 536], rax
	mov qword [rsp + 544], rdx
	mov rax, qword [rsi + 24]
	mov rsi, rax
	mul r11
	mov qword [rsp + 112], rax
	mov qword [rsp + 840], rdx
	mov rbx, qword [r9 + 16]
	mov rax, rbx
	mov qword [rsp - 72], rbx
	mul r11
	mov qword [rsp + 80], rax
	mov qword [rsp + 88], rdx
	mov rax, qword [r9 + 8]
	mov qword [rsp - 56], rax
	mul r11
	mov qword [rsp + 32], rdx
	mov qword [rsp + 616], rax
	mov rax, r14
	mul r15
	mov qword [rsp + 456], rdx
	mov qword [rsp + 448], rax
	mov rax, r8
	mul r14
	mov qword [rsp + 104], rdx
	mov qword [rsp + 96], rax
	mov qword [rsp - 80], rsi
	mov rax, rsi
	mul r14
	mov qword [rsp + 48], rdx
	mov qword [rsp + 40], rax
	mov rax, rbx
	mul r14
	mov qword [rsp + 8], rdx
	mov qword [rsp - 16], rax
	mov rax, r12
	mov r11, r10
	mul r10
	mov qword [rsp + 408], rdx
	mov qword [rsp + 400], rax
	mov rax, r12
	mul r15
	mov qword [rsp + 520], rdx
	mov qword [rsp + 832], rax
	mov rax, r8
	mov qword [rsp - 96], r8
	mul r12
	mov qword [rsp + 72], rdx
	mov qword [rsp + 768], rax
	mov rax, rsi
	mul r12
	mov qword [rsp + 552], rax
	mov qword [rsp - 24], rdx
	mov rbx, qword [r13 + 32]
	mov rax, rbx
	mov r9, qword [rsp - 88]
	mul r9
	mov qword [rsp + 376], rdx
	mov qword [rsp + 368], rax
	mov rax, rbx
	mul r10
	mov qword [rsp + 824], rdx
	mov qword [rsp + 816], rax
	mov rax, rbx
	mov qword [rsp - 64], r15
	mul r15
	mov qword [rsp + 64], rdx
	mov qword [rsp + 56], rax
	mov rax, rbx
	mul r8
	mov qword [rsp + 16], rax
	mov qword [rsp + 24], rdx
	mov r10, r13
	mov r8, qword [r13 + 24]
	mov rax, r8
	mul r9
	mov qword [rsp + 808], rdx
	mov qword [rsp + 800], rax
	mov rax, r8
	mul r11
	mov qword [rsp - 48], r11
	mov qword [rsp + 696], rdx
	mov qword [rsp + 672], rax
	mov rax, r8
	mul r15
	mov qword [rsp - 8], rax
	mov qword [rsp], rdx
	mov r13, qword [r13 + 16]
	mov qword [rsp - 40], r10
	mov rax, r13
	mul r9
	mov qword [rsp + 640], rdx
	mov qword [rsp + 632], rax
	mov rax, r13
	mul r11
	mov qword [rsp + 488], rax
	mov qword [rsp + 496], rdx
	mov r15, qword [r10 + 8]
	mov rax, r15
	mul r9
	mov qword [rsp + 464], rax
	mov qword [rsp + 472], rdx
	mov rax, qword [rsp - 128]
	mov r10, qword [rax]
	mov rax, r10
	mul qword [rsp - 120]
	mov qword [rsp + 344], rdx
	mov qword [rsp + 336], rax
	mov rsi, qword [rsp - 56]
	mov rax, rsi
	mul r14
	mov qword [rsp + 312], rdx
	mov qword [rsp + 296], rax
	mov rax, r10
	mul r14
	mov qword [rsp + 792], rdx
	mov qword [rsp + 784], rax
	mov r11, qword [rsp - 72]
	mov rax, r11
	mul r12
	mov r9, rdx
	mov qword [rsp - 128], rax
	mov rax, rsi
	mul r12
	mov qword [rsp + 776], rdx
	mov qword [rsp + 760], rax
	mov rax, r10
	mul r12
	mov qword [rsp + 584], rdx
	mov qword [rsp + 576], rax
	mov rax, rbx
	mov r14, qword [rsp - 80]
	mul r14
	mov qword [rsp + 272], rdx
	mov qword [rsp + 264], rax
	mov rax, rbx
	mul r11
	mov r12, r11
	mov qword [rsp + 736], rdx
	mov qword [rsp + 720], rax
	mov rax, rbx
	mul rsi
	mov qword [rsp + 528], rdx
	mov qword [rsp + 480], rax
	mov rax, r10
	mul rbx
	mov qword [rsp + 360], rdx
	mov qword [rsp + 352], rax
	mov rax, r8
	mov r11, qword [rsp - 96]
	mul r11
	mov qword [rsp + 256], rdx
	mov qword [rsp + 248], rax
	mov rax, r8
	mul r14
	mov qword [rsp + 704], rdx
	mov qword [rsp + 680], rax
	mov rax, r8
	mul r12
	mov qword [rsp + 512], rdx
	mov qword [rsp + 504], rax
	mov rax, r8
	mul rsi
	mov qword [rsp + 320], rdx
	mov qword [rsp + 304], rax
	mov rax, r10
	mul r8
	mov qword [rsp + 184], rdx
	mov qword [rsp + 176], rax
	mov rax, r13
	mov r8, qword [rsp - 64]
	mul r8
	mov qword [rsp + 216], rdx
	mov qword [rsp + 208], rax
	mov rax, r13
	mul r11
	mov qword [rsp + 624], rdx
	mov qword [rsp + 608], rax
	mov rax, r13
	mul r14
	mov qword [rsp + 440], rdx
	mov qword [rsp + 432], rax
	mov rax, r13
	mul r12
	mov rbx, r12
	mov qword [rsp + 288], rdx
	mov qword [rsp + 280], rax
	mov rax, r13
	mul rsi
	mov r12, rdx
	mov qword [rsp - 120], rax
	mov rax, r10
	mul r13
	mov qword [rsp + 688], rdx
	mov qword [rsp + 664], rax
	mov rax, r15
	mov r13, qword [rsp - 48]
	mul r13
	mov qword [rsp + 168], rdx
	mov qword [rsp + 160], rax
	mov rax, r15
	mul r8
	mov qword [rsp + 568], rdx
	mov qword [rsp + 560], rax
	mov rax, r15
	mul r11
	mov qword [rsp + 392], rdx
	mov qword [rsp + 384], rax
	mov rax, r15
	mul r14
	mov qword [rsp + 240], rdx
	mov qword [rsp + 232], rax
	mov rax, r15
	mul rbx
	mov r11, rbx
	mov qword [rsp + 136], rdx
	mov qword [rsp + 128], rax
	mov rax, r15
	mul rsi
	mov qword [rsp + 592], rax
	mov qword [rsp + 600], rdx
	mov rax, qword [rsp - 40]
	mov rbx, qword [rax]
	mov rax, r10
	mul r15
	mov qword [rsp + 424], rdx
	mov qword [rsp + 416], rax
	mov rax, rbx
	mul qword [rsp - 88]
	mov qword [rsp + 152], rdx
	mov qword [rsp + 144], rax
	mov rax, rbx
	mul r13
	mov qword [rsp - 40], rdx
	mov qword [rsp - 48], rax
	mov rax, rbx
	mul r8
	mov qword [rsp - 64], rdx
	mov qword [rsp + 328], rax
	mov rax, rbx
	mul qword [rsp - 96]
	mov qword [rsp + 200], rdx
	mov qword [rsp + 192], rax
	mov rax, rbx
	mul r14
	mov r15, rdx
	mov r13, rax
	mov rax, rbx
	mul r11
	mov qword [rsp - 88], rdx
	mov qword [rsp - 96], rax
	mov rax, rbx
	mul rsi
	mov qword [rsp - 72], rdx
	mov qword [rsp - 56], rax
	mov rax, rbx
	mul r10
	mov qword [rsp + 224], rax
	mov qword [rsp - 80], rdx
	mov rdx, qword [rsp + 400]
	add rdx, qword [rsp + 448]
	mov rax, qword [rsp + 408]
	adc rax, qword [rsp + 456]
	add rdx, qword [rsp + 536]
	adc rax, qword [rsp + 544]
	add rdx, qword [rsp + 368]
	adc rax, qword [rsp + 376]
	mov r14, qword [rsp - 120]
	add r14, rdx
	mov r10, rdx
	adc r12, rax
	mov rdx, rax
	add r14, qword [rsp + 128]
	adc r12, qword [rsp + 136]
	add r14, qword [rsp + 176]
	adc r12, qword [rsp + 184]
	add r14, r13
	adc r12, r15
	shld r12, r14, 8
	mov rax, 72057594037927935
	and r14, rax
	mov qword [rsp - 120], r14
	mov r11, rax
	mov rsi, qword [rsp - 128]
	add rsi, qword [rsp + 296]
	adc r9, qword [rsp + 312]
	add rsi, qword [rsp + 264]
	adc r9, qword [rsp + 272]
	add rsi, r10
	adc r9, rdx
	add rsi, qword [rsp + 248]
	adc r9, qword [rsp + 256]
	add rsi, qword [rsp + 208]
	adc r9, qword [rsp + 216]
	add rsi, qword [rsp + 160]
	adc r9, qword [rsp + 168]
	add rsi, qword [rsp + 336]
	adc r9, qword [rsp + 344]
	add rsi, qword [rsp + 144]
	mov rdx, rsi
	adc r9, qword [rsp + 152]
	mov r10, qword [rsp + 120]
	mov rsi, qword [rsp - 32]
	shld r10, rsi, 1
	mov rax, qword [rsp - 112]
	add rax, qword [rsp + 744]
	mov qword [rsp - 112], rax
	mov rax, qword [rsp - 104]
	adc rax, qword [rsp + 752]
	mov qword [rsp - 104], rax
	add rcx, qword [rsp + 712]
	adc rbp, qword [rsp + 728]
	add rcx, qword [rsp + 648]
	adc rbp, qword [rsp + 656]
	shld r9, rdx, 8
	and rdx, r11
	mov qword [rsp - 128], rdx
	mov rsi, rbp
	shld rsi, rcx, 1
	lea rbx, [rcx + rcx]
	mov r15, qword [rsp + 552]
	add rbx, r15
	adc rsi, qword [rsp - 24]
	add rbx, qword [rsp - 16]
	adc rsi, qword [rsp + 8]
	mov r13, qword [rsp + 616]
	add rbx, r13
	adc rsi, qword [rsp + 32]
	add rbx, qword [rsp + 16]
	adc rsi, qword [rsp + 24]
	add rbx, qword [rsp - 8]
	adc rsi, qword [rsp]
	add rbx, qword [rsp + 304]
	adc rsi, qword [rsp + 320]
	mov rdx, qword [rsp + 488]
	add rbx, rdx
	mov rax, qword [rsp + 496]
	adc rsi, rax
	add rbx, qword [rsp + 280]
	adc rsi, qword [rsp + 288]
	mov r14, qword [rsp + 464]
	add rbx, r14
	mov r8, qword [rsp + 472]
	adc rsi, r8
	add rbx, qword [rsp + 232]
	adc rsi, qword [rsp + 240]
	add rbx, qword [rsp + 352]
	adc rsi, qword [rsp + 360]
	add rbx, qword [rsp + 192]
	adc rsi, qword [rsp + 200]
	add rbx, r12
	adc rsi, 0
	add rbx, r9
	adc rsi, 0
	shld rsi, rbx, 8
	and rbx, r11
	add rcx, r15
	adc rbp, qword [rsp - 24]
	add rcx, qword [rsp - 16]
	adc rbp, qword [rsp + 8]
	add rcx, r13
	adc rbp, qword [rsp + 32]
	add rcx, qword [rsp + 16]
	adc rbp, qword [rsp + 24]
	add rcx, qword [rsp - 8]
	adc rbp, qword [rsp]
	add rcx, rdx
	adc rbp, rax
	add rcx, r14
	adc rbp, r8
	add rcx, qword [rsp + 224]
	adc rbp, qword [rsp - 80]
	add rcx, r9
	adc rbp, 0
	mov r11, qword [rsp - 104]
	mov rdx, r11
	mov r15, qword [rsp - 112]
	shld rdx, r15, 1
	lea rax, [r15 + r15]
	mov r9, qword [rsp + 768]
	add rax, r9
	adc rdx, qword [rsp + 72]
	add rax, qword [rsp + 40]
	adc rdx, qword [rsp + 48]
	add rax, qword [rsp + 80]
	adc rdx, qword [rsp + 88]
	add rax, qword [rsp + 56]
	adc rdx, qword [rsp + 64]
	add rax, qword [rsp + 480]
	adc rdx, qword [rsp + 528]
	mov r14, qword [rsp + 672]
	add rax, r14
	mov r8, qword [rsp + 696]
	adc rdx, r8
	add rax, qword [rsp + 504]
	adc rdx, qword [rsp + 512]
	mov r13, qword [rsp + 632]
	add rax, r13
	mov r12, qword [rsp + 640]
	adc rdx, r12
	add rax, qword [rsp + 432]
	adc rdx, qword [rsp + 440]
	add rax, qword [rsp + 384]
	adc rdx, qword [rsp + 392]
	add rax, qword [rsp + 576]
	adc rdx, qword [rsp + 584]
	add rax, qword [rsp + 328]
	adc rdx, qword [rsp - 64]
	add rax, rsi
	adc rdx, 0
	shld rbp, rcx, 8
	mov rsi, 72057594037927935
	and rcx, rsi
	add r15, r9
	adc r11, qword [rsp + 72]
	add r15, qword [rsp + 40]
	adc r11, qword [rsp + 48]
	add r15, qword [rsp + 80]
	adc r11, qword [rsp + 88]
	add r15, qword [rsp + 56]
	adc r11, qword [rsp + 64]
	add r15, r14
	adc r11, r8
	add r15, r13
	adc r11, r12
	add r15, qword [rsp + 416]
	adc r11, qword [rsp + 424]
	add r15, qword [rsp - 56]
	adc r11, qword [rsp - 72]
	add r15, rbp
	mov qword [rsp - 112], r15
	adc r11, 0
	mov r13, r11
	shld rdx, rax, 8
	and rax, rsi
	mov rsi, qword [rsp - 32]
	add rsi, rsi
	mov r15, qword [rsp + 832]
	add rsi, r15
	mov r11, qword [rsp + 520]
	adc r10, r11
	add rsi, qword [rsp + 96]
	adc r10, qword [rsp + 104]
	add rsi, qword [rsp + 112]
	mov rbp, qword [rsp + 840]
	adc r10, rbp
	add rsi, qword [rsp + 760]
	adc r10, qword [rsp + 776]
	mov r14, qword [rsp + 816]
	add rsi, r14
	mov r9, qword [rsp + 824]
	adc r10, r9
	add rsi, qword [rsp + 720]
	adc r10, qword [rsp + 736]
	mov r12, qword [rsp + 800]
	add rsi, r12
	mov r8, qword [rsp + 808]
	adc r10, r8
	add rsi, qword [rsp + 680]
	adc r10, qword [rsp + 704]
	add rsi, qword [rsp + 608]
	adc r10, qword [rsp + 624]
	add rsi, qword [rsp + 560]
	adc r10, qword [rsp + 568]
	add rsi, qword [rsp + 784]
	adc r10, qword [rsp + 792]
	add rsi, qword [rsp - 48]
	adc r10, qword [rsp - 40]
	add rsi, rdx
	adc r10, 0
	mov rdx, qword [rsp - 112]
	shld r13, rdx, 8
	mov qword [rsp - 104], r13
	mov r13, 72057594037927935
	and rdx, r13
	mov r13, rdx
	add r15, qword [rsp - 32]
	adc r11, qword [rsp + 120]
	add r15, qword [rsp + 96]
	adc r11, qword [rsp + 104]
	add r15, qword [rsp + 112]
	adc r11, rbp
	add r15, r14
	adc r11, r9
	add r15, r12
	adc r11, r8
	add r15, qword [rsp + 592]
	adc r11, qword [rsp + 600]
	add r15, qword [rsp + 664]
	adc r11, qword [rsp + 688]
	add r15, qword [rsp - 96]
	adc r11, qword [rsp - 88]
	add r15, qword [rsp - 104]
	adc r11, 0
	shld r10, rsi, 8
	add r10, qword [rsp - 128]
	shld r11, r15, 8
	add r11, qword [rsp - 120]
	mov rdx, r11
	shr rdx, 56
	add rdx, rbx
	mov r9, r10
	shr r9, 56
	add rcx, r9
	add rdx, r9
	mov r9, rdx
	shr r9, 56
	add r9, rax
	mov rax, rcx
	shr rax, 56
	add rax, r13
	mov r8, 72057594037927935
	and rsi, r8
	and r15, r8
	and r10, r8
	and r11, r8
	and rdx, r8
	and rcx, r8
	mov qword [rdi], rcx
	mov qword [rdi + 8], rax
	mov qword [rdi + 16], r15
	mov qword [rdi + 24], r11
	mov qword [rdi + 32], rdx
	mov qword [rdi + 40], r9
	mov qword [rdi + 48], rsi
	mov qword [rdi + 56], r10
	add rsp, 848
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
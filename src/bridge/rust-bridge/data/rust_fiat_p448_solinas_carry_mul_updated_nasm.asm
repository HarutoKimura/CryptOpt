SECTION .text
GLOBAL rust_fiat_p448_solinas_carry_mul_updated_nasm
rust_fiat_p448_solinas_carry_mul:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 848
	mov r9, rdx
	mov rcx, qword [rsi + 56]
	mov r11, rsi
	mov rax, qword [rdx + 56]
	mov rsi, rax
	mov qword [rsp - 96], rax
	mul rcx
	mov qword [rsp - 32], rax
	mov qword [rsp + 120], rdx
	mov rax, qword [r9 + 48]
	mov r8, rax
	mul rcx
	mov qword [rsp + 736], rax
	mov qword [rsp + 752], rdx
	mov rax, qword [r9 + 40]
	mov rbx, rax
	mul rcx
	mov r10, rcx
	mov qword [rsp + 712], rax
	mov qword [rsp + 720], rdx
	mov r14, qword [r11 + 48]
	mov rax, r14
	mul rsi
	mov qword [rsp - 112], rdx
	mov qword [rsp - 120], rax
	mov rax, r14
	mul r8
	mov rcx, rax
	mov rbp, rdx
	mov r12, qword [r11 + 40]
	mov r15, r11
	mov rax, r12
	mul rsi
	mov qword [rsp + 640], rax
	mov qword [rsp + 648], rdx
	mov rsi, qword [r9 + 32]
	mov rax, rsi
	mul r10
	mov qword [rsp + 536], rax
	mov qword [rsp + 544], rdx
	mov rax, qword [r9 + 24]
	mov r13, rax
	mul r10
	mov qword [rsp + 112], rax
	mov qword [rsp + 840], rdx
	mov r11, qword [r9 + 16]
	mov rax, r11
	mov qword [rsp - 72], r11
	mul r10
	mov qword [rsp - 128], r10
	mov qword [rsp + 80], rax
	mov qword [rsp + 88], rdx
	mov rax, qword [r9 + 8]
	mov qword [rsp - 64], rax
	mul r10
	mov qword [rsp + 624], rdx
	mov qword [rsp + 608], rax
	mov rax, r14
	mul rbx
	mov qword [rsp + 464], rdx
	mov qword [rsp + 448], rax
	mov rax, rsi
	mov r10, rsi
	mul r14
	mov qword [rsp + 104], rdx
	mov qword [rsp + 96], rax
	mov qword [rsp - 80], r13
	mov rax, r13
	mul r14
	mov qword [rsp + 48], rdx
	mov qword [rsp + 776], rax
	mov rax, r11
	mul r14
	mov qword [rsp + 16], rdx
	mov qword [rsp - 8], rax
	mov rax, r12
	mov rsi, r8
	mul r8
	mov qword [rsp + 416], rdx
	mov qword [rsp + 408], rax
	mov rax, r12
	mul rbx
	mov qword [rsp + 256], rdx
	mov qword [rsp + 832], rax
	mov rax, r10
	mov qword [rsp - 88], r10
	mul r12
	mov qword [rsp + 40], rdx
	mov qword [rsp + 72], rax
	mov rax, r13
	mul r12
	mov qword [rsp - 24], rax
	mov qword [rsp - 16], rdx
	mov r8, qword [r15 + 32]
	mov rax, r8
	mov r11, qword [rsp - 96]
	mul r11
	mov qword [rsp + 384], rdx
	mov qword [rsp + 376], rax
	mov rax, r8
	mul rsi
	mov r13, rsi
	mov qword [rsp + 824], rdx
	mov qword [rsp + 816], rax
	mov rax, r8
	mul rbx
	mov qword [rsp - 104], rbx
	mov qword [rsp + 64], rdx
	mov qword [rsp + 56], rax
	mov rax, r8
	mul r10
	mov qword [rsp + 24], rax
	mov qword [rsp + 32], rdx
	mov rsi, qword [r15 + 24]
	mov r10, r15
	mov qword [rsp - 48], r15
	mov rax, rsi
	mul r11
	mov r15, r11
	mov qword [rsp + 808], rdx
	mov qword [rsp + 800], rax
	mov rax, rsi
	mov r11, r13
	mov qword [rsp - 56], r13
	mul r13
	mov qword [rsp + 696], rdx
	mov qword [rsp + 672], rax
	mov rax, rsi
	mul rbx
	mov qword [rsp], rax
	mov qword [rsp + 8], rdx
	mov r13, qword [r10 + 16]
	mov rax, r13
	mul r15
	mov rbx, r15
	mov qword [rsp + 656], rdx
	mov qword [rsp + 632], rax
	mov rax, r13
	mul r11
	mov qword [rsp + 488], rax
	mov qword [rsp + 496], rdx
	mov r15, qword [r10 + 8]
	mov rax, r15
	mul rbx
	mov qword [rsp + 472], rax
	mov qword [rsp + 480], rdx
	mov rbx, qword [r9]
	mov rax, rbx
	mul qword [rsp - 128]
	mov qword [rsp + 352], rdx
	mov qword [rsp + 344], rax
	mov r11, qword [rsp - 64]
	mov rax, r11
	mul r14
	mov qword [rsp + 312], rdx
	mov qword [rsp + 296], rax
	mov rax, rbx
	mul r14
	mov qword [rsp + 792], rdx
	mov qword [rsp + 784], rax
	mov r10, qword [rsp - 72]
	mov rax, r10
	mul r12
	mov r9, rdx
	mov qword [rsp - 40], rax
	mov rax, r11
	mul r12
	mov qword [rsp + 768], rdx
	mov qword [rsp + 760], rax
	mov rax, rbx
	mul r12
	mov qword [rsp + 576], rdx
	mov qword [rsp + 568], rax
	mov rax, r8
	mov r14, qword [rsp - 80]
	mul r14
	mov qword [rsp + 272], rdx
	mov qword [rsp + 264], rax
	mov rax, r8
	mul r10
	mov r12, r10
	mov qword [rsp + 744], rdx
	mov qword [rsp + 728], rax
	mov rax, r8
	mul r11
	mov qword [rsp + 528], rdx
	mov qword [rsp + 520], rax
	mov rax, rbx
	mul r8
	mov qword [rsp + 368], rdx
	mov qword [rsp + 360], rax
	mov rax, rsi
	mov r10, qword [rsp - 88]
	mul r10
	mov qword [rsp + 248], rdx
	mov qword [rsp + 240], rax
	mov rax, rsi
	mul r14
	mov qword [rsp + 704], rdx
	mov qword [rsp + 680], rax
	mov rax, rsi
	mul r12
	mov qword [rsp + 512], rdx
	mov qword [rsp + 504], rax
	mov rax, rsi
	mov r8, r11
	mul r11
	mov qword [rsp + 320], rdx
	mov qword [rsp + 304], rax
	mov rax, rbx
	mov r11, rbx
	mul rsi
	mov qword [rsp + 184], rdx
	mov qword [rsp + 176], rax
	mov rax, r13
	mov rsi, qword [rsp - 104]
	mul rsi
	mov qword [rsp + 216], rdx
	mov qword [rsp + 208], rax
	mov rax, r13
	mul r10
	mov qword [rsp + 616], rdx
	mov qword [rsp + 600], rax
	mov rax, r13
	mul r14
	mov qword [rsp + 456], rdx
	mov qword [rsp + 440], rax
	mov rax, r13
	mul r12
	mov rbx, r12
	mov qword [rsp + 288], rdx
	mov qword [rsp + 280], rax
	mov rax, r13
	mul r8
	mov r12, rdx
	mov qword [rsp - 128], rax
	mov rax, r11
	mul r13
	mov qword [rsp + 688], rdx
	mov qword [rsp + 664], rax
	mov rax, r15
	mov r13, qword [rsp - 56]
	mul r13
	mov qword [rsp + 168], rdx
	mov qword [rsp + 160], rax
	mov rax, r15
	mul rsi
	mov qword [rsp + 560], rdx
	mov qword [rsp + 552], rax
	mov rax, r15
	mul r10
	mov qword [rsp + 400], rdx
	mov qword [rsp + 392], rax
	mov rax, r15
	mul r14
	mov qword [rsp + 232], rdx
	mov qword [rsp + 224], rax
	mov rax, r15
	mul rbx
	mov qword [rsp + 136], rdx
	mov qword [rsp + 128], rax
	mov rax, r15
	mul r8
	mov rsi, r8
	mov qword [rsp + 584], rax
	mov qword [rsp + 592], rdx
	mov rax, qword [rsp - 48]
	mov r8, qword [rax]
	mov rax, r11
	mul r15
	mov qword [rsp + 432], rdx
	mov qword [rsp + 424], rax
	mov rax, r8
	mul qword [rsp - 96]
	mov qword [rsp + 152], rdx
	mov qword [rsp + 144], rax
	mov rax, r8
	mul r13
	mov qword [rsp - 48], rdx
	mov qword [rsp - 56], rax
	mov rax, r8
	mul qword [rsp - 104]
	mov qword [rsp + 336], rdx
	mov qword [rsp + 328], rax
	mov rax, r8
	mul r10
	mov qword [rsp - 88], rdx
	mov qword [rsp + 192], rax
	mov rax, r8
	mul r14
	mov r15, rdx
	mov r13, rax
	mov rax, r8
	mul rbx
	mov qword [rsp - 96], rdx
	mov qword [rsp - 104], rax
	mov rax, r8
	mul rsi
	mov qword [rsp - 64], rdx
	mov qword [rsp - 72], rax
	mov rax, r8
	mul r11
	mov qword [rsp - 80], rax
	mov qword [rsp + 200], rdx
	mov rdx, qword [rsp + 408]
	add rdx, qword [rsp + 448]
	mov rax, qword [rsp + 416]
	adc rax, qword [rsp + 464]
	add rdx, qword [rsp + 536]
	adc rax, qword [rsp + 544]
	add rdx, qword [rsp + 376]
	adc rax, qword [rsp + 384]
	mov r14, qword [rsp - 128]
	add r14, rdx
	adc r12, rax
	add r14, qword [rsp + 128]
	adc r12, qword [rsp + 136]
	add r14, qword [rsp + 176]
	adc r12, qword [rsp + 184]
	add r14, r13
	adc r12, r15
	shld r12, r14, 8
	mov rbx, 72057594037927935
	and r14, rbx
	mov qword [rsp - 128], r14
	mov r10, qword [rsp - 40]
	add r10, qword [rsp + 296]
	adc r9, qword [rsp + 312]
	add r10, qword [rsp + 264]
	adc r9, qword [rsp + 272]
	add r10, rdx
	adc r9, rax
	add r10, qword [rsp + 240]
	adc r9, qword [rsp + 248]
	add r10, qword [rsp + 208]
	adc r9, qword [rsp + 216]
	add r10, qword [rsp + 160]
	adc r9, qword [rsp + 168]
	add r10, qword [rsp + 344]
	adc r9, qword [rsp + 352]
	add r10, qword [rsp + 144]
	adc r9, qword [rsp + 152]
	mov r8, qword [rsp + 120]
	mov rsi, qword [rsp - 32]
	shld r8, rsi, 1
	mov rax, qword [rsp - 120]
	add rax, qword [rsp + 736]
	mov qword [rsp - 120], rax
	mov rax, qword [rsp - 112]
	adc rax, qword [rsp + 752]
	mov qword [rsp - 112], rax
	add rcx, qword [rsp + 712]
	adc rbp, qword [rsp + 720]
	add rcx, qword [rsp + 640]
	adc rbp, qword [rsp + 648]
	shld r9, r10, 8
	and r10, rbx
	mov qword [rsp - 40], r10
	mov r10, rcx
	add r10, rcx
	mov r11, rbp
	adc r11, rbp
	add r10, qword [rsp - 24]
	adc r11, qword [rsp - 16]
	add r10, qword [rsp - 8]
	adc r11, qword [rsp + 16]
	mov r13, qword [rsp + 608]
	add r10, r13
	mov r15, qword [rsp + 624]
	adc r11, r15
	add r10, qword [rsp + 24]
	adc r11, qword [rsp + 32]
	add r10, qword [rsp]
	adc r11, qword [rsp + 8]
	add r10, qword [rsp + 304]
	adc r11, qword [rsp + 320]
	mov rdx, qword [rsp + 488]
	add r10, rdx
	mov rax, qword [rsp + 496]
	adc r11, rax
	add r10, qword [rsp + 280]
	adc r11, qword [rsp + 288]
	mov r14, qword [rsp + 472]
	add r10, r14
	mov rsi, qword [rsp + 480]
	adc r11, rsi
	add r10, qword [rsp + 224]
	adc r11, qword [rsp + 232]
	add r10, qword [rsp + 360]
	adc r11, qword [rsp + 368]
	add r10, qword [rsp + 192]
	adc r11, qword [rsp - 88]
	add r10, r12
	adc r11, 0
	add r10, r9
	adc r11, 0
	shld r11, r10, 8
	and r10, rbx
	add rcx, qword [rsp - 24]
	adc rbp, qword [rsp - 16]
	add rcx, qword [rsp - 8]
	adc rbp, qword [rsp + 16]
	add rcx, r13
	adc rbp, r15
	add rcx, qword [rsp + 24]
	adc rbp, qword [rsp + 32]
	add rcx, qword [rsp]
	adc rbp, qword [rsp + 8]
	add rcx, rdx
	adc rbp, rax
	add rcx, r14
	adc rbp, rsi
	add rcx, qword [rsp - 80]
	adc rbp, qword [rsp + 200]
	add rcx, r9
	adc rbp, 0
	mov rbx, qword [rsp - 120]
	mov rax, rbx
	add rax, rbx
	mov r9, qword [rsp - 112]
	mov rdx, r9
	adc rdx, r9
	add rax, qword [rsp + 72]
	adc rdx, qword [rsp + 40]
	mov r13, qword [rsp + 776]
	add rax, r13
	adc rdx, qword [rsp + 48]
	add rax, qword [rsp + 80]
	adc rdx, qword [rsp + 88]
	add rax, qword [rsp + 56]
	adc rdx, qword [rsp + 64]
	add rax, qword [rsp + 520]
	adc rdx, qword [rsp + 528]
	mov r14, qword [rsp + 672]
	add rax, r14
	mov rsi, qword [rsp + 696]
	adc rdx, rsi
	add rax, qword [rsp + 504]
	adc rdx, qword [rsp + 512]
	mov r12, qword [rsp + 632]
	add rax, r12
	mov r15, qword [rsp + 656]
	adc rdx, r15
	add rax, qword [rsp + 440]
	adc rdx, qword [rsp + 456]
	add rax, qword [rsp + 392]
	adc rdx, qword [rsp + 400]
	add rax, qword [rsp + 568]
	adc rdx, qword [rsp + 576]
	add rax, qword [rsp + 328]
	adc rdx, qword [rsp + 336]
	add rax, r11
	adc rdx, 0
	shld rbp, rcx, 8
	mov r11, 72057594037927935
	and rcx, r11
	add rbx, qword [rsp + 72]
	adc r9, qword [rsp + 40]
	add rbx, r13
	adc r9, qword [rsp + 48]
	add rbx, qword [rsp + 80]
	adc r9, qword [rsp + 88]
	add rbx, qword [rsp + 56]
	adc r9, qword [rsp + 64]
	add rbx, r14
	adc r9, rsi
	add rbx, r12
	adc r9, r15
	add rbx, qword [rsp + 424]
	adc r9, qword [rsp + 432]
	add rbx, qword [rsp - 72]
	adc r9, qword [rsp - 64]
	add rbx, rbp
	mov qword [rsp - 120], rbx
	adc r9, 0
	mov r13, r9
	shld rdx, rax, 8
	mov rsi, 72057594037927935
	and rax, rsi
	mov rsi, qword [rsp - 32]
	lea r9, [rsi + rsi]
	mov r11, qword [rsp + 832]
	add r9, r11
	mov rbx, qword [rsp + 256]
	adc r8, rbx
	add r9, qword [rsp + 96]
	adc r8, qword [rsp + 104]
	add r9, qword [rsp + 112]
	mov rbp, qword [rsp + 840]
	adc r8, rbp
	add r9, qword [rsp + 760]
	adc r8, qword [rsp + 768]
	mov r14, qword [rsp + 816]
	add r9, r14
	mov r12, qword [rsp + 824]
	adc r8, r12
	add r9, qword [rsp + 728]
	adc r8, qword [rsp + 744]
	mov r15, qword [rsp + 800]
	add r9, r15
	mov rsi, qword [rsp + 808]
	adc r8, rsi
	add r9, qword [rsp + 680]
	adc r8, qword [rsp + 704]
	add r9, qword [rsp + 600]
	adc r8, qword [rsp + 616]
	add r9, qword [rsp + 552]
	adc r8, qword [rsp + 560]
	add r9, qword [rsp + 784]
	adc r8, qword [rsp + 792]
	add r9, qword [rsp - 56]
	adc r8, qword [rsp - 48]
	add r9, rdx
	adc r8, 0
	mov rdx, qword [rsp - 120]
	shld r13, rdx, 8
	mov qword [rsp - 112], r13
	mov r13, 72057594037927935
	and rdx, r13
	mov r13, rdx
	mov rdx, r11
	add rdx, qword [rsp - 32]
	adc rbx, qword [rsp + 120]
	add rdx, qword [rsp + 96]
	adc rbx, qword [rsp + 104]
	add rdx, qword [rsp + 112]
	adc rbx, rbp
	add rdx, r14
	adc rbx, r12
	add rdx, r15
	adc rbx, rsi
	add rdx, qword [rsp + 584]
	adc rbx, qword [rsp + 592]
	add rdx, qword [rsp + 664]
	adc rbx, qword [rsp + 688]
	add rdx, qword [rsp - 104]
	adc rbx, qword [rsp - 96]
	mov r11, rbx
	add rdx, qword [rsp - 112]
	mov r15, rdx
	adc r11, 0
	shld r8, r9, 8
	add r8, qword [rsp - 40]
	shld r11, rdx, 8
	add r11, qword [rsp - 128]
	mov rdx, r11
	shr rdx, 56
	add rdx, r10
	mov r10, r8
	shr r10, 56
	add rcx, r10
	add rdx, r10
	mov r10, rdx
	shr r10, 56
	add r10, rax
	mov rax, rcx
	shr rax, 56
	add rax, r13
	mov rsi, 72057594037927935
	and r9, rsi
	and r15, rsi
	and r8, rsi
	and r11, rsi
	and rdx, rsi
	and rcx, rsi
	mov qword [rdi], rcx
	mov qword [rdi + 8], rax
	mov qword [rdi + 16], r15
	mov qword [rdi + 24], r11
	mov qword [rdi + 32], rdx
	mov qword [rdi + 40], r10
	mov qword [rdi + 48], r9
	mov qword [rdi + 56], r8
	add rsp, 848
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret

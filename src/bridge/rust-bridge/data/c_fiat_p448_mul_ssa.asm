	.text
	.intel_syntax noprefix
	.file	"c_fiat_p448_solinas_mul.c"
	.globl	c_fiat_p448_carry_mul           # -- Begin function c_fiat_p448_carry_mul
	.p2align	4, 0x90
	.type	c_fiat_p448_carry_mul,@function
c_fiat_p448_carry_mul:                  # @c_fiat_p448_carry_mul
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	push	r15
	.cfi_def_cfa_offset 24
	push	r14
	.cfi_def_cfa_offset 32
	push	r13
	.cfi_def_cfa_offset 40
	push	r12
	.cfi_def_cfa_offset 48
	push	rbx
	.cfi_def_cfa_offset 56
	sub	rsp, 848
	.cfi_def_cfa_offset 904
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rcx, qword ptr [rsi + 56]
	mov	r13, rsi
	mov	rsi, rdx
	mov	rax, qword ptr [rdx + 56]
	mov	r8, rax
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mul	rcx
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsi + 48]
	mov	r10, rax
	mul	rcx
	mov	qword ptr [rsp + 744], rax      # 8-byte Spill
	mov	qword ptr [rsp + 752], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsi + 40]
	mov	r9, rsi
	mov	qword ptr [rsp - 128], rsi      # 8-byte Spill
	mov	r15, rax
	mul	rcx
	mov	r11, rcx
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 712], rax      # 8-byte Spill
	mov	qword ptr [rsp + 728], rdx      # 8-byte Spill
	mov	r14, qword ptr [r13 + 48]
	mov	rax, r14
	mul	r8
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rax, r14
	mul	r10
	mov	rcx, rax
	mov	rbp, rdx
	mov	r12, qword ptr [r13 + 40]
	mov	rax, r12
	mul	r8
	mov	qword ptr [rsp + 648], rax      # 8-byte Spill
	mov	qword ptr [rsp + 656], rdx      # 8-byte Spill
	mov	r8, qword ptr [rsi + 32]
	mov	rax, r8
	mul	r11
	mov	qword ptr [rsp + 536], rax      # 8-byte Spill
	mov	qword ptr [rsp + 544], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsi + 24]
	mov	rsi, rax
	mul	r11
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	mov	qword ptr [rsp + 840], rdx      # 8-byte Spill
	mov	rbx, qword ptr [r9 + 16]
	mov	rax, rbx
	mov	qword ptr [rsp - 72], rbx       # 8-byte Spill
	mul	r11
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	rax, qword ptr [r9 + 8]
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mul	r11
	mov	qword ptr [rsp + 32], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 616], rax      # 8-byte Spill
	mov	rax, r14
	mul	r15
	mov	qword ptr [rsp + 456], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 448], rax      # 8-byte Spill
	mov	rax, r8
	mul	r14
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	qword ptr [rsp - 80], rsi       # 8-byte Spill
	mov	rax, rsi
	mul	r14
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mov	rax, rbx
	mul	r14
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rax, r12
	mov	r11, r10
	mul	r10
	mov	qword ptr [rsp + 408], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 400], rax      # 8-byte Spill
	mov	rax, r12
	mul	r15
	mov	qword ptr [rsp + 520], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 832], rax      # 8-byte Spill
	mov	rax, r8
	mov	qword ptr [rsp - 96], r8        # 8-byte Spill
	mul	r12
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 768], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r12
	mov	qword ptr [rsp + 552], rax      # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rbx, qword ptr [r13 + 32]
	mov	rax, rbx
	mov	r9, qword ptr [rsp - 88]        # 8-byte Reload
	mul	r9
	mov	qword ptr [rsp + 376], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 368], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r10
	mov	qword ptr [rsp + 824], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 816], rax      # 8-byte Spill
	mov	rax, rbx
	mov	qword ptr [rsp - 64], r15       # 8-byte Spill
	mul	r15
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	mov	rax, rbx
	mul	r8
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	r10, r13
	mov	r8, qword ptr [r13 + 24]
	mov	rax, r8
	mul	r9
	mov	qword ptr [rsp + 808], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 800], rax      # 8-byte Spill
	mov	rax, r8
	mul	r11
	mov	qword ptr [rsp - 48], r11       # 8-byte Spill
	mov	qword ptr [rsp + 696], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 672], rax      # 8-byte Spill
	mov	rax, r8
	mul	r15
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	r13, qword ptr [r13 + 16]
	mov	qword ptr [rsp - 40], r10       # 8-byte Spill
	mov	rax, r13
	mul	r9
	mov	qword ptr [rsp + 640], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 632], rax      # 8-byte Spill
	mov	rax, r13
	mul	r11
	mov	qword ptr [rsp + 488], rax      # 8-byte Spill
	mov	qword ptr [rsp + 496], rdx      # 8-byte Spill
	mov	r15, qword ptr [r10 + 8]
	mov	rax, r15
	mul	r9
	mov	qword ptr [rsp + 464], rax      # 8-byte Spill
	mov	qword ptr [rsp + 472], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 128]      # 8-byte Reload
	mov	r10, qword ptr [rax]
	mov	rax, r10
	mul	qword ptr [rsp - 120]           # 8-byte Folded Reload
	mov	qword ptr [rsp + 344], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 336], rax      # 8-byte Spill
	mov	rsi, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rax, rsi
	mul	r14
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mov	rax, r10
	mul	r14
	mov	qword ptr [rsp + 792], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 784], rax      # 8-byte Spill
	mov	r11, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rax, r11
	mul	r12
	mov	r9, rdx
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r12
	mov	qword ptr [rsp + 776], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 760], rax      # 8-byte Spill
	mov	rax, r10
	mul	r12
	mov	qword ptr [rsp + 584], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 576], rax      # 8-byte Spill
	mov	rax, rbx
	mov	r14, qword ptr [rsp - 80]       # 8-byte Reload
	mul	r14
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 264], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r11
	mov	r12, r11
	mov	qword ptr [rsp + 736], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 720], rax      # 8-byte Spill
	mov	rax, rbx
	mul	rsi
	mov	qword ptr [rsp + 528], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 480], rax      # 8-byte Spill
	mov	rax, r10
	mul	rbx
	mov	qword ptr [rsp + 360], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 352], rax      # 8-byte Spill
	mov	rax, r8
	mov	r11, qword ptr [rsp - 96]       # 8-byte Reload
	mul	r11
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 248], rax      # 8-byte Spill
	mov	rax, r8
	mul	r14
	mov	qword ptr [rsp + 704], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 680], rax      # 8-byte Spill
	mov	rax, r8
	mul	r12
	mov	qword ptr [rsp + 512], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 504], rax      # 8-byte Spill
	mov	rax, r8
	mul	rsi
	mov	qword ptr [rsp + 320], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	mov	rax, r10
	mul	r8
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 176], rax      # 8-byte Spill
	mov	rax, r13
	mov	r8, qword ptr [rsp - 64]        # 8-byte Reload
	mul	r8
	mov	qword ptr [rsp + 216], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 208], rax      # 8-byte Spill
	mov	rax, r13
	mul	r11
	mov	qword ptr [rsp + 624], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 608], rax      # 8-byte Spill
	mov	rax, r13
	mul	r14
	mov	qword ptr [rsp + 440], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 432], rax      # 8-byte Spill
	mov	rax, r13
	mul	r12
	mov	rbx, r12
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 280], rax      # 8-byte Spill
	mov	rax, r13
	mul	rsi
	mov	r12, rdx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, r10
	mul	r13
	mov	qword ptr [rsp + 688], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 664], rax      # 8-byte Spill
	mov	rax, r15
	mov	r13, qword ptr [rsp - 48]       # 8-byte Reload
	mul	r13
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 160], rax      # 8-byte Spill
	mov	rax, r15
	mul	r8
	mov	qword ptr [rsp + 568], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 560], rax      # 8-byte Spill
	mov	rax, r15
	mul	r11
	mov	qword ptr [rsp + 392], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 384], rax      # 8-byte Spill
	mov	rax, r15
	mul	r14
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 232], rax      # 8-byte Spill
	mov	rax, r15
	mul	rbx
	mov	r11, rbx
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	rax, r15
	mul	rsi
	mov	qword ptr [rsp + 592], rax      # 8-byte Spill
	mov	qword ptr [rsp + 600], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rbx, qword ptr [rax]
	mov	rax, r10
	mul	r15
	mov	qword ptr [rsp + 424], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 416], rax      # 8-byte Spill
	mov	rax, rbx
	mul	qword ptr [rsp - 88]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 144], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r13
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, rbx
	mul	r8
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 328], rax      # 8-byte Spill
	mov	rax, rbx
	mul	qword ptr [rsp - 96]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 192], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r14
	mov	r15, rdx
	mov	r13, rax
	mov	rax, rbx
	mul	r11
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rax, rbx
	mul	rsi
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, rbx
	mul	r10
	mov	qword ptr [rsp + 224], rax      # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 400]      # 8-byte Reload
	add	rdx, qword ptr [rsp + 448]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp + 408]      # 8-byte Reload
	adc	rax, qword ptr [rsp + 456]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 536]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 544]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 368]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 376]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp - 120]      # 8-byte Reload
	add	r14, rdx
	mov	r10, rdx
	adc	r12, rax
	mov	rdx, rax
	add	r14, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	r14, r13
	adc	r12, r15
	shld	r12, r14, 8
	movabs	rax, 72057594037927935
	and	r14, rax
	mov	qword ptr [rsp - 120], r14      # 8-byte Spill
	mov	r11, rax
	mov	rsi, qword ptr [rsp - 128]      # 8-byte Reload
	add	rsi, qword ptr [rsp + 296]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 312]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 272]       # 8-byte Folded Reload
	add	rsi, r10
	adc	r9, rdx
	add	rsi, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 256]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 208]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 216]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 168]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 336]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 344]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 144]      # 8-byte Folded Reload
	mov	rdx, rsi
	adc	r9, qword ptr [rsp + 152]       # 8-byte Folded Reload
	mov	r10, qword ptr [rsp + 120]      # 8-byte Reload
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	shld	r10, rsi, 1
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	add	rax, qword ptr [rsp + 744]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	adc	rax, qword ptr [rsp + 752]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	add	rcx, qword ptr [rsp + 712]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 728]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 648]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 656]      # 8-byte Folded Reload
	shld	r9, rdx, 8
	and	rdx, r11
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rsi, rbp
	shld	rsi, rcx, 1
	lea	rbx, [rcx + rcx]
	mov	r15, qword ptr [rsp + 552]      # 8-byte Reload
	add	rbx, r15
	adc	rsi, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 8]        # 8-byte Folded Reload
	mov	r13, qword ptr [rsp + 616]      # 8-byte Reload
	add	rbx, r13
	adc	rsi, qword ptr [rsp + 32]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp]            # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 304]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 320]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 488]      # 8-byte Reload
	add	rbx, rdx
	mov	rax, qword ptr [rsp + 496]      # 8-byte Reload
	adc	rsi, rax
	add	rbx, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 288]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 464]      # 8-byte Reload
	add	rbx, r14
	mov	r8, qword ptr [rsp + 472]       # 8-byte Reload
	adc	rsi, r8
	add	rbx, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 240]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 352]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 360]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 192]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 200]      # 8-byte Folded Reload
	add	rbx, r12
	adc	rsi, 0
	add	rbx, r9
	adc	rsi, 0
	shld	rsi, rbx, 8
	and	rbx, r11
	add	rcx, r15
	adc	rbp, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	rcx, r13
	adc	rbp, qword ptr [rsp + 32]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp]            # 8-byte Folded Reload
	add	rcx, rdx
	adc	rbp, rax
	add	rcx, r14
	adc	rbp, r8
	add	rcx, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	rcx, r9
	adc	rbp, 0
	mov	r11, qword ptr [rsp - 104]      # 8-byte Reload
	mov	rdx, r11
	mov	r15, qword ptr [rsp - 112]      # 8-byte Reload
	shld	rdx, r15, 1
	lea	rax, [r15 + r15]
	mov	r9, qword ptr [rsp + 768]       # 8-byte Reload
	add	rax, r9
	adc	rdx, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 480]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 528]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 672]      # 8-byte Reload
	add	rax, r14
	mov	r8, qword ptr [rsp + 696]       # 8-byte Reload
	adc	rdx, r8
	add	rax, qword ptr [rsp + 504]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 512]      # 8-byte Folded Reload
	mov	r13, qword ptr [rsp + 632]      # 8-byte Reload
	add	rax, r13
	mov	r12, qword ptr [rsp + 640]      # 8-byte Reload
	adc	rdx, r12
	add	rax, qword ptr [rsp + 432]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 440]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 384]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 392]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 576]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 584]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 328]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	rax, rsi
	adc	rdx, 0
	shld	rbp, rcx, 8
	movabs	rsi, 72057594037927935
	and	rcx, rsi
	add	r15, r9
	adc	r11, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	r15, r14
	adc	r11, r8
	add	r15, r13
	adc	r11, r12
	add	r15, qword ptr [rsp + 416]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 424]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	r15, rbp
	mov	qword ptr [rsp - 112], r15      # 8-byte Spill
	adc	r11, 0
	mov	r13, r11
	shld	rdx, rax, 8
	and	rax, rsi
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	add	rsi, rsi
	mov	r15, qword ptr [rsp + 832]      # 8-byte Reload
	add	rsi, r15
	mov	r11, qword ptr [rsp + 520]      # 8-byte Reload
	adc	r10, r11
	add	rsi, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 112]      # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 840]      # 8-byte Reload
	adc	r10, rbp
	add	rsi, qword ptr [rsp + 760]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 776]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 816]      # 8-byte Reload
	add	rsi, r14
	mov	r9, qword ptr [rsp + 824]       # 8-byte Reload
	adc	r10, r9
	add	rsi, qword ptr [rsp + 720]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 736]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp + 800]      # 8-byte Reload
	add	rsi, r12
	mov	r8, qword ptr [rsp + 808]       # 8-byte Reload
	adc	r10, r8
	add	rsi, qword ptr [rsp + 680]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 704]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 608]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 624]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 560]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 568]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 784]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 792]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	rsi, rdx
	adc	r10, 0
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	shld	r13, rdx, 8
	mov	qword ptr [rsp - 104], r13      # 8-byte Spill
	movabs	r13, 72057594037927935
	and	rdx, r13
	mov	r13, rdx
	add	r15, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	r11, rbp
	add	r15, r14
	adc	r11, r9
	add	r15, r12
	adc	r11, r8
	add	r15, qword ptr [rsp + 592]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 600]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 664]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 688]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r11, 0
	shld	r10, rsi, 8
	add	r10, qword ptr [rsp - 128]      # 8-byte Folded Reload
	shld	r11, r15, 8
	add	r11, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	rdx, r11
	shr	rdx, 56
	add	rdx, rbx
	mov	r9, r10
	shr	r9, 56
	add	rcx, r9
	add	rdx, r9
	mov	r9, rdx
	shr	r9, 56
	add	r9, rax
	mov	rax, rcx
	shr	rax, 56
	add	rax, r13
	movabs	r8, 72057594037927935
	and	rsi, r8
	and	r15, r8
	and	r10, r8
	and	r11, r8
	and	rdx, r8
	and	rcx, r8
	mov	qword ptr [rdi], rcx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], r15
	mov	qword ptr [rdi + 24], r11
	mov	qword ptr [rdi + 32], rdx
	mov	qword ptr [rdi + 40], r9
	mov	qword ptr [rdi + 48], rsi
	mov	qword ptr [rdi + 56], r10
	add	rsp, 848
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	r12
	.cfi_def_cfa_offset 40
	pop	r13
	.cfi_def_cfa_offset 32
	pop	r14
	.cfi_def_cfa_offset 24
	pop	r15
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end0:
	.size	c_fiat_p448_carry_mul, .Lfunc_end0-c_fiat_p448_carry_mul
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

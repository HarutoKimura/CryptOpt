	.text
	.intel_syntax noprefix
	.file	"rust_fiat_p448_solinas_mul.867e43276feca352-cgu.0"
	.globl	rust_fiat_p448_solinas_carry_mul # -- Begin function rust_fiat_p448_solinas_carry_mul
	.p2align	4, 0x90
	.type	rust_fiat_p448_solinas_carry_mul,@function
rust_fiat_p448_solinas_carry_mul:       # @rust_fiat_p448_solinas_carry_mul
	.cfi_startproc
# %bb.0:                                # %start
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
	mov	r9, rdx
	mov	rcx, qword ptr [rsi + 56]
	mov	r11, rsi
	mov	rax, qword ptr [rdx + 56]
	mov	rsi, rax
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mul	rcx
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rax, qword ptr [r9 + 48]
	mov	r8, rax
	mul	rcx
	mov	qword ptr [rsp + 736], rax      # 8-byte Spill
	mov	qword ptr [rsp + 752], rdx      # 8-byte Spill
	mov	rax, qword ptr [r9 + 40]
	mov	rbx, rax
	mul	rcx
	mov	r10, rcx
	mov	qword ptr [rsp + 712], rax      # 8-byte Spill
	mov	qword ptr [rsp + 720], rdx      # 8-byte Spill
	mov	r14, qword ptr [r11 + 48]
	mov	rax, r14
	mul	rsi
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, r14
	mul	r8
	mov	rcx, rax
	mov	rbp, rdx
	mov	r12, qword ptr [r11 + 40]
	mov	r15, r11
	mov	rax, r12
	mul	rsi
	mov	qword ptr [rsp + 640], rax      # 8-byte Spill
	mov	qword ptr [rsp + 648], rdx      # 8-byte Spill
	mov	rsi, qword ptr [r9 + 32]
	mov	rax, rsi
	mul	r10
	mov	qword ptr [rsp + 536], rax      # 8-byte Spill
	mov	qword ptr [rsp + 544], rdx      # 8-byte Spill
	mov	rax, qword ptr [r9 + 24]
	mov	r13, rax
	mul	r10
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	mov	qword ptr [rsp + 840], rdx      # 8-byte Spill
	mov	r11, qword ptr [r9 + 16]
	mov	rax, r11
	mov	qword ptr [rsp - 72], r11       # 8-byte Spill
	mul	r10
	mov	qword ptr [rsp - 128], r10      # 8-byte Spill
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	rax, qword ptr [r9 + 8]
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mul	r10
	mov	qword ptr [rsp + 624], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 608], rax      # 8-byte Spill
	mov	rax, r14
	mul	rbx
	mov	qword ptr [rsp + 464], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 448], rax      # 8-byte Spill
	mov	rax, rsi
	mov	r10, rsi
	mul	r14
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	qword ptr [rsp - 80], r13       # 8-byte Spill
	mov	rax, r13
	mul	r14
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 776], rax      # 8-byte Spill
	mov	rax, r11
	mul	r14
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	rax, r12
	mov	rsi, r8
	mul	r8
	mov	qword ptr [rsp + 416], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 408], rax      # 8-byte Spill
	mov	rax, r12
	mul	rbx
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 832], rax      # 8-byte Spill
	mov	rax, r10
	mov	qword ptr [rsp - 88], r10       # 8-byte Spill
	mul	r12
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 72], rax       # 8-byte Spill
	mov	rax, r13
	mul	r12
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	r8, qword ptr [r15 + 32]
	mov	rax, r8
	mov	r11, qword ptr [rsp - 96]       # 8-byte Reload
	mul	r11
	mov	qword ptr [rsp + 384], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 376], rax      # 8-byte Spill
	mov	rax, r8
	mul	rsi
	mov	r13, rsi
	mov	qword ptr [rsp + 824], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 816], rax      # 8-byte Spill
	mov	rax, r8
	mul	rbx
	mov	qword ptr [rsp - 104], rbx      # 8-byte Spill
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	mov	rax, r8
	mul	r10
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	qword ptr [rsp + 32], rdx       # 8-byte Spill
	mov	rsi, qword ptr [r15 + 24]
	mov	r10, r15
	mov	qword ptr [rsp - 48], r15       # 8-byte Spill
	mov	rax, rsi
	mul	r11
	mov	r15, r11
	mov	qword ptr [rsp + 808], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 800], rax      # 8-byte Spill
	mov	rax, rsi
	mov	r11, r13
	mov	qword ptr [rsp - 56], r13       # 8-byte Spill
	mul	r13
	mov	qword ptr [rsp + 696], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 672], rax      # 8-byte Spill
	mov	rax, rsi
	mul	rbx
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	r13, qword ptr [r10 + 16]
	mov	rax, r13
	mul	r15
	mov	rbx, r15
	mov	qword ptr [rsp + 656], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 632], rax      # 8-byte Spill
	mov	rax, r13
	mul	r11
	mov	qword ptr [rsp + 488], rax      # 8-byte Spill
	mov	qword ptr [rsp + 496], rdx      # 8-byte Spill
	mov	r15, qword ptr [r10 + 8]
	mov	rax, r15
	mul	rbx
	mov	qword ptr [rsp + 472], rax      # 8-byte Spill
	mov	qword ptr [rsp + 480], rdx      # 8-byte Spill
	mov	rbx, qword ptr [r9]
	mov	rax, rbx
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	mov	qword ptr [rsp + 352], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 344], rax      # 8-byte Spill
	mov	r11, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rax, r11
	mul	r14
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r14
	mov	qword ptr [rsp + 792], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 784], rax      # 8-byte Spill
	mov	r10, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rax, r10
	mul	r12
	mov	r9, rdx
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rax, r11
	mul	r12
	mov	qword ptr [rsp + 768], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 760], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r12
	mov	qword ptr [rsp + 576], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 568], rax      # 8-byte Spill
	mov	rax, r8
	mov	r14, qword ptr [rsp - 80]       # 8-byte Reload
	mul	r14
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 264], rax      # 8-byte Spill
	mov	rax, r8
	mul	r10
	mov	r12, r10
	mov	qword ptr [rsp + 744], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 728], rax      # 8-byte Spill
	mov	rax, r8
	mul	r11
	mov	qword ptr [rsp + 528], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 520], rax      # 8-byte Spill
	mov	rax, rbx
	mul	r8
	mov	qword ptr [rsp + 368], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 360], rax      # 8-byte Spill
	mov	rax, rsi
	mov	r10, qword ptr [rsp - 88]       # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 240], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r14
	mov	qword ptr [rsp + 704], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 680], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r12
	mov	qword ptr [rsp + 512], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 504], rax      # 8-byte Spill
	mov	rax, rsi
	mov	r8, r11
	mul	r11
	mov	qword ptr [rsp + 320], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	mov	rax, rbx
	mov	r11, rbx
	mul	rsi
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 176], rax      # 8-byte Spill
	mov	rax, r13
	mov	rsi, qword ptr [rsp - 104]      # 8-byte Reload
	mul	rsi
	mov	qword ptr [rsp + 216], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 208], rax      # 8-byte Spill
	mov	rax, r13
	mul	r10
	mov	qword ptr [rsp + 616], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 600], rax      # 8-byte Spill
	mov	rax, r13
	mul	r14
	mov	qword ptr [rsp + 456], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 440], rax      # 8-byte Spill
	mov	rax, r13
	mul	r12
	mov	rbx, r12
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 280], rax      # 8-byte Spill
	mov	rax, r13
	mul	r8
	mov	r12, rdx
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rax, r11
	mul	r13
	mov	qword ptr [rsp + 688], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 664], rax      # 8-byte Spill
	mov	rax, r15
	mov	r13, qword ptr [rsp - 56]       # 8-byte Reload
	mul	r13
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 160], rax      # 8-byte Spill
	mov	rax, r15
	mul	rsi
	mov	qword ptr [rsp + 560], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 552], rax      # 8-byte Spill
	mov	rax, r15
	mul	r10
	mov	qword ptr [rsp + 400], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 392], rax      # 8-byte Spill
	mov	rax, r15
	mul	r14
	mov	qword ptr [rsp + 232], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 224], rax      # 8-byte Spill
	mov	rax, r15
	mul	rbx
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	rax, r15
	mul	r8
	mov	rsi, r8
	mov	qword ptr [rsp + 584], rax      # 8-byte Spill
	mov	qword ptr [rsp + 592], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mov	r8, qword ptr [rax]
	mov	rax, r11
	mul	r15
	mov	qword ptr [rsp + 432], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 424], rax      # 8-byte Spill
	mov	rax, r8
	mul	qword ptr [rsp - 96]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 144], rax      # 8-byte Spill
	mov	rax, r8
	mul	r13
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, r8
	mul	qword ptr [rsp - 104]           # 8-byte Folded Reload
	mov	qword ptr [rsp + 336], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 328], rax      # 8-byte Spill
	mov	rax, r8
	mul	r10
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 192], rax      # 8-byte Spill
	mov	rax, r8
	mul	r14
	mov	r15, rdx
	mov	r13, rax
	mov	rax, r8
	mul	rbx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, r8
	mul	rsi
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rax, r8
	mul	r11
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 408]      # 8-byte Reload
	add	rdx, qword ptr [rsp + 448]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp + 416]      # 8-byte Reload
	adc	rax, qword ptr [rsp + 464]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 536]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 544]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 376]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 384]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp - 128]      # 8-byte Reload
	add	r14, rdx
	adc	r12, rax
	add	r14, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	r14, r13
	adc	r12, r15
	shld	r12, r14, 8
	movabs	rbx, 72057594037927935
	and	r14, rbx
	mov	qword ptr [rsp - 128], r14      # 8-byte Spill
	mov	r10, qword ptr [rsp - 40]       # 8-byte Reload
	add	r10, qword ptr [rsp + 296]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 312]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 272]       # 8-byte Folded Reload
	add	r10, rdx
	adc	r9, rax
	add	r10, qword ptr [rsp + 240]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 248]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 208]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 216]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 168]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 344]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 352]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 144]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 152]       # 8-byte Folded Reload
	mov	r8, qword ptr [rsp + 120]       # 8-byte Reload
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	shld	r8, rsi, 1
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	add	rax, qword ptr [rsp + 736]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	adc	rax, qword ptr [rsp + 752]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	add	rcx, qword ptr [rsp + 712]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 720]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 640]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 648]      # 8-byte Folded Reload
	shld	r9, r10, 8
	and	r10, rbx
	mov	qword ptr [rsp - 40], r10       # 8-byte Spill
	mov	r10, rcx
	add	r10, rcx
	mov	r11, rbp
	adc	r11, rbp
	add	r10, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 16]       # 8-byte Folded Reload
	mov	r13, qword ptr [rsp + 608]      # 8-byte Reload
	add	r10, r13
	mov	r15, qword ptr [rsp + 624]      # 8-byte Reload
	adc	r11, r15
	add	r10, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 32]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 304]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 320]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 488]      # 8-byte Reload
	add	r10, rdx
	mov	rax, qword ptr [rsp + 496]      # 8-byte Reload
	adc	r11, rax
	add	r10, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 288]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 472]      # 8-byte Reload
	add	r10, r14
	mov	rsi, qword ptr [rsp + 480]      # 8-byte Reload
	adc	r11, rsi
	add	r10, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 232]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 360]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 368]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 192]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	r10, r12
	adc	r11, 0
	add	r10, r9
	adc	r11, 0
	shld	r11, r10, 8
	and	r10, rbx
	add	rcx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 16]       # 8-byte Folded Reload
	add	rcx, r13
	adc	rbp, r15
	add	rcx, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 32]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	rcx, rdx
	adc	rbp, rax
	add	rcx, r14
	adc	rbp, rsi
	add	rcx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 200]      # 8-byte Folded Reload
	add	rcx, r9
	adc	rbp, 0
	mov	rbx, qword ptr [rsp - 120]      # 8-byte Reload
	mov	rax, rbx
	add	rax, rbx
	mov	r9, qword ptr [rsp - 112]       # 8-byte Reload
	mov	rdx, r9
	adc	rdx, r9
	add	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 40]       # 8-byte Folded Reload
	mov	r13, qword ptr [rsp + 776]      # 8-byte Reload
	add	rax, r13
	adc	rdx, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 520]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 528]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 672]      # 8-byte Reload
	add	rax, r14
	mov	rsi, qword ptr [rsp + 696]      # 8-byte Reload
	adc	rdx, rsi
	add	rax, qword ptr [rsp + 504]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 512]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp + 632]      # 8-byte Reload
	add	rax, r12
	mov	r15, qword ptr [rsp + 656]      # 8-byte Reload
	adc	rdx, r15
	add	rax, qword ptr [rsp + 440]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 456]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 392]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 400]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 568]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 576]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 328]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp + 336]      # 8-byte Folded Reload
	add	rax, r11
	adc	rdx, 0
	shld	rbp, rcx, 8
	movabs	r11, 72057594037927935
	and	rcx, r11
	add	rbx, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 40]        # 8-byte Folded Reload
	add	rbx, r13
	adc	r9, qword ptr [rsp + 48]        # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 88]        # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 64]        # 8-byte Folded Reload
	add	rbx, r14
	adc	r9, rsi
	add	rbx, r12
	adc	r9, r15
	add	rbx, qword ptr [rsp + 424]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 432]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 64]        # 8-byte Folded Reload
	add	rbx, rbp
	mov	qword ptr [rsp - 120], rbx      # 8-byte Spill
	adc	r9, 0
	mov	r13, r9
	shld	rdx, rax, 8
	movabs	rsi, 72057594037927935
	and	rax, rsi
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	lea	r9, [rsi + rsi]
	mov	r11, qword ptr [rsp + 832]      # 8-byte Reload
	add	r9, r11
	mov	rbx, qword ptr [rsp + 256]      # 8-byte Reload
	adc	r8, rbx
	add	r9, qword ptr [rsp + 96]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 104]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 112]       # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 840]      # 8-byte Reload
	adc	r8, rbp
	add	r9, qword ptr [rsp + 760]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 768]       # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 816]      # 8-byte Reload
	add	r9, r14
	mov	r12, qword ptr [rsp + 824]      # 8-byte Reload
	adc	r8, r12
	add	r9, qword ptr [rsp + 728]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 744]       # 8-byte Folded Reload
	mov	r15, qword ptr [rsp + 800]      # 8-byte Reload
	add	r9, r15
	mov	rsi, qword ptr [rsp + 808]      # 8-byte Reload
	adc	r8, rsi
	add	r9, qword ptr [rsp + 680]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 704]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 600]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 616]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 552]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 560]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 784]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 792]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 56]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 48]        # 8-byte Folded Reload
	add	r9, rdx
	adc	r8, 0
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	shld	r13, rdx, 8
	mov	qword ptr [rsp - 112], r13      # 8-byte Spill
	movabs	r13, 72057594037927935
	and	rdx, r13
	mov	r13, rdx
	mov	rdx, r11
	add	rdx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	rbx, rbp
	add	rdx, r14
	adc	rbx, r12
	add	rdx, r15
	adc	rbx, rsi
	add	rdx, qword ptr [rsp + 584]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 592]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 664]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 688]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	r11, rbx
	add	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r15, rdx
	adc	r11, 0
	shld	r8, r9, 8
	add	r8, qword ptr [rsp - 40]        # 8-byte Folded Reload
	shld	r11, rdx, 8
	add	r11, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	rdx, r11
	shr	rdx, 56
	add	rdx, r10
	mov	r10, r8
	shr	r10, 56
	add	rcx, r10
	add	rdx, r10
	mov	r10, rdx
	shr	r10, 56
	add	r10, rax
	mov	rax, rcx
	shr	rax, 56
	add	rax, r13
	movabs	rsi, 72057594037927935
	and	r9, rsi
	and	r15, rsi
	and	r8, rsi
	and	r11, rsi
	and	rdx, rsi
	and	rcx, rsi
	mov	qword ptr [rdi], rcx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], r15
	mov	qword ptr [rdi + 24], r11
	mov	qword ptr [rdi + 32], rdx
	mov	qword ptr [rdi + 40], r10
	mov	qword ptr [rdi + 48], r9
	mov	qword ptr [rdi + 56], r8
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
	.size	rust_fiat_p448_solinas_carry_mul, .Lfunc_end0-rust_fiat_p448_solinas_carry_mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"
	.section	".note.GNU-stack","",@progbits

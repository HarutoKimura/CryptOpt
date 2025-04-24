	.text
	.intel_syntax noprefix
	.file	"rust_fiat_p521_mul.c76daa9ea1b984e6-cgu.0"
	.globl	rust_fiat_p521_carry_mul        # -- Begin function rust_fiat_p521_carry_mul
	.p2align	4, 0x90
	.type	rust_fiat_p521_carry_mul,@function
rust_fiat_p521_carry_mul:               # @rust_fiat_p521_carry_mul
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
	sub	rsp, 1128
	.cfi_def_cfa_offset 1184
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rcx, rdx
	mov	rbp, rsi
	mov	rsi, qword ptr [rsi + 64]
	mov	rax, qword ptr [rdx + 64]
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	add	rax, rax
	mov	rbx, rax
	mul	rsi
	mov	qword ptr [rsp + 1112], rax     # 8-byte Spill
	mov	qword ptr [rsp + 1120], rdx     # 8-byte Spill
	mov	rax, qword ptr [rcx + 56]
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	lea	r13, [rax + rax]
	mov	rax, r13
	mul	rsi
	mov	qword ptr [rsp + 1008], rax     # 8-byte Spill
	mov	qword ptr [rsp + 1024], rdx     # 8-byte Spill
	mov	rax, qword ptr [rcx + 48]
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	lea	r14, [rax + rax]
	mov	rax, r14
	mul	rsi
	mov	r9, rsi
	mov	qword ptr [rsp - 56], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 976], rax      # 8-byte Spill
	mov	qword ptr [rsp + 992], rdx      # 8-byte Spill
	mov	rax, qword ptr [rcx + 40]
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	lea	rsi, [rax + rax]
	mov	rax, rsi
	mul	r9
	mov	qword ptr [rsp + 952], rax      # 8-byte Spill
	mov	qword ptr [rsp + 960], rdx      # 8-byte Spill
	mov	rax, qword ptr [rcx + 32]
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	lea	r10, [rax + rax]
	mov	rax, r10
	mul	r9
	mov	qword ptr [rsp + 968], rax      # 8-byte Spill
	mov	qword ptr [rsp + 984], rdx      # 8-byte Spill
	mov	rax, qword ptr [rcx + 24]
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	lea	r12, [rax + rax]
	mov	rax, r12
	mul	r9
	mov	qword ptr [rsp + 1000], rax     # 8-byte Spill
	mov	qword ptr [rsp + 1016], rdx     # 8-byte Spill
	mov	rax, qword ptr [rcx + 16]
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	lea	r15, [rax + rax]
	mov	rax, r15
	mul	r9
	mov	qword ptr [rsp + 1064], rax     # 8-byte Spill
	mov	qword ptr [rsp + 1072], rdx     # 8-byte Spill
	mov	rax, qword ptr [rcx + 8]
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	add	rax, rax
	mul	r9
	mov	qword ptr [rsp + 696], rax      # 8-byte Spill
	mov	qword ptr [rsp + 704], rdx      # 8-byte Spill
	mov	r11, qword ptr [rbp + 56]
	mov	rax, r11
	mov	r9, rbx
	mul	rbx
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, r11
	mul	r13
	mov	qword ptr [rsp + 824], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 792], rax      # 8-byte Spill
	mov	rax, r11
	mul	r14
	mov	qword ptr [rsp + 832], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 808], rax      # 8-byte Spill
	mov	rax, r11
	mul	rsi
	mov	qword ptr [rsp + 856], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 840], rax      # 8-byte Spill
	mov	rax, r11
	mul	r10
	mov	qword ptr [rsp + 368], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 872], rax      # 8-byte Spill
	mov	rax, r11
	mul	r12
	mov	rbx, rdx
	mov	qword ptr [rsp + 912], rax      # 8-byte Spill
	mov	rax, r11
	mul	r15
	mov	qword ptr [rsp + 456], rax      # 8-byte Spill
	mov	r15, rdx
	mov	r8, qword ptr [rbp + 48]
	mov	rax, r8
	mul	r9
	mov	qword ptr [rsp + 664], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 640], rax      # 8-byte Spill
	mov	rax, r8
	mul	r13
	mov	qword ptr [rsp + 672], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 648], rax      # 8-byte Spill
	mov	rax, r8
	mul	r14
	mov	qword ptr [rsp + 720], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 688], rax      # 8-byte Spill
	mov	rax, r8
	mul	rsi
	mov	qword ptr [rsp + 768], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 744], rax      # 8-byte Spill
	mov	rax, r8
	mul	r10
	mov	qword ptr [rsp + 800], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 776], rax      # 8-byte Spill
	mov	rax, r8
	mul	r12
	mov	qword ptr [rsp + 320], rax      # 8-byte Spill
	mov	qword ptr [rsp + 336], rdx      # 8-byte Spill
	mov	r12, qword ptr [rbp + 40]
	mov	rax, r12
	mul	r9
	mov	qword ptr [rsp + 520], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 512], rax      # 8-byte Spill
	mov	rax, r12
	mul	r13
	mov	qword ptr [rsp + 544], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 528], rax      # 8-byte Spill
	mov	rax, r12
	mul	r14
	mov	qword ptr [rsp + 592], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 576], rax      # 8-byte Spill
	mov	rax, r12
	mul	rsi
	mov	qword ptr [rsp + 680], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 656], rax      # 8-byte Spill
	mov	rax, r12
	mul	r10
	mov	qword ptr [rsp + 264], rax      # 8-byte Spill
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	r10, qword ptr [rbp + 32]
	mov	rax, r10
	mul	r9
	mov	qword ptr [rsp + 448], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 440], rax      # 8-byte Spill
	mov	rax, r10
	mul	r13
	mov	qword ptr [rsp + 488], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 480], rax      # 8-byte Spill
	mov	rax, r10
	mul	r14
	mov	qword ptr [rsp + 552], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 536], rax      # 8-byte Spill
	mov	rax, r10
	mul	rsi
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mov	qword ptr [rsp + 224], rdx      # 8-byte Spill
	mov	rsi, qword ptr [rbp + 24]
	mov	rax, rsi
	mul	r9
	mov	qword ptr [rsp + 416], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 384], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r13
	mov	qword ptr [rsp + 472], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 464], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r14
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mov	r14, qword ptr [rbp + 16]
	mov	qword ptr [rsp - 80], rbp       # 8-byte Spill
	mov	rax, r14
	mul	r9
	mov	qword ptr [rsp + 432], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 408], rax      # 8-byte Spill
	mov	rax, r14
	mul	r13
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	r13, qword ptr [rbp + 8]
	mov	rax, r13
	mul	r9
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	r9, qword ptr [rcx]
	mov	rax, r9
	mul	qword ptr [rsp - 56]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 1104], rax     # 8-byte Spill
	mov	rax, r11
	mov	rcx, qword ptr [rsp - 120]      # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 1096], rdx     # 8-byte Spill
	mov	qword ptr [rsp + 1088], rax     # 8-byte Spill
	mov	rax, r9
	mul	r11
	mov	qword ptr [rsp + 1056], rdx     # 8-byte Spill
	mov	qword ptr [rsp + 1040], rax     # 8-byte Spill
	mov	rax, r8
	mov	rbp, qword ptr [rsp - 112]      # 8-byte Reload
	mul	rbp
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 1080], rax     # 8-byte Spill
	mov	rax, r8
	mul	rcx
	mov	r11, rcx
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 712], rax      # 8-byte Spill
	mov	rax, r9
	mul	r8
	mov	qword ptr [rsp + 888], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 880], rax      # 8-byte Spill
	mov	rax, r12
	mov	rcx, qword ptr [rsp - 128]      # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 1048], rdx     # 8-byte Spill
	mov	qword ptr [rsp + 1032], rax     # 8-byte Spill
	mov	rax, r12
	mul	rbp
	mov	r8, rbp
	mov	qword ptr [rsp + 920], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 896], rax      # 8-byte Spill
	mov	rax, r12
	mul	r11
	mov	qword ptr [rsp + 752], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 728], rax      # 8-byte Spill
	mov	rax, r9
	mul	r12
	mov	qword ptr [rsp + 600], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 584], rax      # 8-byte Spill
	mov	rax, r10
	mov	rbp, qword ptr [rsp - 104]      # 8-byte Reload
	mul	rbp
	mov	qword ptr [rsp + 944], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 936], rax      # 8-byte Spill
	mov	rax, r10
	mul	rcx
	mov	qword ptr [rsp + 864], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 848], rax      # 8-byte Spill
	mov	rax, r10
	mov	rcx, r8
	mul	r8
	mov	qword ptr [rsp + 632], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 616], rax      # 8-byte Spill
	mov	rax, r10
	mul	r11
	mov	r8, r11
	mov	qword ptr [rsp + 424], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 400], rax      # 8-byte Spill
	mov	rax, r9
	mul	r10
	mov	qword ptr [rsp + 344], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 312], rax      # 8-byte Spill
	mov	rax, rsi
	mov	r12, qword ptr [rsp - 96]       # 8-byte Reload
	mul	r12
	mov	qword ptr [rsp + 928], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 904], rax      # 8-byte Spill
	mov	rax, rsi
	mul	rbp
	mov	qword ptr [rsp + 760], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 736], rax      # 8-byte Spill
	mov	rax, rsi
	mov	r11, qword ptr [rsp - 128]      # 8-byte Reload
	mul	r11
	mov	qword ptr [rsp + 504], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 496], rax      # 8-byte Spill
	mov	rax, rsi
	mul	rcx
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r8
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 232], rax      # 8-byte Spill
	mov	rax, r9
	mul	rsi
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 200], rax      # 8-byte Spill
	mov	rax, r14
	mov	r10, qword ptr [rsp - 88]       # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp + 816], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 784], rax      # 8-byte Spill
	mov	rax, r14
	mul	r12
	mov	qword ptr [rsp + 568], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 560], rax      # 8-byte Spill
	mov	rax, r14
	mul	rbp
	mov	qword ptr [rsp + 360], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 352], rax      # 8-byte Spill
	mov	rax, r14
	mul	r11
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 248], rax      # 8-byte Spill
	mov	rax, r14
	mul	rcx
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 144], rax      # 8-byte Spill
	mov	rax, r14
	mul	r8
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 88], rax       # 8-byte Spill
	mov	rax, r9
	mul	r14
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	rax, r13
	mov	rsi, qword ptr [rsp - 72]       # 8-byte Reload
	mul	rsi
	mov	qword ptr [rsp + 624], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 608], rax      # 8-byte Spill
	mov	rax, r13
	mul	r10
	mov	qword ptr [rsp + 392], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 376], rax      # 8-byte Spill
	mov	rax, r13
	mul	r12
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 272], rax      # 8-byte Spill
	mov	rax, r13
	mul	rbp
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	mov	rax, r13
	mul	r11
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	mov	rax, r13
	mul	rcx
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mov	rax, r13
	mul	r8
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	rax, r9
	mul	r13
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	mov	r14, qword ptr [rax]
	mov	rax, r14
	mul	qword ptr [rsp - 64]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rax, r14
	mul	rsi
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mov	rax, r14
	mul	r10
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 168], rax      # 8-byte Spill
	mov	rax, r14
	mul	r12
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 72], rax       # 8-byte Spill
	mov	rax, r14
	mul	rbp
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rax, r14
	mul	r11
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	rax, r14
	mul	rcx
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rax, r14
	mul	r8
	mov	rcx, rdx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, r14
	mul	r9
	mov	rbp, qword ptr [rsp + 456]      # 8-byte Reload
	add	rbp, qword ptr [rsp + 696]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 704]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp + 320]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 336]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 280]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp + 216]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 224]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp + 184]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 192]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	rbp, rax
	adc	r15, rdx
	mov	rax, r15
	shld	r15, rbp, 6
	shr	rax, 58
	mov	rdx, qword ptr [rsp + 1008]     # 8-byte Reload
	add	qword ptr [rsp - 48], rdx       # 8-byte Folded Spill
	mov	rdx, qword ptr [rsp + 1024]     # 8-byte Reload
	adc	qword ptr [rsp - 40], rdx       # 8-byte Folded Spill
	mov	r14, qword ptr [rsp + 792]      # 8-byte Reload
	add	r14, qword ptr [rsp + 976]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 824]      # 8-byte Reload
	adc	rdx, qword ptr [rsp + 992]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 640]      # 8-byte Folded Reload
	mov	r11, r14
	adc	rdx, qword ptr [rsp + 664]      # 8-byte Folded Reload
	mov	r9, rdx
	mov	r12, qword ptr [rsp + 808]      # 8-byte Reload
	add	r12, qword ptr [rsp + 952]      # 8-byte Folded Reload
	mov	r10, qword ptr [rsp + 832]      # 8-byte Reload
	adc	r10, qword ptr [rsp + 960]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 648]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 672]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 512]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 520]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 840]      # 8-byte Reload
	add	r14, qword ptr [rsp + 968]      # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp + 856]      # 8-byte Reload
	adc	rsi, qword ptr [rsp + 984]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 688]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 720]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 528]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 544]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 440]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 448]      # 8-byte Folded Reload
	mov	r13, qword ptr [rsp + 872]      # 8-byte Reload
	add	r13, qword ptr [rsp + 1000]     # 8-byte Folded Reload
	mov	r8, qword ptr [rsp + 368]       # 8-byte Reload
	adc	r8, qword ptr [rsp + 1016]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 744]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 768]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 576]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 592]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 480]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 488]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 384]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 416]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 912]      # 8-byte Reload
	add	rdx, qword ptr [rsp + 1064]     # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 1072]     # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 776]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 800]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 656]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 680]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 536]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 552]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 464]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 472]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 408]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 432]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	rdx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rbx, rcx
	add	rdx, r15
	mov	rcx, rdx
	adc	rbx, rax
	mov	rdx, rbx
	shr	rdx, 58
	shld	rbx, rcx, 6
	movabs	rax, 288230376151711743
	and	rcx, rax
	add	r13, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 16]        # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 64]        # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 112]       # 8-byte Folded Reload
	add	r13, rbx
	adc	r8, rdx
	mov	rdx, r8
	shr	rdx, 58
	shld	r8, r13, 6
	and	r13, rax
	add	r14, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 200]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 208]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r14, r8
	adc	rsi, rdx
	mov	rdx, rsi
	shr	rdx, 58
	shld	rsi, r14, 6
	and	r14, rax
	add	r12, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 240]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 144]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 160]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 96]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 312]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 344]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	r12, rsi
	adc	r10, rdx
	mov	rdx, r10
	shr	rdx, 58
	shld	r10, r12, 6
	mov	r8, r10
	and	r12, rax
	mov	rbx, r12
	mov	r10, r11
	add	r10, qword ptr [rsp + 400]      # 8-byte Folded Reload
	mov	rsi, r9
	adc	rsi, qword ptr [rsp + 424]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 304]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 328]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 256]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 152]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 176]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 584]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 600]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r10, r8
	adc	rsi, rdx
	mov	rdx, rsi
	shr	rdx, 58
	shld	rsi, r10, 6
	mov	r12, rsi
	and	r10, rax
	mov	r8, qword ptr [rsp - 48]        # 8-byte Reload
	add	r8, qword ptr [rsp + 728]       # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp - 40]       # 8-byte Reload
	adc	rsi, qword ptr [rsp + 752]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 616]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 632]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 496]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 504]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 352]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 360]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 272]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 288]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 880]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 888]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 168]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	r8, r12
	adc	rsi, rdx
	mov	rdx, rsi
	shr	rdx, 58
	shld	rsi, r8, 6
	and	r8, rax
	mov	r15, qword ptr [rsp + 712]      # 8-byte Reload
	add	r15, qword ptr [rsp + 1112]     # 8-byte Folded Reload
	mov	r9, qword ptr [rsp - 24]        # 8-byte Reload
	adc	r9, qword ptr [rsp + 1120]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 896]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 920]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 848]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 864]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 736]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 760]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 560]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 568]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 376]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 392]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 1040]     # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 1056]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 296]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	add	r15, rsi
	adc	r9, rdx
	mov	rdx, r9
	shr	rdx, 58
	shld	r9, r15, 6
	mov	rsi, r9
	and	r15, rax
	mov	r12, qword ptr [rsp + 1080]     # 8-byte Reload
	add	r12, qword ptr [rsp + 1088]     # 8-byte Folded Reload
	mov	r9, qword ptr [rsp + 56]        # 8-byte Reload
	adc	r9, qword ptr [rsp + 1096]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 1032]     # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 1048]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 936]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 944]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 904]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 928]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 784]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 816]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 608]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 624]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 1104]     # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 56]        # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 64]        # 8-byte Folded Reload
	add	r12, rsi
	adc	r9, rdx
	mov	rsi, r9
	shld	r9, r12, 7
	movabs	rdx, 144115188075855871
	and	rdx, r12
	shr	rsi, 57
	and	rbp, rax
	add	rbp, r9
	adc	rsi, 0
	shld	rsi, rbp, 6
	add	rsi, rcx
	mov	rcx, rsi
	shr	rcx, 58
	add	rcx, r13
	and	rbp, rax
	and	rsi, rax
	mov	qword ptr [rdi], rbp
	mov	qword ptr [rdi + 8], rsi
	mov	qword ptr [rdi + 16], rcx
	mov	qword ptr [rdi + 24], r14
	mov	qword ptr [rdi + 32], rbx
	mov	qword ptr [rdi + 40], r10
	mov	qword ptr [rdi + 48], r8
	mov	qword ptr [rdi + 56], r15
	mov	qword ptr [rdi + 64], rdx
	add	rsp, 1128
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
	.size	rust_fiat_p521_carry_mul, .Lfunc_end0-rust_fiat_p521_carry_mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"
	.section	".note.GNU-stack","",@progbits

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
	sub	rsp, 736
	.cfi_def_cfa_offset 792
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r14, rdx
	mov	qword ptr [rsp - 72], rsi       # 8-byte Spill
	mov	r8, qword ptr [rsi + 56]
	mov	r10, qword ptr [rdx + 56]
	mov	qword ptr [rsp - 80], r10       # 8-byte Spill
	mov	rdx, r10
	mulx	rax, rcx, r8
	mov	qword ptr [rsp + 24], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	mov	r9, qword ptr [r14 + 48]
	mov	rdx, r9
	mulx	rax, rcx, r8
	mov	qword ptr [rsp + 544], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 560], rax      # 8-byte Spill
	mov	rdx, qword ptr [r14 + 40]
	mov	r13, rdx
	mulx	rax, rcx, r8
	mov	qword ptr [rsp + 552], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 568], rax      # 8-byte Spill
	mov	r12, qword ptr [rsi + 48]
	mov	rdx, r12
	mulx	rcx, rax, r10
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mulx	rax, rcx, r9
	mov	qword ptr [rsp + 360], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 368], rax      # 8-byte Spill
	mov	rbp, r9
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	mov	r15, qword ptr [rsi + 40]
	mov	rdx, r15
	mulx	rax, rcx, r10
	mov	qword ptr [rsp + 528], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 536], rax      # 8-byte Spill
	mov	r10, qword ptr [r14 + 32]
	mov	rdx, r10
	mov	qword ptr [rsp + 16], r8        # 8-byte Spill
	mulx	rax, rcx, r8
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rax, qword ptr [r14 + 24]
	mov	rdx, rax
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 728], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	rbx, qword ptr [r14 + 16]
	mov	rdx, rbx
	mov	qword ptr [rsp + 56], rbx       # 8-byte Spill
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 128], rsi      # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, qword ptr [r14 + 8]
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp - 48], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rdx, r12
	mulx	r9, rcx, r13
	mov	rdx, r10
	mulx	rdx, rsi, r12
	mov	qword ptr [rsp + 720], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	rdx, rax
	mov	r8, rax
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mulx	rdx, rsi, r12
	mov	qword ptr [rsp + 712], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, rsi, r12
	mov	qword ptr [rsp - 56], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 520], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rbp, rsi, rbp
	add	rsi, rcx
	adc	rbp, r9
	add	rsi, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 24]       # 8-byte Folded Reload
	mov	rbx, r15
	mulx	r9, rax, r13
	mov	qword ptr [rsp + 448], rax      # 8-byte Spill
	mov	qword ptr [rsp - 120], r10      # 8-byte Spill
	mov	rdx, r10
	mulx	rcx, rax, r15
	mov	qword ptr [rsp + 104], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rdx, r8
	mulx	rcx, rax, r15
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	r8, qword ptr [rsp - 72]        # 8-byte Reload
	mov	rax, qword ptr [r8 + 32]
	mov	rdx, rax
	mov	r15, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	rcx, rdx, r15
	add	rsi, rdx
	mov	qword ptr [rsp - 104], rsi      # 8-byte Spill
	adc	rbp, rcx
	mov	qword ptr [rsp - 96], rbp       # 8-byte Spill
	mov	rdx, rax
	mov	r11, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rcx, rdx, r11
	mov	qword ptr [rsp + 664], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 696], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, rdx, r13
	mov	rbp, r13
	mov	qword ptr [rsp - 112], r13      # 8-byte Spill
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, rdx, r10
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mov	rcx, qword ptr [r8 + 24]
	mov	rdx, rcx
	mov	r13, r15
	mulx	rdx, rsi, r15
	mov	qword ptr [rsp + 680], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 704], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r11
	mov	qword ptr [rsp + 488], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 504], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, rbp
	mov	qword ptr [rsp + 72], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	mov	r15, qword ptr [r14]
	mov	rbp, qword ptr [r8 + 16]
	mov	rdx, rbp
	mulx	rdx, rsi, r13
	mov	r14, r13
	mov	qword ptr [rsp + 496], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 512], rdx      # 8-byte Spill
	mov	rdx, rbp
	mulx	rdx, rsi, r11
	mov	qword ptr [rsp + 328], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 336], rdx      # 8-byte Spill
	mov	r13, qword ptr [r8 + 8]
	mov	rdx, r13
	mulx	rdx, rsi, r14
	mov	qword ptr [rsp + 344], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 352], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, rsi, qword ptr [rsp + 16]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 248], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	rsi, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rdx, rsi
	mulx	rdx, r8, r12
	mov	qword ptr [rsp + 224], r8       # 8-byte Spill
	mov	qword ptr [rsp + 232], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, r11, r12
	mov	qword ptr [rsp + 656], r11      # 8-byte Spill
	mov	qword ptr [rsp + 672], rdx      # 8-byte Spill
	mov	r8, qword ptr [rsp + 56]        # 8-byte Reload
	mov	rdx, r8
	mulx	r12, r11, rbx
	mov	rdx, rsi
	mulx	rdx, r14, rbx
	mov	qword ptr [rsp + 608], r14      # 8-byte Spill
	mov	qword ptr [rsp + 632], rdx      # 8-byte Spill
	mov	rdx, r15
	mulx	rdx, r14, rbx
	mov	qword ptr [rsp + 472], r14      # 8-byte Spill
	mov	qword ptr [rsp + 480], rdx      # 8-byte Spill
	mov	rdx, rax
	mov	rbx, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	rdx, r10, rbx
	mov	qword ptr [rsp + 200], r10      # 8-byte Spill
	mov	qword ptr [rsp + 216], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r14, r8
	mov	r10, r8
	mov	qword ptr [rsp + 624], r14      # 8-byte Spill
	mov	qword ptr [rsp + 648], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r14, rsi
	mov	qword ptr [rsp + 424], r14      # 8-byte Spill
	mov	qword ptr [rsp + 440], rdx      # 8-byte Spill
	mov	r8, rsi
	mov	r14, r15
	mov	rdx, r15
	mulx	rax, rdx, rax
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 320], rax      # 8-byte Spill
	mov	rdx, rcx
	mov	r15, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rax, rdx, r15
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 208], rax      # 8-byte Spill
	mov	rdx, rcx
	mulx	rax, rdx, rbx
	mov	qword ptr [rsp + 616], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 640], rax      # 8-byte Spill
	mov	rdx, rcx
	mov	rax, r10
	mulx	rdx, rsi, r10
	mov	qword ptr [rsp + 416], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 432], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 296], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 304], rdx      # 8-byte Spill
	mov	rdx, r14
	mov	qword ptr [rsp + 48], r14       # 8-byte Spill
	mulx	rcx, rdx, rcx
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	qword ptr [rsp + 8], rcx        # 8-byte Spill
	mov	rdx, rbp
	mov	r10, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	rcx, rdx, r10
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 184], rcx      # 8-byte Spill
	mov	rdx, rbp
	mulx	rcx, rdx, r15
	mov	qword ptr [rsp + 592], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 600], rcx      # 8-byte Spill
	mov	rdx, rbp
	mulx	rcx, rdx, rbx
	mov	qword ptr [rsp + 400], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 408], rcx      # 8-byte Spill
	mov	rdx, rbp
	mulx	rcx, rdx, rax
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 288], rcx      # 8-byte Spill
	mov	rsi, rax
	mov	rdx, rbp
	mulx	rcx, rax, r8
	mov	rdx, r14
	mulx	rdx, rbp, rbp
	mov	qword ptr [rsp + 688], rbp      # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	rdx, r13
	mov	r15, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rdx, r14, r15
	mov	qword ptr [rsp + 160], r14      # 8-byte Spill
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	mov	rdx, r13
	mulx	rdx, r14, r10
	mov	qword ptr [rsp + 576], r14      # 8-byte Spill
	mov	qword ptr [rsp + 584], rdx      # 8-byte Spill
	mov	rdx, r13
	mov	rbx, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rdx, r14, rbx
	mov	qword ptr [rsp + 384], r14      # 8-byte Spill
	mov	qword ptr [rsp + 392], rdx      # 8-byte Spill
	mov	rdx, r13
	mov	r10, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	rdx, r14, r10
	mov	qword ptr [rsp + 264], r14      # 8-byte Spill
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	rdx, r13
	mulx	rdx, rbp, rsi
	add	rax, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	rax, rbp
	adc	rcx, rdx
	add	rax, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rsi, qword ptr [rdx]
	mov	rdx, r13
	mulx	rdx, r14, r8
	mov	qword ptr [rsp], r14            # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rdx, r14, r13
	mov	qword ptr [rsp + 456], r14      # 8-byte Spill
	mov	qword ptr [rsp + 464], rdx      # 8-byte Spill
	mov	rdx, rsi
	mulx	r13, rbp, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mulx	rdx, r14, r15
	mov	qword ptr [rsp - 88], r14       # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r14, qword ptr [rsp - 112] # 8-byte Folded Reload
	mov	qword ptr [rsp + 376], r14      # 8-byte Spill
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r8, rbx
	mov	qword ptr [rsp + 240], r8       # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, rsi
	mulx	rdx, r15, r10
	add	rax, r15
	adc	rcx, rdx
	shld	rcx, rax, 8
	mov	dl, 56
	bzhi	rax, rax, rdx
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	dl, 56
	add	r11, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 232]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 200]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 216]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 192]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 208]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 168]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 256]      # 8-byte Folded Reload
	add	r11, rbp
	adc	r12, r13
	mov	r13, qword ptr [rsp + 152]      # 8-byte Reload
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	shld	r13, rax, 1
	mov	rax, qword ptr [rsp + 544]      # 8-byte Reload
	add	qword ptr [rsp - 128], rax      # 8-byte Folded Spill
	mov	rax, qword ptr [rsp + 560]      # 8-byte Reload
	adc	qword ptr [rsp - 8], rax        # 8-byte Folded Spill
	mov	r10, qword ptr [rsp + 360]      # 8-byte Reload
	add	r10, qword ptr [rsp + 552]      # 8-byte Folded Reload
	mov	r8, qword ptr [rsp + 368]       # 8-byte Reload
	adc	r8, qword ptr [rsp + 568]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 528]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 536]       # 8-byte Folded Reload
	shld	r12, r11, 8
	bzhi	rax, r11, rdx
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	r11, r8
	shld	r11, r10, 1
	lea	rax, [r10 + r10]
	add	rax, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 520]      # 8-byte Reload
	adc	r11, rbp
	add	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 80]       # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 296]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 304]      # 8-byte Folded Reload
	mov	r15, qword ptr [rsp + 328]      # 8-byte Reload
	add	rax, r15
	mov	rbx, qword ptr [rsp + 336]      # 8-byte Reload
	adc	r11, rbx
	add	rax, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 288]      # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 344]      # 8-byte Reload
	add	rax, r14
	mov	rdx, qword ptr [rsp + 352]      # 8-byte Reload
	adc	r11, rdx
	add	rax, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 272]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 312]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 320]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 240]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rax, rcx
	adc	r11, 0
	add	rax, r12
	adc	r11, 0
	shld	r11, rax, 8
	mov	cl, 56
	bzhi	rax, rax, rcx
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	add	r10, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 64]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r8, rbp
	add	r10, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 40]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 80]        # 8-byte Folded Reload
	add	r10, r15
	adc	r8, rbx
	add	r10, r14
	adc	r8, rdx
	mov	rbx, r8
	mov	rdx, rsi
	mulx	rax, rcx, qword ptr [rsp + 56]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mulx	rcx, rax, qword ptr [rsp + 40]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mulx	rdx, rsi, qword ptr [rsp + 48]  # 8-byte Folded Reload
	add	r10, rsi
	adc	rbx, rdx
	add	r10, r12
	adc	rbx, 0
	mov	r8, qword ptr [rsp - 8]         # 8-byte Reload
	mov	rsi, r8
	mov	rax, qword ptr [rsp - 128]      # 8-byte Reload
	shld	rsi, rax, 1
	lea	r14, [rax + rax]
	add	r14, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 104]      # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 712]      # 8-byte Reload
	add	r14, rbp
	adc	rsi, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 424]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 440]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp + 488]      # 8-byte Reload
	add	r14, rcx
	mov	rax, qword ptr [rsp + 504]      # 8-byte Reload
	adc	rsi, rax
	add	r14, qword ptr [rsp + 416]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 432]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp + 496]      # 8-byte Reload
	add	r14, r12
	mov	r15, qword ptr [rsp + 512]      # 8-byte Reload
	adc	rsi, r15
	add	r14, qword ptr [rsp + 400]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 408]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 384]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 392]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 472]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 480]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 376]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r14, r11
	adc	rsi, 0
	shld	rbx, r10, 8
	mov	dl, 56
	bzhi	rdx, r10, rdx
	mov	r10b, 56
	mov	r11, qword ptr [rsp - 128]      # 8-byte Reload
	add	r11, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 104]       # 8-byte Folded Reload
	add	r11, rbp
	adc	r8, qword ptr [rsp + 120]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	add	r11, rcx
	adc	r8, rax
	add	r11, r12
	adc	r8, r15
	add	r11, qword ptr [rsp + 456]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 464]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	add	r11, rbx
	mov	qword ptr [rsp - 128], r11      # 8-byte Spill
	adc	r8, 0
	mov	qword ptr [rsp - 8], r8         # 8-byte Spill
	shld	rsi, r14, 8
	bzhi	rax, r14, r10
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 24]       # 8-byte Reload
	lea	r10, [rax + rax]
	mov	rbx, qword ptr [rsp + 448]      # 8-byte Reload
	add	r10, rbx
	adc	r13, r9
	mov	rbp, qword ptr [rsp + 720]      # 8-byte Reload
	add	r10, rbp
	adc	r13, qword ptr [rsp + 136]      # 8-byte Folded Reload
	mov	r12, qword ptr [rsp + 728]      # 8-byte Reload
	add	r10, r12
	adc	r13, qword ptr [rsp + 144]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 608]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 632]      # 8-byte Folded Reload
	mov	r8, qword ptr [rsp + 664]       # 8-byte Reload
	add	r10, r8
	mov	rcx, qword ptr [rsp + 696]      # 8-byte Reload
	adc	r13, rcx
	add	r10, qword ptr [rsp + 624]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 648]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp + 680]      # 8-byte Reload
	add	r10, r11
	mov	rax, qword ptr [rsp + 704]      # 8-byte Reload
	adc	r13, rax
	add	r10, qword ptr [rsp + 616]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 640]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 592]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 600]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 576]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 584]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp + 656]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 672]      # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r10, rsi
	adc	r13, 0
	mov	rsi, qword ptr [rsp - 8]        # 8-byte Reload
	mov	r14, qword ptr [rsp - 128]      # 8-byte Reload
	shld	rsi, r14, 8
	mov	r15b, 56
	bzhi	r14, r14, r15
	mov	qword ptr [rsp - 128], r14      # 8-byte Spill
	add	rbx, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 152]       # 8-byte Folded Reload
	add	rbx, rbp
	adc	r9, qword ptr [rsp + 136]       # 8-byte Folded Reload
	add	rbx, r12
	adc	r9, qword ptr [rsp + 144]       # 8-byte Folded Reload
	add	rbx, r8
	adc	r9, rcx
	add	rbx, r11
	adc	r9, rax
	add	rbx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 8]         # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 688]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 16]        # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 40]        # 8-byte Folded Reload
	add	rbx, rsi
	adc	r9, 0
	shld	r13, r10, 8
	add	r13, qword ptr [rsp - 96]       # 8-byte Folded Reload
	shld	r9, rbx, 8
	add	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	mov	al, 56
	bzhi	rcx, r9, rax
	shr	r9, 56
	add	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	bzhi	rsi, r13, rax
	shr	r13, 56
	add	rdx, r13
	add	r9, r13
	bzhi	r11, r9, rax
	shr	r9, 56
	add	r9, qword ptr [rsp - 16]        # 8-byte Folded Reload
	bzhi	r8, r10, rax
	bzhi	r10, rbx, rax
	bzhi	rbx, rdx, rax
	shr	rdx, 56
	add	rdx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	qword ptr [rdi], rbx
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], r10
	mov	qword ptr [rdi + 24], rcx
	mov	qword ptr [rdi + 32], r11
	mov	qword ptr [rdi + 40], r9
	mov	qword ptr [rdi + 48], r8
	mov	qword ptr [rdi + 56], rsi
	add	rsp, 736
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

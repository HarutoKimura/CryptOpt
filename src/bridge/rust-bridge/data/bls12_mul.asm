	.text
	.intel_syntax noprefix
	.file	"bls12_mul.bc25e67ccba6104a-cgu.0"
	.globl	bls12_mul                       # -- Begin function bls12_mul
	.p2align	4, 0x90
	.type	bls12_mul,@function
bls12_mul:                              # @bls12_mul
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
	sub	rsp, 392
	.cfi_def_cfa_offset 448
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	test	rcx, rcx
	je	.LBB0_19
# %bb.1:                                # %bb1
	cmp	rcx, 1
	je	.LBB0_21
# %bb.2:                                # %bb2
	cmp	rcx, 2
	jbe	.LBB0_22
# %bb.3:                                # %bb3
	cmp	rcx, 3
	je	.LBB0_23
# %bb.4:                                # %bb4
	cmp	rcx, 4
	jbe	.LBB0_24
# %bb.5:                                # %bb5
	cmp	rcx, 5
	je	.LBB0_25
# %bb.6:                                # %bb6
	test	r9, r9
	je	.LBB0_26
# %bb.7:                                # %bb7
	cmp	r9, 1
	je	.LBB0_27
# %bb.8:                                # %bb8
	cmp	r9, 2
	jbe	.LBB0_28
# %bb.9:                                # %bb9
	cmp	r9, 3
	je	.LBB0_29
# %bb.10:                               # %bb10
	cmp	r9, 4
	jbe	.LBB0_30
# %bb.11:                               # %bb11
	mov	qword ptr [rsp + 384], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 376], rdi      # 8-byte Spill
	cmp	r9, 5
	je	.LBB0_31
# %bb.12:                               # %bb12
	mov	r12, qword ptr [rdx]
	mov	rcx, qword ptr [r8 + 8]
	mov	qword ptr [rsp + 280], rcx      # 8-byte Spill
	mov	rax, qword ptr [r8 + 16]
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mul	r12
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	rsi, rax
	mov	rax, rcx
	mul	r12
	mov	r11, rax
	mov	r14, rdx
	mov	rax, qword ptr [r8]
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	mul	r12
	mov	rdi, rdx
	movabs	rcx, -8506173809081122819
	mov	rdx, rax
	mov	r10, rax
	imul	r10, rcx
	mov	qword ptr [rsp + 48], r10       # 8-byte Spill
	movabs	rax, 5532603552561700244
	mov	rbx, rdx
	mov	rcx, rdx
	imul	rbx, rax
	mov	rbp, r8
	movabs	rdx, 2210141511517208575
	mov	rax, r10
	mul	rdx
	mov	r9, rdx
	movabs	rax, 436827220531937283
	mov	r8, rcx
	mov	r13, rcx
	mov	qword ptr [rsp + 8], rcx        # 8-byte Spill
	imul	r8, rax
	movabs	rcx, -5044313057631688021
	mov	rax, r10
	mul	rcx
	mov	rcx, rdx
	add	rcx, r8
	adc	r9, rbx
	xor	eax, eax
	test	r13, r13
	setne	al
	add	rdi, r11
	adc	r14, rsi
	setb	r15b
	lea	rdx, [rdi + rax]
	xor	esi, esi
	add	rcx, rdx
	setb	sil
	add	rdi, rax
	adc	rsi, r14
	setb	r10b
	mov	qword ptr [rsp + 112], rbp      # 8-byte Spill
	mov	rax, qword ptr [rbp + 32]
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	qword ptr [rsp + 152], r12      # 8-byte Spill
	mul	r12
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	rax, qword ptr [rbp + 24]
	mov	qword ptr [rsp + 120], rax      # 8-byte Spill
	mul	r12
	mov	r12, rax
	mov	r13, rdx
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r11, qword ptr [rax + 8]
	mov	qword ptr [rsp + 144], r11      # 8-byte Spill
	mov	rax, qword ptr [rsp + 104]      # 8-byte Reload
	mul	r11
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	r8, rax
	mov	rax, qword ptr [rsp + 280]      # 8-byte Reload
	mul	r11
	mov	rdi, rdx
	mov	rbp, rax
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	r11
	mov	r14, rax
	mov	r11, rdx
	add	r11, rbp
	adc	rdi, r8
	setb	byte ptr [rsp + 136]            # 1-byte Folded Spill
	add	r15b, 255
	adc	r12, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 40]       # 8-byte Folded Reload
	mov	qword ptr [rsp + 32], r13       # 8-byte Spill
	setb	byte ptr [rsp + 5]              # 1-byte Folded Spill
	xor	ebp, ebp
	mov	r13, rsi
	add	r13, r9
	setb	bpl
	add	r10b, 255
	adc	rbp, r12
	setb	byte ptr [rsp + 264]            # 1-byte Folded Spill
	movabs	rax, 3064711249896130499
	mov	r15, qword ptr [rsp + 8]        # 8-byte Reload
	imul	r15, rax
	movabs	rdx, 7435674573564081700
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	rdx
	mov	r10, rdx
	cmp	r9, rbx
	adc	r10, r15
	xor	r8d, r8d
	add	rbp, r10
	setb	r8b
	mov	rax, rcx
	add	rax, r14
	adc	rsi, r9
	add	rcx, r14
	adc	r13, r11
	lea	r9, [rsi + r11]
	adc	rbp, rdi
	setb	sil
	mov	rbx, rcx
	movabs	rax, -8506173809081122819
	imul	rbx, rax
	mov	qword ptr [rsp + 160], rbx      # 8-byte Spill
	mov	r14, rcx
	movabs	rax, 5532603552561700244
	imul	r14, rax
	mov	r11, rcx
	mov	r12, rcx
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	r11, rax
	mov	rax, rbx
	movabs	rcx, 2210141511517208575
	mul	rcx
	mov	rdi, rdx
	mov	rax, rbx
	movabs	rcx, -5044313057631688021
	mul	rcx
	add	rdx, r11
	mov	rcx, rdx
	adc	rdi, r14
	xor	eax, eax
	test	r12, r12
	setne	al
	lea	rdx, [r9 + rax]
	xor	r13d, r13d
	add	rcx, rdx
	mov	qword ptr [rsp + 24], rcx       # 8-byte Spill
	setb	r13b
	add	r9, rax
	adc	r13, rbp
	setb	r12b
	mov	rax, qword ptr [rsp + 128]      # 8-byte Reload
	mov	rcx, qword ptr [rsp + 144]      # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	r9, rax
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	rcx
	mov	r11, rax
	add	byte ptr [rsp + 136], 255       # 1-byte Folded Spill
	adc	r11, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rdx, r9
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 328]            # 1-byte Folded Spill
	add	byte ptr [rsp + 264], 255       # 1-byte Folded Spill
	adc	r8, qword ptr [rsp + 32]        # 8-byte Folded Reload
	setb	byte ptr [rsp + 232]            # 1-byte Folded Spill
	movabs	rax, 2995800253092329851
	mov	r9, qword ptr [rsp + 8]         # 8-byte Reload
	imul	r9, rax
	mov	qword ptr [rsp + 88], r9        # 8-byte Spill
	movabs	rcx, 7239337960414712511
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	rcx
	cmp	r10, r15
	adc	rdx, r9
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	xor	ebx, ebx
	add	r8, rdx
	setb	bl
	add	sil, 255
	adc	r8, r11
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	xor	esi, esi
	mov	rbp, r13
	add	rbp, rdi
	setb	sil
	add	r12b, 255
	adc	rsi, r8
	setb	byte ptr [rsp + 72]             # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp + 40]       # 8-byte Reload
	movabs	rax, 3064711249896130499
	imul	rcx, rax
	mov	qword ptr [rsp + 224], rcx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	movabs	rdx, 7435674573564081700
	mul	rdx
	cmp	rdi, r14
	adc	rdx, rcx
	mov	r11, rdx
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r9, qword ptr [rax + 16]
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	r9
	mov	r14, rax
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	r12, qword ptr [rsp + 24]       # 8-byte Reload
	mov	r8, r12
	add	r8, rax
	adc	r13, rdi
	mov	rdi, r8
	movabs	rax, -8506173809081122819
	imul	rdi, rax
	mov	qword ptr [rsp + 32], rdi       # 8-byte Spill
	mov	rax, r8
	movabs	rcx, 5532603552561700244
	imul	rax, rcx
	mov	rcx, rax
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	r8, rax
	mov	rax, rdi
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	r15, rdx
	mov	rax, rdi
	movabs	rdx, -5044313057631688021
	mul	rdx
	mov	r10, rdx
	add	r10, r8
	adc	r15, rcx
	mov	qword ptr [rsp + 200], r15      # 8-byte Spill
	xor	r15d, r15d
	add	rsi, r11
	setb	r15b
	mov	r11, qword ptr [rsp + 104]      # 8-byte Reload
	mov	rax, r11
	mul	r9
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	rdi, rax
	mov	rcx, qword ptr [rsp + 280]      # 8-byte Reload
	mov	rax, rcx
	mul	r9
	add	rax, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rdx, rdi
	setb	dil
	add	r12, r14
	lea	r8, [r13 + rax]
	adc	rax, rbp
	adc	rdx, rsi
	setb	byte ptr [rsp + 176]            # 1-byte Folded Spill
	xor	eax, eax
	test	r12, r12
	mov	qword ptr [rsp + 24], r12       # 8-byte Spill
	setne	al
	lea	rsi, [r8 + rax]
	xor	r14d, r14d
	add	r10, rsi
	mov	qword ptr [rsp + 16], r10       # 8-byte Spill
	setb	r14b
	add	r8, rax
	adc	r14, rdx
	setb	byte ptr [rsp + 296]            # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 128]      # 8-byte Reload
	mov	qword ptr [rsp + 264], r9       # 8-byte Spill
	mul	r9
	mov	qword ptr [rsp + 336], rdx      # 8-byte Spill
	mov	rsi, rax
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	r9
	mov	r8, rax
	mov	r13, rdx
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mov	r9, qword ptr [rax + 24]
	mov	qword ptr [rsp + 136], r9       # 8-byte Spill
	mov	rax, r11
	mul	r9
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	r10, rax
	mov	rax, rcx
	mul	r9
	mov	rcx, rdx
	mov	r11, rax
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	r9
	mov	r9, rax
	add	rdx, r11
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	adc	rcx, r10
	mov	qword ptr [rsp + 304], rcx      # 8-byte Spill
	setb	byte ptr [rsp + 312]            # 1-byte Folded Spill
	add	dil, 255
	adc	r8, qword ptr [rsp + 256]       # 8-byte Folded Reload
	adc	r13, rsi
	mov	qword ptr [rsp + 320], r13      # 8-byte Spill
	setb	byte ptr [rsp + 256]            # 1-byte Folded Spill
	movzx	edi, byte ptr [rsp + 5]         # 1-byte Folded Reload
	mov	eax, edi
	add	al, 255
	mov	rcx, qword ptr [rsp + 272]      # 8-byte Reload
	mov	rax, rcx
	adc	rax, 0
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mov	rax, qword ptr [rax + 40]
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	setb	sil
	mul	qword ptr [rsp + 152]           # 8-byte Folded Reload
	add	dil, 255
	adc	rax, rcx
	movzx	ecx, sil
	adc	rcx, rdx
	mov	qword ptr [rsp + 208], rcx      # 8-byte Spill
	add	byte ptr [rsp + 232], 255       # 1-byte Folded Spill
	adc	rbx, rax
	setb	byte ptr [rsp + 4]              # 1-byte Folded Spill
	movabs	rax, 326064518108171314
	mov	rsi, qword ptr [rsp + 8]        # 8-byte Reload
	imul	rsi, rax
	mov	qword ptr [rsp + 8], rsi        # 8-byte Spill
	movabs	rcx, 5412103778470702295
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	rcx
	mov	rax, qword ptr [rsp + 80]       # 8-byte Reload
	cmp	rax, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	xor	r11d, r11d
	add	rbx, rdx
	setb	r11b
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	adc	rbx, qword ptr [rsp + 248]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	add	byte ptr [rsp + 72], 255        # 1-byte Folded Spill
	adc	r15, rbx
	setb	byte ptr [rsp + 232]            # 1-byte Folded Spill
	mov	rsi, qword ptr [rsp + 40]       # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	rsi, rax
	mov	qword ptr [rsp + 80], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	movabs	rcx, 7239337960414712511
	mul	rcx
	mov	rax, qword ptr [rsp + 184]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	xor	ebx, ebx
	add	r15, rdx
	setb	bl
	add	byte ptr [rsp + 176], 255       # 1-byte Folded Spill
	adc	r15, r8
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	xor	ecx, ecx
	mov	rdi, r14
	mov	rsi, qword ptr [rsp + 200]      # 8-byte Reload
	add	rdi, rsi
	setb	cl
	add	byte ptr [rsp + 296], 255       # 1-byte Folded Spill
	adc	rcx, r15
	setb	byte ptr [rsp + 184]            # 1-byte Folded Spill
	movabs	rax, 3064711249896130499
	imul	r12, rax
	mov	qword ptr [rsp + 176], r12      # 8-byte Spill
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rdx, 7435674573564081700
	mul	rdx
	cmp	rsi, qword ptr [rsp + 216]      # 8-byte Folded Reload
	adc	rdx, r12
	mov	rbp, rdx
	mov	r10, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r8, r10
	add	r8, r9
	adc	r14, rsi
	mov	r12, r8
	movabs	rax, -8506173809081122819
	imul	r12, rax
	mov	qword ptr [rsp + 152], r12      # 8-byte Spill
	mov	rdx, r8
	movabs	rax, 5532603552561700244
	imul	rdx, rax
	mov	r13, rdx
	movabs	rax, 436827220531937283
	imul	r8, rax
	mov	rax, r12
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	r15, rdx
	mov	rax, r12
	movabs	rdx, -5044313057631688021
	mul	rdx
	add	rdx, r8
	mov	rsi, rdx
	adc	r15, r13
	mov	r12, r13
	xor	r8d, r8d
	add	rcx, rbp
	mov	r13, rbp
	setb	r8b
	add	r10, r9
	mov	qword ptr [rsp + 16], r10       # 8-byte Spill
	mov	rax, qword ptr [rsp + 168]      # 8-byte Reload
	adc	rdi, rax
	lea	rax, [r14 + rax]
	adc	rcx, qword ptr [rsp + 304]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 200]            # 1-byte Folded Spill
	xor	edx, edx
	test	r10, r10
	setne	dl
	lea	rdi, [rax + rdx]
	xor	ebp, ebp
	add	rsi, rdi
	mov	r14, rsi
	setb	bpl
	add	rax, rdx
	adc	rbp, rcx
	setb	byte ptr [rsp + 168]            # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 128]      # 8-byte Reload
	mov	rdi, qword ptr [rsp + 136]      # 8-byte Reload
	mul	rdi
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	rcx, rax
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	rdi
	mov	r10, rax
	add	byte ptr [rsp + 312], 255       # 1-byte Folded Spill
	adc	r10, qword ptr [rsp + 240]      # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 5]              # 1-byte Folded Spill
	movzx	esi, byte ptr [rsp + 328]       # 1-byte Folded Reload
	mov	eax, esi
	add	al, 255
	mov	rdi, qword ptr [rsp + 288]      # 8-byte Reload
	mov	rax, rdi
	adc	rax, 0
	setb	r9b
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mul	qword ptr [rsp + 144]           # 8-byte Folded Reload
	mov	rcx, rax
	add	sil, 255
	adc	rcx, rdi
	movzx	eax, r9b
	adc	rax, rdx
	mov	rsi, rax
	mov	qword ptr [rsp + 240], rax      # 8-byte Spill
	add	byte ptr [rsp + 4], 255         # 1-byte Folded Spill
	adc	r11, qword ptr [rsp + 208]      # 8-byte Folded Reload
	setb	dil
	movabs	rdx, 1873798617647539866
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	rdx
	mov	rax, qword ptr [rsp + 192]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	rdx, 0
	add	rdx, r11
	movzx	eax, dil
	adc	rax, rsi
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	adc	rdx, rcx
	adc	rax, 0
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	add	byte ptr [rsp + 232], 255       # 1-byte Folded Spill
	adc	rbx, rdx
	setb	byte ptr [rsp + 4]              # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp + 40]       # 8-byte Reload
	movabs	rax, 326064518108171314
	imul	rcx, rax
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	movabs	rdx, 5412103778470702295
	mul	rdx
	mov	rax, qword ptr [rsp + 72]       # 8-byte Reload
	cmp	rax, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	xor	eax, eax
	add	rbx, rdx
	setb	al
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	rbx, qword ptr [rsp + 320]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 224]            # 1-byte Folded Spill
	add	byte ptr [rsp + 184], 255       # 1-byte Folded Spill
	adc	r8, rbx
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	mov	rsi, qword ptr [rsp + 24]       # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	rsi, rax
	mov	qword ptr [rsp + 72], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rcx, 7239337960414712511
	mul	rcx
	cmp	r13, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp + 216], rdx      # 8-byte Spill
	xor	eax, eax
	add	r8, rdx
	setb	al
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	add	byte ptr [rsp + 200], 255       # 1-byte Folded Spill
	adc	r8, r10
	setb	byte ptr [rsp + 80]             # 1-byte Folded Spill
	xor	ebx, ebx
	mov	r13, rbp
	add	r13, r15
	setb	bl
	add	byte ptr [rsp + 168], 255       # 1-byte Folded Spill
	adc	rbx, r8
	setb	byte ptr [rsp + 208]            # 1-byte Folded Spill
	mov	rsi, qword ptr [rsp + 16]       # 8-byte Reload
	movabs	rax, 3064711249896130499
	imul	rsi, rax
	mov	qword ptr [rsp + 312], rsi      # 8-byte Spill
	mov	rax, qword ptr [rsp + 152]      # 8-byte Reload
	movabs	rcx, 7435674573564081700
	mul	rcx
	cmp	r15, r12
	adc	rdx, rsi
	mov	rsi, rdx
	mov	qword ptr [rsp + 296], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mov	rdi, qword ptr [rax + 32]
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	rdi
	mov	r9, rax
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	r12, r14
	mov	r8, r14
	add	r8, rax
	adc	rbp, r15
	mov	r10, r8
	movabs	rax, -8506173809081122819
	imul	r10, rax
	mov	qword ptr [rsp + 48], r10       # 8-byte Spill
	mov	rcx, r8
	movabs	rax, 5532603552561700244
	imul	rcx, rax
	mov	r11, rcx
	mov	qword ptr [rsp + 200], rcx      # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	r8, rax
	mov	rax, r10
	movabs	rcx, 2210141511517208575
	mul	rcx
	mov	r15, rdx
	mov	rax, r10
	movabs	rcx, -5044313057631688021
	mul	rcx
	mov	rcx, rdx
	add	rcx, r8
	adc	r15, r11
	mov	qword ptr [rsp + 168], r15      # 8-byte Spill
	xor	r14d, r14d
	add	rbx, rsi
	setb	r14b
	mov	r10, qword ptr [rsp + 104]      # 8-byte Reload
	mov	rax, r10
	mul	rdi
	mov	qword ptr [rsp + 344], rdx      # 8-byte Spill
	mov	r11, rax
	mov	r8, qword ptr [rsp + 280]       # 8-byte Reload
	mov	rax, r8
	mul	rdi
	add	rax, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	rdx, r11
	setb	r15b
	add	r12, r9
	mov	qword ptr [rsp + 8], r12        # 8-byte Spill
	lea	r9, [rbp + rax]
	adc	rax, r13
	adc	rdx, rbx
	setb	byte ptr [rsp + 7]              # 1-byte Folded Spill
	xor	eax, eax
	test	r12, r12
	setne	al
	lea	r11, [r9 + rax]
	xor	esi, esi
	add	rcx, r11
	mov	qword ptr [rsp + 144], rcx      # 8-byte Spill
	setb	sil
	add	r9, rax
	adc	rsi, rdx
	mov	r9, rsi
	setb	byte ptr [rsp + 6]              # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 128]      # 8-byte Reload
	mov	qword ptr [rsp + 320], rdi      # 8-byte Spill
	mul	rdi
	mov	rsi, rax
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mov	rcx, qword ptr [rax + 40]
	mov	qword ptr [rsp + 288], rcx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	rdi
	mov	rdi, rdx
	mov	rbx, rax
	mov	rax, r10
	mul	rcx
	mov	qword ptr [rsp + 232], rdx      # 8-byte Spill
	mov	r11, rax
	mov	rax, r8
	mul	rcx
	mov	r8, rdx
	mov	r13, rax
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 352], rax      # 8-byte Spill
	add	rdx, r13
	mov	qword ptr [rsp + 360], rdx      # 8-byte Spill
	adc	r8, r11
	mov	qword ptr [rsp + 368], r8       # 8-byte Spill
	setb	byte ptr [rsp + 176]            # 1-byte Folded Spill
	add	r15b, 255
	adc	rbx, qword ptr [rsp + 344]      # 8-byte Folded Reload
	adc	rdi, rsi
	mov	qword ptr [rsp + 104], rdi      # 8-byte Spill
	setb	byte ptr [rsp + 280]            # 1-byte Folded Spill
	movzx	edi, byte ptr [rsp + 256]       # 1-byte Folded Reload
	mov	eax, edi
	add	al, 255
	mov	rsi, qword ptr [rsp + 336]      # 8-byte Reload
	mov	rax, rsi
	adc	rax, 0
	setb	r11b
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mul	qword ptr [rsp + 264]           # 8-byte Folded Reload
	mov	r10, rax
	add	dil, 255
	adc	r10, rsi
	movzx	r12d, r11b
	adc	r12, rdx
	mov	qword ptr [rsp + 336], r12      # 8-byte Spill
	add	byte ptr [rsp + 4], 255         # 1-byte Folded Spill
	mov	rsi, qword ptr [rsp + 96]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 304]      # 8-byte Reload
	adc	rcx, rsi
	setb	bpl
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	movabs	rdx, 1873798617647539866
	mul	rdx
	mov	rax, qword ptr [rsp + 192]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	rsi, qword ptr [rsp + 240]      # 8-byte Folded Reload
	adc	r12, 0
	add	rdx, rcx
	movzx	eax, bpl
	adc	r12, rax
	add	byte ptr [rsp + 224], 255       # 1-byte Folded Spill
	adc	rdx, r10
	adc	r12, 0
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp + 184]      # 8-byte Reload
	adc	rcx, rdx
	setb	byte ptr [rsp + 4]              # 1-byte Folded Spill
	mov	rsi, qword ptr [rsp + 24]       # 8-byte Reload
	movabs	rax, 326064518108171314
	imul	rsi, rax
	mov	qword ptr [rsp + 24], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rdx, 5412103778470702295
	mul	rdx
	mov	rax, qword ptr [rsp + 216]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp + 216], rdx      # 8-byte Spill
	xor	esi, esi
	mov	rax, rcx
	add	rax, rdx
	setb	sil
	mov	qword ptr [rsp + 192], rsi      # 8-byte Spill
	add	byte ptr [rsp + 80], 255        # 1-byte Folded Spill
	adc	rax, qword ptr [rsp + 248]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	add	byte ptr [rsp + 208], 255       # 1-byte Folded Spill
	adc	r14, rax
	setb	byte ptr [rsp + 248]            # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	rcx, rax
	mov	qword ptr [rsp + 96], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp + 152]      # 8-byte Reload
	movabs	rdx, 7239337960414712511
	mul	rdx
	mov	rax, qword ptr [rsp + 296]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 312]      # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	xor	ebp, ebp
	add	r14, rdx
	setb	bpl
	add	byte ptr [rsp + 7], 255         # 1-byte Folded Spill
	adc	r14, rbx
	setb	byte ptr [rsp + 240]            # 1-byte Folded Spill
	xor	r8d, r8d
	mov	r13, r9
	mov	r10, r9
	mov	rsi, qword ptr [rsp + 168]      # 8-byte Reload
	add	r10, rsi
	setb	r8b
	add	byte ptr [rsp + 6], 255         # 1-byte Folded Spill
	adc	r8, r14
	setb	byte ptr [rsp + 72]             # 1-byte Folded Spill
	mov	rdi, qword ptr [rsp + 8]        # 8-byte Reload
	movabs	rax, 3064711249896130499
	imul	rdi, rax
	mov	qword ptr [rsp + 224], rdi      # 8-byte Spill
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	movabs	rcx, 7435674573564081700
	mul	rcx
	mov	r11, rdx
	cmp	rsi, qword ptr [rsp + 200]      # 8-byte Folded Reload
	adc	r11, rdi
	mov	r15, qword ptr [rsp + 144]      # 8-byte Reload
	mov	rbx, r15
	mov	r14, qword ptr [rsp + 352]      # 8-byte Reload
	add	rbx, r14
	adc	r13, rsi
	movabs	rcx, -8506173809081122819
	imul	rcx, rbx
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	movabs	rsi, 5532603552561700244
	imul	rsi, rbx
	mov	qword ptr [rsp + 264], rsi      # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	rbx, rax
	mov	rax, rcx
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	rdi, rdx
	mov	rax, rcx
	movabs	rcx, -5044313057631688021
	mul	rcx
	mov	r9, rdx
	add	r9, rbx
	adc	rdi, rsi
	mov	qword ptr [rsp + 56], rdi       # 8-byte Spill
	xor	ebx, ebx
	add	r8, r11
	setb	bl
	mov	rcx, r15
	add	rcx, r14
	mov	qword ptr [rsp + 144], rcx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 360]      # 8-byte Reload
	adc	r10, rax
	lea	rax, [r13 + rax]
	adc	r8, qword ptr [rsp + 368]       # 8-byte Folded Reload
	setb	r15b
	xor	edx, edx
	test	rcx, rcx
	setne	dl
	lea	rsi, [rax + rdx]
	xor	ecx, ecx
	add	r9, rsi
	mov	qword ptr [rsp + 160], r9       # 8-byte Spill
	setb	cl
	add	rax, rdx
	adc	rcx, r8
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 208]            # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 128]      # 8-byte Reload
	mov	rcx, qword ptr [rsp + 288]      # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	mov	rdi, rax
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	rcx
	mov	r10, rax
	add	byte ptr [rsp + 176], 255       # 1-byte Folded Spill
	adc	r10, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	rdx, rdi
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 120]            # 1-byte Folded Spill
	movzx	edi, byte ptr [rsp + 5]         # 1-byte Folded Reload
	mov	eax, edi
	add	al, 255
	mov	rcx, qword ptr [rsp + 272]      # 8-byte Reload
	mov	rax, rcx
	adc	rax, 0
	setb	sil
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mul	qword ptr [rsp + 136]           # 8-byte Folded Reload
	mov	r13, rax
	add	dil, 255
	adc	r13, rcx
	movzx	edi, sil
	adc	rdi, rdx
	mov	qword ptr [rsp + 136], rdi      # 8-byte Spill
	add	byte ptr [rsp + 4], 255         # 1-byte Folded Spill
	mov	r8, qword ptr [rsp + 192]       # 8-byte Reload
	adc	r8, r12
	setb	sil
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rcx, 1873798617647539866
	mul	rcx
	mov	rax, qword ptr [rsp + 216]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	r12, qword ptr [rsp + 336]      # 8-byte Folded Reload
	adc	rdi, 0
	add	rdx, r8
	movzx	eax, sil
	adc	rdi, rax
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	rdx, r13
	adc	rdi, 0
	add	byte ptr [rsp + 248], 255       # 1-byte Folded Spill
	adc	rbp, rdx
	setb	sil
	movabs	rax, 326064518108171314
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	imul	rcx, rax
	mov	qword ptr [rsp + 16], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp + 152]      # 8-byte Reload
	movabs	rdx, 5412103778470702295
	mul	rdx
	mov	r13, rdx
	mov	rax, qword ptr [rsp + 80]       # 8-byte Reload
	cmp	rax, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r13, rcx
	xor	r12d, r12d
	add	rbp, r13
	setb	r12b
	add	byte ptr [rsp + 240], 255       # 1-byte Folded Spill
	adc	rbp, qword ptr [rsp + 104]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 272]            # 1-byte Folded Spill
	add	byte ptr [rsp + 72], 255        # 1-byte Folded Spill
	adc	rbx, rbp
	setb	byte ptr [rsp + 32]             # 1-byte Folded Spill
	mov	r9, qword ptr [rsp + 8]         # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	r9, rax
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	movabs	rdx, 7239337960414712511
	mul	rdx
	mov	r14, rdx
	cmp	r11, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	r14, r9
	xor	r8d, r8d
	add	rbx, r14
	setb	r8b
	add	r15b, 255
	adc	rbx, r10
	setb	byte ptr [rsp + 104]            # 1-byte Folded Spill
	xor	eax, eax
	mov	rcx, qword ptr [rsp + 56]       # 8-byte Reload
	add	qword ptr [rsp + 40], rcx       # 8-byte Folded Spill
	setb	al
	add	byte ptr [rsp + 208], 255       # 1-byte Folded Spill
	adc	rax, rbx
	mov	rbx, rax
	setb	byte ptr [rsp + 24]             # 1-byte Folded Spill
	movzx	ecx, byte ptr [rsp + 280]       # 1-byte Folded Reload
	mov	eax, ecx
	add	al, 255
	mov	r15, qword ptr [rsp + 328]      # 8-byte Reload
	mov	rax, r15
	adc	rax, 0
	setb	r11b
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mul	qword ptr [rsp + 320]           # 8-byte Folded Reload
	mov	r10, rax
	add	cl, 255
	adc	r10, r15
	movzx	r11d, r11b
	adc	r11, rdx
	add	sil, 255
	adc	r12, rdi
	setb	bpl
	mov	rax, qword ptr [rsp + 152]      # 8-byte Reload
	movabs	rdx, 1873798617647539866
	mul	rdx
	cmp	r13, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	rdi, qword ptr [rsp + 136]      # 8-byte Folded Reload
	mov	rdi, r11
	adc	rdi, 0
	add	rdx, r12
	movzx	eax, bpl
	adc	rdi, rax
	add	byte ptr [rsp + 272], 255       # 1-byte Folded Spill
	adc	rdx, r10
	adc	rdi, 0
	add	byte ptr [rsp + 32], 255        # 1-byte Folded Spill
	adc	r8, rdx
	setb	r13b
	mov	rsi, qword ptr [rsp + 8]        # 8-byte Reload
	movabs	rax, 326064518108171314
	imul	rsi, rax
	mov	qword ptr [rsp + 8], rsi        # 8-byte Spill
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	movabs	rcx, 5412103778470702295
	mul	rcx
	mov	r10, rdx
	cmp	r14, r9
	adc	r10, rsi
	xor	r14d, r14d
	add	r8, r10
	setb	r14b
	add	byte ptr [rsp + 104], 255       # 1-byte Folded Spill
	adc	r8, qword ptr [rsp + 256]       # 8-byte Folded Reload
	setb	r12b
	movabs	rsi, 3064711249896130499
	mov	r15, qword ptr [rsp + 144]      # 8-byte Reload
	imul	rsi, r15
	mov	qword ptr [rsp + 32], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	movabs	rcx, 7435674573564081700
	mul	rcx
	mov	rcx, rdx
	mov	rax, qword ptr [rsp + 264]      # 8-byte Reload
	cmp	qword ptr [rsp + 56], rax       # 8-byte Folded Reload
	adc	rcx, rsi
	xor	ebp, ebp
	add	rbx, rcx
	mov	qword ptr [rsp + 16], rbx       # 8-byte Spill
	setb	bpl
	add	byte ptr [rsp + 24], 255        # 1-byte Folded Spill
	adc	rbp, r8
	setb	byte ptr [rsp + 24]             # 1-byte Folded Spill
	movzx	esi, byte ptr [rsp + 120]       # 1-byte Folded Reload
	mov	eax, esi
	add	al, 255
	mov	r9, qword ptr [rsp + 128]       # 8-byte Reload
	mov	rax, r9
	adc	rax, 0
	setb	bl
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mul	qword ptr [rsp + 288]           # 8-byte Folded Reload
	mov	r8, rax
	add	sil, 255
	adc	r8, r9
	movzx	ebx, bl
	adc	rbx, rdx
	add	r13b, 255
	adc	r14, rdi
	setb	r13b
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	movabs	rdx, 1873798617647539866
	mul	rdx
	mov	r9, rdx
	cmp	r10, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	r9, 0
	cmp	rdi, r11
	mov	r10, rbx
	adc	r10, 0
	add	r9, r14
	movzx	eax, r13b
	adc	r10, rax
	add	r12b, 255
	adc	r9, r8
	adc	r10, 0
	movabs	r8, 2995800253092329851
	imul	r8, r15
	mov	r13, qword ptr [rsp + 64]       # 8-byte Reload
	mov	rax, r13
	movabs	r14, 7239337960414712511
	mul	r14
	mov	rdi, rdx
	cmp	rcx, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	rdi, r8
	mov	r11, r8
	xor	r8d, r8d
	add	rbp, rdi
	setb	r8b
	add	byte ptr [rsp + 24], 255        # 1-byte Folded Spill
	mov	r14, qword ptr [rsp + 160]      # 8-byte Reload
	adc	r8, r9
	setb	r9b
	movabs	rax, 326064518108171314
	imul	r15, rax
	mov	rax, r13
	movabs	r12, 5412103778470702295
	mul	r12
	mov	rcx, rdx
	cmp	rdi, r11
	adc	rcx, r15
	xor	edi, edi
	add	r8, rcx
	setb	dil
	add	r9b, 255
	adc	rdi, r10
	setb	r9b
	xor	r11d, r11d
	cmp	r10, rbx
	setb	r11b
	mov	rax, r13
	movabs	r13, 1873798617647539866
	mul	r13
	cmp	rcx, r15
	adc	rdx, 0
	movzx	eax, r9b
	add	rdx, rdi
	adc	rax, r11
	xor	ecx, ecx
	mov	rsi, qword ptr [rsp + 40]       # 8-byte Reload
	mov	r9, rsi
	movabs	rdi, 2210141511517208575
	sub	r9, rdi
	mov	r10d, 0
	sbb	r10, r10
	movabs	rdi, -5044313057631688021
	mov	r13, r14
	cmp	r14, rdi
	mov	rdi, r9
	sbb	rdi, 0
	cmp	r9, rdi
	sbb	r10, 0
	mov	r15, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r9, r15
	movabs	r11, 7435674573564081700
	sub	r9, r11
	mov	r11d, 0
	sbb	r11, r11
	add	r10, r9
	cmp	r9, r10
	sbb	r11, 0
	mov	r9, rbp
	movabs	rbx, 7239337960414712511
	sub	r9, rbx
	mov	ebx, 0
	sbb	rbx, rbx
	add	r11, r9
	cmp	r9, r11
	sbb	rbx, 0
	mov	r9, r8
	sub	r9, r12
	mov	r14d, 0
	sbb	r14, r14
	add	rbx, r9
	cmp	r9, rbx
	sbb	r14, 0
	mov	r12, rdx
	movabs	r9, 1873798617647539866
	sub	r12, r9
	sbb	rcx, rcx
	lea	r9, [r14 + r12]
	mov	r14, r15
	cmp	r12, r9
	sbb	rcx, 0
	add	rcx, rax
	cmp	rax, rcx
	cmovb	rdi, rsi
	cmovae	r14, r10
	cmovae	rbp, r11
	cmovae	r8, rbx
	mov	rbx, qword ptr [rsp + 384]      # 8-byte Reload
	test	rbx, rbx
	je	.LBB0_32
# %bb.13:                               # %bb568
	movabs	r10, 5044313057631688021
	add	r10, r13
	cmp	rax, rcx
	cmovb	r10, r13
	mov	r11, qword ptr [rsp + 376]      # 8-byte Reload
	mov	qword ptr [r11], r10
	cmp	rbx, 1
	je	.LBB0_33
# %bb.14:                               # %bb569
	mov	r10, r11
	mov	qword ptr [r11 + 8], rdi
	cmp	rbx, 2
	jbe	.LBB0_34
# %bb.15:                               # %bb570
	mov	qword ptr [r10 + 16], r14
	cmp	rbx, 3
	je	.LBB0_35
# %bb.16:                               # %bb571
	mov	qword ptr [r10 + 24], rbp
	cmp	rbx, 4
	jbe	.LBB0_36
# %bb.17:                               # %bb572
	mov	qword ptr [r10 + 32], r8
	cmp	rbx, 5
	je	.LBB0_37
# %bb.18:                               # %bb573
	cmp	rax, rcx
	cmovb	r9, rdx
	mov	qword ptr [r10 + 40], r9
	add	rsp, 392
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
.LBB0_19:                               # %panic
	.cfi_def_cfa_offset 448
	mov	edx, offset .Lalloc_e8cac02189bd7a405ad2b53622fe1143
	jmp	.LBB0_20
.LBB0_21:                               # %panic1
	mov	edi, 1
	mov	esi, 1
	mov	edx, offset .Lalloc_d7ce3f885025317e6a164d2c73057b7e
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_22:                               # %panic2
	mov	edi, 2
	mov	esi, 2
	mov	edx, offset .Lalloc_703bb6b668b15acef845aa09977de9fb
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_23:                               # %panic3
	mov	edi, 3
	mov	esi, 3
	mov	edx, offset .Lalloc_2ea0f783860f66f46ef03abfee65112d
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_24:                               # %panic4
	mov	edi, 4
	mov	esi, 4
	mov	edx, offset .Lalloc_9d33bc96039359bb93aaabf29c608d9f
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_25:                               # %panic5
	mov	edi, 5
	mov	esi, 5
	mov	edx, offset .Lalloc_efdd8329b16de238fd8a71e95fa454a5
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_26:                               # %panic6
	mov	edx, offset .Lalloc_16a1a84875f44f130dabe943ef01f2d2
	jmp	.LBB0_20
.LBB0_27:                               # %panic7
	mov	edi, 1
	mov	esi, 1
	mov	edx, offset .Lalloc_cc34f355ecc6068278e267b40d47643f
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_28:                               # %panic8
	mov	edi, 2
	mov	esi, 2
	mov	edx, offset .Lalloc_9ca61acb6ce6e3bcbb5e5764f26377e8
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_29:                               # %panic9
	mov	edi, 3
	mov	esi, 3
	mov	edx, offset .Lalloc_326e6c60a4fd64f7e077cd0a9e4770c3
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_30:                               # %panic10
	mov	edi, 4
	mov	esi, 4
	mov	edx, offset .Lalloc_708af0fdb1c7a53dc0651d482901f26d
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_31:                               # %panic11
	mov	edi, 5
	mov	esi, 5
	mov	edx, offset .Lalloc_9ae28ae489bfab987f81ba2e958394d1
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_32:                               # %panic12
	mov	edx, offset .Lalloc_e58e1a0b27ac165d9154a40fb6f20cdf
.LBB0_20:                               # %panic
	xor	edi, edi
	xor	esi, esi
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_33:                               # %panic13
	mov	edi, 1
	mov	esi, 1
	mov	edx, offset .Lalloc_9ee9b07be7eb7b0fc9be04f91383faf6
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_34:                               # %panic14
	mov	edi, 2
	mov	esi, 2
	mov	edx, offset .Lalloc_e5dee71d315257586b56d094d418b0c1
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_35:                               # %panic15
	mov	edi, 3
	mov	esi, 3
	mov	edx, offset .Lalloc_b77e677c38ad01440c91282a19c41f79
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_36:                               # %panic16
	mov	edi, 4
	mov	esi, 4
	mov	edx, offset .Lalloc_45931150e230eac558bb17f0c291b01c
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.LBB0_37:                               # %panic17
	mov	edi, 5
	mov	esi, 5
	mov	edx, offset .Lalloc_f909be82e69270cbafd144449ab946cd
	call	qword ptr [rip + _ZN4core9panicking18panic_bounds_check17h8307ccead484a122E@GOTPCREL]
.Lfunc_end0:
	.size	bls12_mul, .Lfunc_end0-bls12_mul
	.cfi_endproc
                                        # -- End function
	.type	.Lalloc_9b921ae87d3738fc962385f5b727e7d4,@object # @alloc_9b921ae87d3738fc962385f5b727e7d4
	.section	.rodata,"a",@progbits
.Lalloc_9b921ae87d3738fc962385f5b727e7d4:
	.ascii	"bls12_mul.rs"
	.size	.Lalloc_9b921ae87d3738fc962385f5b727e7d4, 12

	.type	.Lalloc_e8cac02189bd7a405ad2b53622fe1143,@object # @alloc_e8cac02189bd7a405ad2b53622fe1143
	.p2align	3, 0x0
.Lalloc_e8cac02189bd7a405ad2b53622fe1143:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000Y\003\000\000\n\000\000"
	.size	.Lalloc_e8cac02189bd7a405ad2b53622fe1143, 24

	.type	.Lalloc_d7ce3f885025317e6a164d2c73057b7e,@object # @alloc_d7ce3f885025317e6a164d2c73057b7e
	.p2align	3, 0x0
.Lalloc_d7ce3f885025317e6a164d2c73057b7e:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000Z\003\000\000\n\000\000"
	.size	.Lalloc_d7ce3f885025317e6a164d2c73057b7e, 24

	.type	.Lalloc_703bb6b668b15acef845aa09977de9fb,@object # @alloc_703bb6b668b15acef845aa09977de9fb
	.p2align	3, 0x0
.Lalloc_703bb6b668b15acef845aa09977de9fb:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000[\003\000\000\n\000\000"
	.size	.Lalloc_703bb6b668b15acef845aa09977de9fb, 24

	.type	.Lalloc_2ea0f783860f66f46ef03abfee65112d,@object # @alloc_2ea0f783860f66f46ef03abfee65112d
	.p2align	3, 0x0
.Lalloc_2ea0f783860f66f46ef03abfee65112d:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\\\003\000\000\n\000\000"
	.size	.Lalloc_2ea0f783860f66f46ef03abfee65112d, 24

	.type	.Lalloc_9d33bc96039359bb93aaabf29c608d9f,@object # @alloc_9d33bc96039359bb93aaabf29c608d9f
	.p2align	3, 0x0
.Lalloc_9d33bc96039359bb93aaabf29c608d9f:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000]\003\000\000\n\000\000"
	.size	.Lalloc_9d33bc96039359bb93aaabf29c608d9f, 24

	.type	.Lalloc_efdd8329b16de238fd8a71e95fa454a5,@object # @alloc_efdd8329b16de238fd8a71e95fa454a5
	.p2align	3, 0x0
.Lalloc_efdd8329b16de238fd8a71e95fa454a5:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000^\003\000\000\n\000\000"
	.size	.Lalloc_efdd8329b16de238fd8a71e95fa454a5, 24

	.type	.Lalloc_16a1a84875f44f130dabe943ef01f2d2,@object # @alloc_16a1a84875f44f130dabe943ef01f2d2
	.p2align	3, 0x0
.Lalloc_16a1a84875f44f130dabe943ef01f2d2:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000`\003\000\000\n\000\000"
	.size	.Lalloc_16a1a84875f44f130dabe943ef01f2d2, 24

	.type	.Lalloc_cc34f355ecc6068278e267b40d47643f,@object # @alloc_cc34f355ecc6068278e267b40d47643f
	.p2align	3, 0x0
.Lalloc_cc34f355ecc6068278e267b40d47643f:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000a\003\000\000\n\000\000"
	.size	.Lalloc_cc34f355ecc6068278e267b40d47643f, 24

	.type	.Lalloc_9ca61acb6ce6e3bcbb5e5764f26377e8,@object # @alloc_9ca61acb6ce6e3bcbb5e5764f26377e8
	.p2align	3, 0x0
.Lalloc_9ca61acb6ce6e3bcbb5e5764f26377e8:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000b\003\000\000\n\000\000"
	.size	.Lalloc_9ca61acb6ce6e3bcbb5e5764f26377e8, 24

	.type	.Lalloc_326e6c60a4fd64f7e077cd0a9e4770c3,@object # @alloc_326e6c60a4fd64f7e077cd0a9e4770c3
	.p2align	3, 0x0
.Lalloc_326e6c60a4fd64f7e077cd0a9e4770c3:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000c\003\000\000\n\000\000"
	.size	.Lalloc_326e6c60a4fd64f7e077cd0a9e4770c3, 24

	.type	.Lalloc_708af0fdb1c7a53dc0651d482901f26d,@object # @alloc_708af0fdb1c7a53dc0651d482901f26d
	.p2align	3, 0x0
.Lalloc_708af0fdb1c7a53dc0651d482901f26d:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000d\003\000\000\013\000\000"
	.size	.Lalloc_708af0fdb1c7a53dc0651d482901f26d, 24

	.type	.Lalloc_9ae28ae489bfab987f81ba2e958394d1,@object # @alloc_9ae28ae489bfab987f81ba2e958394d1
	.p2align	3, 0x0
.Lalloc_9ae28ae489bfab987f81ba2e958394d1:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000e\003\000\000\013\000\000"
	.size	.Lalloc_9ae28ae489bfab987f81ba2e958394d1, 24

	.type	.Lalloc_e58e1a0b27ac165d9154a40fb6f20cdf,@object # @alloc_e58e1a0b27ac165d9154a40fb6f20cdf
	.p2align	3, 0x0
.Lalloc_e58e1a0b27ac165d9154a40fb6f20cdf:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\263\006\000\000\005\000\000"
	.size	.Lalloc_e58e1a0b27ac165d9154a40fb6f20cdf, 24

	.type	.Lalloc_9ee9b07be7eb7b0fc9be04f91383faf6,@object # @alloc_9ee9b07be7eb7b0fc9be04f91383faf6
	.p2align	3, 0x0
.Lalloc_9ee9b07be7eb7b0fc9be04f91383faf6:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\264\006\000\000\005\000\000"
	.size	.Lalloc_9ee9b07be7eb7b0fc9be04f91383faf6, 24

	.type	.Lalloc_e5dee71d315257586b56d094d418b0c1,@object # @alloc_e5dee71d315257586b56d094d418b0c1
	.p2align	3, 0x0
.Lalloc_e5dee71d315257586b56d094d418b0c1:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\265\006\000\000\005\000\000"
	.size	.Lalloc_e5dee71d315257586b56d094d418b0c1, 24

	.type	.Lalloc_b77e677c38ad01440c91282a19c41f79,@object # @alloc_b77e677c38ad01440c91282a19c41f79
	.p2align	3, 0x0
.Lalloc_b77e677c38ad01440c91282a19c41f79:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\266\006\000\000\005\000\000"
	.size	.Lalloc_b77e677c38ad01440c91282a19c41f79, 24

	.type	.Lalloc_45931150e230eac558bb17f0c291b01c,@object # @alloc_45931150e230eac558bb17f0c291b01c
	.p2align	3, 0x0
.Lalloc_45931150e230eac558bb17f0c291b01c:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\267\006\000\000\005\000\000"
	.size	.Lalloc_45931150e230eac558bb17f0c291b01c, 24

	.type	.Lalloc_f909be82e69270cbafd144449ab946cd,@object # @alloc_f909be82e69270cbafd144449ab946cd
	.p2align	3, 0x0
.Lalloc_f909be82e69270cbafd144449ab946cd:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\270\006\000\000\005\000\000"
	.size	.Lalloc_f909be82e69270cbafd144449ab946cd, 24

	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

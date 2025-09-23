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
	sub	rsp, 240
	.cfi_def_cfa_offset 296
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	qword ptr [rsp - 88], r8        # 8-byte Spill
	mov	r10, qword ptr [rdx]
	mov	rsi, rdx
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	r12, qword ptr [r8]
	mov	r13, qword ptr [r8 + 8]
	mov	r9, qword ptr [r8 + 16]
	mov	rdx, r9
	mov	qword ptr [rsp + 24], r9        # 8-byte Spill
	mov	r8, r10
	mov	qword ptr [rsp - 8], r10        # 8-byte Spill
	mulx	rdx, r10, r10
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, r13
	mov	qword ptr [rsp + 32], r13       # 8-byte Spill
	mulx	rax, r11, r8
	mov	rdx, r12
	mov	qword ptr [rsp + 144], r12      # 8-byte Spill
	mulx	rcx, r15, r8
	movabs	r8, -8506173809081122819
	mov	rdx, r15
	imul	rdx, r8
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	movabs	rbx, 5532603552561700244
	mov	r8, r15
	imul	r8, rbx
	movabs	r14, 436827220531937283
	mov	rbx, r15
	mov	qword ptr [rsp - 80], r15       # 8-byte Spill
	imul	rbx, r14
	mov	rsi, qword ptr [rsi + 8]
	mov	qword ptr [rsp + 136], rsi      # 8-byte Spill
	movabs	rsi, 2210141511517208575
	mulx	rsi, rsi, rsi
	movabs	r14, -5044313057631688021
	mulx	rbp, rbp, r14
	add	rbp, rbx
	adc	rsi, r8
	xor	edx, edx
	test	r15, r15
	setne	dl
	add	rcx, r11
	adc	rax, r10
	setb	r11b
	lea	rbx, [rcx + rdx]
	xor	r10d, r10d
	add	rbp, rbx
	setb	r10b
	add	rcx, rdx
	adc	r10, rax
	mov	rdx, r9
	mov	r9, qword ptr [rsp + 136]       # 8-byte Reload
	mulx	rax, rcx, r9
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rdx, r13
	mulx	r13, rbx, r9
	mov	rdx, r12
	mulx	rax, r15, r9
	setb	r14b
	add	rax, rbx
	adc	r13, rcx
	setb	byte ptr [rsp - 72]             # 1-byte Folded Spill
	add	r11b, 255
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rdx, qword ptr [rcx + 32]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	r9, qword ptr [rsp - 8]         # 8-byte Reload
	mulx	rdx, r11, r9
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rcx + 24]
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mulx	rcx, rdx, r9
	adc	rdx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rcx, r11
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	xor	ebx, ebx
	mov	r11, r10
	add	r11, rsi
	setb	bl
	add	r14b, 255
	adc	rbx, rdx
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	movabs	rdx, 3064711249896130499
	mov	r14, qword ptr [rsp - 80]       # 8-byte Reload
	imul	r14, rdx
	cmp	rsi, r8
	movabs	r8, 7435674573564081700
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r12, r12, r8
	adc	r12, r14
	xor	r9d, r9d
	add	rbx, r12
	setb	r9b
	mov	rdx, rbp
	add	rdx, r15
	adc	r10, rsi
	add	rbp, r15
	adc	r11, rax
	adc	rbx, r13
	setb	r13b
	mov	r11, rbp
	movabs	rdx, -8506173809081122819
	imul	r11, rdx
	mov	qword ptr [rsp - 64], r11       # 8-byte Spill
	mov	rdx, r11
	movabs	rsi, 2210141511517208575
	mulx	r15, r15, rsi
	movabs	r8, -5044313057631688021
	mulx	rdx, rdx, r8
	add	rax, r10
	mov	r11, rbp
	movabs	r8, 5532603552561700244
	imul	r11, r8
	mov	rsi, rbp
	movabs	r8, 436827220531937283
	imul	rsi, r8
	add	rsi, rdx
	adc	r15, r11
	xor	edx, edx
	test	rbp, rbp
	mov	qword ptr [rsp - 16], rbp       # 8-byte Spill
	setne	dl
	lea	r10, [rax + rdx]
	xor	r8d, r8d
	add	rsi, r10
	setb	r8b
	add	rax, rdx
	adc	r8, rbx
	setb	al
	add	byte ptr [rsp - 72], 255        # 1-byte Folded Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rbx, qword ptr [rsp + 136]      # 8-byte Reload
	mulx	rdx, r10, rbx
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	rdx, rbx, rbx
	adc	rbx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	rdx, r10
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 192]            # 1-byte Folded Spill
	add	byte ptr [rsp - 120], 255       # 1-byte Folded Spill
	adc	r9, rcx
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	movabs	rcx, 2995800253092329851
	mov	r10, qword ptr [rsp - 80]       # 8-byte Reload
	imul	r10, rcx
	mov	qword ptr [rsp - 32], r10       # 8-byte Spill
	cmp	r12, r14
	movabs	rcx, 7239337960414712511
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rcx, rcx, rcx
	adc	rcx, r10
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	xor	r10d, r10d
	add	r9, rcx
	setb	r10b
	add	r13b, 255
	adc	r9, rbx
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	xor	r12d, r12d
	mov	r13, r8
	mov	qword ptr [rsp + 8], r15        # 8-byte Spill
	add	r13, r15
	setb	r12b
	add	al, 255
	adc	r12, r9
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	movabs	rax, 3064711249896130499
	imul	rbp, rax
	mov	qword ptr [rsp + 72], rbp       # 8-byte Spill
	cmp	r15, r11
	mov	r9, qword ptr [rsp + 16]        # 8-byte Reload
	mov	r15, qword ptr [r9 + 16]
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	movabs	rax, 7435674573564081700
	mulx	rax, rax, rax
	adc	rax, rbp
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	xor	r11d, r11d
	add	r12, rax
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	mov	qword ptr [rsp + 152], r15      # 8-byte Spill
	mulx	rcx, rax, r15
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	rbp, rbx, r15
	mov	r14, qword ptr [rsp + 144]      # 8-byte Reload
	mov	rdx, r14
	mulx	rcx, rdx, r15
	setb	r11b
	mov	r15, rsi
	add	r15, rdx
	adc	r8, qword ptr [rsp + 8]         # 8-byte Folded Reload
	add	rcx, rbx
	adc	rbp, rax
	setb	bl
	mov	r15, rsi
	add	r15, rdx
	mov	qword ptr [rsp - 72], r15       # 8-byte Spill
	lea	r8, [r8 + rcx]
	adc	rcx, r13
	adc	rbp, r12
	setb	byte ptr [rsp + 56]             # 1-byte Folded Spill
	mov	rdx, r15
	movabs	rax, -8506173809081122819
	imul	rdx, rax
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	movabs	rax, 2210141511517208575
	mulx	r12, r12, rax
	movabs	rax, -5044313057631688021
	mulx	rax, rax, rax
	mov	rsi, r15
	movabs	rcx, 5532603552561700244
	imul	rsi, rcx
	mov	rdx, r15
	movabs	rcx, 436827220531937283
	imul	rdx, rcx
	add	rdx, rax
	mov	r13, rdx
	adc	r12, rsi
	xor	ecx, ecx
	test	r15, r15
	setne	cl
	lea	rdx, [r8 + rcx]
	xor	eax, eax
	add	r13, rdx
	mov	qword ptr [rsp - 112], r13      # 8-byte Spill
	setb	al
	add	r8, rcx
	mov	r9, qword ptr [r9 + 24]
	mov	qword ptr [rsp + 8], r9         # 8-byte Spill
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	mulx	rdx, rcx, r9
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	r15, r8, r9
	mov	rdx, r14
	mulx	r13, rdx, r9
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	adc	rax, rbp
	setb	r14b
	add	r13, r8
	adc	r15, rcx
	mov	qword ptr [rsp + 160], r15      # 8-byte Spill
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	add	bl, 255
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	r8, qword ptr [rsp + 152]       # 8-byte Reload
	mulx	rdx, rcx, r8
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	rdx, r8, r8
	adc	r8, qword ptr [rsp + 40]        # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 200]            # 1-byte Folded Spill
	movzx	ebp, byte ptr [rsp - 122]       # 1-byte Folded Reload
	mov	ecx, ebp
	add	cl, 255
	mov	r9, qword ptr [rsp + 128]       # 8-byte Reload
	mov	rcx, r9
	adc	rcx, 0
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rdx, qword ptr [rcx + 40]
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mulx	rcx, rdx, qword ptr [rsp - 8]   # 8-byte Folded Reload
	setb	bl
	add	bpl, 255
	adc	rdx, r9
	movzx	r9d, bl
	adc	r9, rcx
	mov	qword ptr [rsp + 80], r9        # 8-byte Spill
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	r10, rdx
	setb	byte ptr [rsp + 176]            # 1-byte Folded Spill
	movabs	rcx, 326064518108171314
	mov	r9, qword ptr [rsp - 80]        # 8-byte Reload
	imul	r9, rcx
	mov	qword ptr [rsp - 80], r9        # 8-byte Spill
	mov	rcx, qword ptr [rsp - 40]       # 8-byte Reload
	cmp	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	movabs	rcx, 5412103778470702295
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rcx, rcx, rcx
	adc	rcx, r9
	mov	qword ptr [rsp + 168], rcx      # 8-byte Spill
	xor	ebp, ebp
	add	r10, rcx
	setb	bpl
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	r10, qword ptr [rsp + 112]      # 8-byte Folded Reload
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	r11, r10
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	mov	r9, qword ptr [rsp - 16]        # 8-byte Reload
	movabs	rcx, 2995800253092329851
	imul	r9, rcx
	mov	qword ptr [rsp - 48], r9        # 8-byte Spill
	mov	rcx, qword ptr [rsp - 56]       # 8-byte Reload
	cmp	rcx, qword ptr [rsp + 72]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	movabs	rcx, 7239337960414712511
	mulx	rcx, rcx, rcx
	adc	rcx, r9
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	xor	r15d, r15d
	add	r11, rcx
	setb	r15b
	add	byte ptr [rsp + 56], 255        # 1-byte Folded Spill
	adc	r11, r8
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	xor	ecx, ecx
	mov	r10, rax
	add	r10, r12
	setb	cl
	add	r14b, 255
	adc	rcx, r11
	setb	byte ptr [rsp - 56]             # 1-byte Folded Spill
	mov	r8, qword ptr [rsp - 72]        # 8-byte Reload
	movabs	rdx, 3064711249896130499
	imul	r8, rdx
	mov	qword ptr [rsp + 56], r8        # 8-byte Spill
	cmp	r12, rsi
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rsi, 7435674573564081700
	mulx	rbx, rbx, rsi
	adc	rbx, r8
	mov	r14, qword ptr [rsp - 112]      # 8-byte Reload
	mov	r9, r14
	mov	r11, qword ptr [rsp + 48]       # 8-byte Reload
	add	r9, r11
	adc	rax, r12
	mov	r12, r9
	movabs	rdx, -8506173809081122819
	imul	r12, rdx
	mov	qword ptr [rsp - 8], r12        # 8-byte Spill
	mov	rdx, r12
	movabs	rsi, 2210141511517208575
	mulx	r8, r8, rsi
	movabs	rsi, -5044313057631688021
	mulx	rdx, rdx, rsi
	mov	r12, r9
	movabs	rsi, 5532603552561700244
	imul	r12, rsi
	mov	qword ptr [rsp + 88], r12       # 8-byte Spill
	movabs	rsi, 436827220531937283
	imul	r9, rsi
	add	r9, rdx
	adc	r8, r12
	xor	r12d, r12d
	add	rcx, rbx
	setb	r12b
	add	r14, r11
	mov	qword ptr [rsp - 112], r14      # 8-byte Spill
	adc	r10, r13
	adc	rcx, qword ptr [rsp + 160]      # 8-byte Folded Reload
	lea	rax, [rax + r13]
	setb	r11b
	xor	edx, edx
	test	r14, r14
	setne	dl
	lea	rsi, [rax + rdx]
	xor	r10d, r10d
	add	r9, rsi
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	setb	r10b
	add	rax, rdx
	adc	r10, rcx
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mulx	rdx, rcx, rax
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	rdx, rax, rax
	setb	byte ptr [rsp + 48]             # 1-byte Folded Spill
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	adc	rax, qword ptr [rsp + 104]      # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	movzx	r13d, byte ptr [rsp + 192]      # 1-byte Folded Reload
	mov	ecx, r13d
	add	cl, 255
	mov	r9, qword ptr [rsp + 120]       # 8-byte Reload
	mov	rcx, r9
	adc	rcx, 0
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	rdx, rcx, qword ptr [rsp + 136] # 8-byte Folded Reload
	setb	sil
	add	r13b, 255
	adc	rcx, r9
	movzx	esi, sil
	adc	rsi, rdx
	mov	r13, rsi
	mov	qword ptr [rsp + 104], rsi      # 8-byte Spill
	add	byte ptr [rsp + 176], 255       # 1-byte Folded Spill
	adc	rbp, qword ptr [rsp + 80]       # 8-byte Folded Reload
	setb	sil
	mov	rdx, qword ptr [rsp + 168]      # 8-byte Reload
	cmp	rdx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	movabs	r9, 1873798617647539866
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rdx, rdx, r9
	adc	rdx, 0
	add	rdx, rbp
	movzx	esi, sil
	adc	rsi, r13
	add	byte ptr [rsp - 40], 255        # 1-byte Folded Spill
	adc	rdx, rcx
	adc	rsi, 0
	mov	qword ptr [rsp + 96], rsi       # 8-byte Spill
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	r15, rdx
	setb	byte ptr [rsp + 72]             # 1-byte Folded Spill
	movabs	rcx, 326064518108171314
	mov	rsi, qword ptr [rsp - 16]       # 8-byte Reload
	imul	rsi, rcx
	mov	qword ptr [rsp - 16], rsi       # 8-byte Spill
	mov	rcx, qword ptr [rsp + 64]       # 8-byte Reload
	cmp	rcx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	movabs	rcx, 5412103778470702295
	mulx	rdx, rdx, rcx
	adc	rdx, rsi
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	xor	ecx, ecx
	add	r15, rdx
	setb	cl
	mov	qword ptr [rsp + 160], rcx      # 8-byte Spill
	add	byte ptr [rsp - 32], 255        # 1-byte Folded Spill
	adc	r15, qword ptr [rsp + 184]      # 8-byte Folded Reload
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	add	byte ptr [rsp - 56], 255        # 1-byte Folded Spill
	adc	r12, r15
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	mov	rsi, qword ptr [rsp - 72]       # 8-byte Reload
	movabs	rcx, 2995800253092329851
	imul	rsi, rcx
	mov	qword ptr [rsp - 48], rsi       # 8-byte Spill
	cmp	rbx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rcx, 7239337960414712511
	mulx	rcx, rcx, rcx
	adc	rcx, rsi
	mov	qword ptr [rsp - 56], rcx       # 8-byte Spill
	xor	r15d, r15d
	add	r12, rcx
	setb	r15b
	add	r11b, 255
	adc	r12, rax
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	xor	eax, eax
	mov	r14, r10
	add	r14, r8
	setb	al
	add	byte ptr [rsp + 48], 255        # 1-byte Folded Spill
	adc	rax, r12
	mov	rcx, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r12, qword ptr [rcx + 32]
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	movabs	rcx, 7435674573564081700
	mulx	r9, r9, rcx
	setb	byte ptr [rsp + 64]             # 1-byte Folded Spill
	mov	r11, qword ptr [rsp - 112]      # 8-byte Reload
	movabs	rcx, 3064711249896130499
	imul	r11, rcx
	mov	qword ptr [rsp + 56], r11       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 144]      # 8-byte Reload
	mulx	r13, rsi, r12
	cmp	r8, qword ptr [rsp + 88]        # 8-byte Folded Reload
	adc	r9, r11
	mov	rbp, r9
	mov	qword ptr [rsp + 216], r9       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	r11, rcx
	add	r11, rsi
	adc	r10, r8
	mov	r9, r11
	movabs	rdx, -8506173809081122819
	imul	r9, rdx
	mov	qword ptr [rsp - 80], r9        # 8-byte Spill
	mov	rdx, r9
	movabs	r8, 2210141511517208575
	mulx	rbx, rbx, r8
	movabs	r8, -5044313057631688021
	mulx	rdx, rdx, r8
	mov	r9, r11
	movabs	r8, 5532603552561700244
	imul	r9, r8
	mov	qword ptr [rsp + 80], r9        # 8-byte Spill
	movabs	r8, 436827220531937283
	imul	r11, r8
	add	r11, rdx
	mov	qword ptr [rsp - 104], r11      # 8-byte Spill
	adc	rbx, r9
	mov	qword ptr [rsp + 48], rbx       # 8-byte Spill
	xor	r11d, r11d
	add	rax, rbp
	mov	rbx, qword ptr [rsp + 24]       # 8-byte Reload
	mov	rdx, rbx
	mulx	rdx, r8, r12
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rbp, qword ptr [rsp + 32]       # 8-byte Reload
	mov	rdx, rbp
	mulx	rdx, r9, r12
	setb	r11b
	add	r9, r13
	adc	rdx, r8
	setb	r13b
	add	rcx, rsi
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	lea	rsi, [r10 + r9]
	adc	r9, r14
	adc	rdx, rax
	setb	byte ptr [rsp - 121]            # 1-byte Folded Spill
	xor	eax, eax
	test	rcx, rcx
	setne	al
	lea	r9, [rsi + rax]
	xor	r8d, r8d
	mov	rcx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rcx, r9
	setb	r8b
	add	rsi, rax
	adc	r8, rdx
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r9, qword ptr [rax + 40]
	mov	qword ptr [rsp + 16], r9        # 8-byte Spill
	mov	rdx, rbx
	mulx	rdx, rax, r9
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	rdx, rbp
	mulx	r10, rsi, r9
	mov	rdx, qword ptr [rsp + 144]      # 8-byte Reload
	mulx	rdx, rbp, r9
	setb	byte ptr [rsp - 104]            # 1-byte Folded Spill
	add	rdx, rsi
	mov	qword ptr [rsp + 224], rdx      # 8-byte Spill
	adc	r10, rax
	mov	qword ptr [rsp + 232], r10      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	qword ptr [rsp + 136], r12      # 8-byte Spill
	mulx	rdx, rax, r12
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	rdx, r12, r12
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	add	r13b, 255
	adc	r12, qword ptr [rsp + 120]      # 8-byte Folded Reload
	adc	rdx, rax
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 120]            # 1-byte Folded Spill
	movzx	r10d, byte ptr [rsp + 200]      # 1-byte Folded Reload
	mov	eax, r10d
	add	al, 255
	mov	r9, qword ptr [rsp + 208]       # 8-byte Reload
	mov	rax, r9
	adc	rax, 0
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	rdx, rax, qword ptr [rsp + 152] # 8-byte Folded Reload
	setb	sil
	add	r10b, 255
	adc	rax, r9
	movzx	esi, sil
	adc	rsi, rdx
	mov	r9, rsi
	mov	qword ptr [rsp + 176], rsi      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	movabs	rsi, 1873798617647539866
	mulx	rdx, rdx, rsi
	add	byte ptr [rsp + 72], 255        # 1-byte Folded Spill
	mov	r10, qword ptr [rsp + 96]       # 8-byte Reload
	mov	rbx, qword ptr [rsp + 160]      # 8-byte Reload
	adc	rbx, r10
	setb	sil
	mov	r14, qword ptr [rsp + 168]      # 8-byte Reload
	cmp	r14, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	r10, qword ptr [rsp + 104]      # 8-byte Folded Reload
	mov	r10, r9
	adc	r10, 0
	add	rdx, rbx
	movzx	esi, sil
	adc	r10, rsi
	add	byte ptr [rsp - 40], 255        # 1-byte Folded Spill
	adc	rdx, rax
	adc	r10, 0
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	r15, rdx
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	movabs	rax, 326064518108171314
	mov	rsi, qword ptr [rsp - 72]       # 8-byte Reload
	imul	rsi, rax
	mov	qword ptr [rsp - 72], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rax, 5412103778470702295
	mulx	rax, rax, rax
	adc	rax, rsi
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	xor	r14d, r14d
	add	r15, rax
	setb	r14b
	add	byte ptr [rsp - 32], 255        # 1-byte Folded Spill
	adc	r15, qword ptr [rsp + 112]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	add	byte ptr [rsp + 64], 255        # 1-byte Folded Spill
	adc	r11, r15
	setb	byte ptr [rsp + 112]            # 1-byte Folded Spill
	mov	r9, qword ptr [rsp - 112]       # 8-byte Reload
	movabs	rdx, 2995800253092329851
	imul	r9, rdx
	mov	qword ptr [rsp - 24], r9        # 8-byte Spill
	mov	rdx, qword ptr [rsp + 216]      # 8-byte Reload
	cmp	rdx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	movabs	rsi, 7239337960414712511
	mulx	rdx, rdx, rsi
	adc	rdx, r9
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	xor	r13d, r13d
	add	r11, rdx
	setb	r13b
	add	byte ptr [rsp - 121], 255       # 1-byte Folded Spill
	adc	r11, r12
	setb	byte ptr [rsp + 104]            # 1-byte Folded Spill
	xor	r9d, r9d
	mov	r15, r8
	mov	rsi, qword ptr [rsp + 48]       # 8-byte Reload
	add	r15, rsi
	setb	r9b
	add	byte ptr [rsp - 104], 255       # 1-byte Folded Spill
	adc	r9, r11
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	mov	r11, qword ptr [rsp - 88]       # 8-byte Reload
	movabs	rdx, 3064711249896130499
	imul	r11, rdx
	mov	qword ptr [rsp + 72], r11       # 8-byte Spill
	cmp	rsi, qword ptr [rsp + 80]       # 8-byte Folded Reload
	mov	rbx, rsi
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	movabs	rsi, 7435674573564081700
	mulx	rax, rax, rsi
	adc	rax, r11
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	mov	r11, rcx
	mov	r12, rbp
	add	r11, rbp
	adc	r8, rbx
	movabs	rdx, -8506173809081122819
	imul	rdx, r11
	mov	qword ptr [rsp + 32], rdx       # 8-byte Spill
	movabs	rsi, 2210141511517208575
	mulx	rbp, rbp, rsi
	movabs	rsi, -5044313057631688021
	mulx	rdx, rdx, rsi
	movabs	rsi, 5532603552561700244
	imul	rsi, r11
	mov	qword ptr [rsp + 152], rsi      # 8-byte Spill
	movabs	rbx, 436827220531937283
	imul	r11, rbx
	add	r11, rdx
	adc	rbp, rsi
	mov	qword ptr [rsp + 24], rbp       # 8-byte Spill
	xor	ebx, ebx
	add	r9, rax
	setb	bl
	mov	rax, rcx
	add	rax, r12
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 224]      # 8-byte Reload
	adc	r15, rdx
	adc	r9, qword ptr [rsp + 232]       # 8-byte Folded Reload
	lea	rdx, [r8 + rdx]
	setb	byte ptr [rsp + 80]             # 1-byte Folded Spill
	xor	esi, esi
	test	rax, rax
	setne	sil
	lea	r8, [rdx + rsi]
	xor	r15d, r15d
	add	r11, r8
	mov	qword ptr [rsp - 16], r11       # 8-byte Spill
	setb	r15b
	add	rdx, rsi
	adc	r15, r9
	mov	qword ptr [rsp - 64], r15       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mov	r8, qword ptr [rsp + 16]        # 8-byte Reload
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	rdx, r11, r8
	setb	byte ptr [rsp - 96]             # 1-byte Folded Spill
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	r11, qword ptr [rsp + 184]      # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	setb	byte ptr [rsp]                  # 1-byte Folded Spill
	movzx	r15d, byte ptr [rsp - 122]      # 1-byte Folded Reload
	mov	edx, r15d
	add	dl, 255
	mov	r9, qword ptr [rsp + 128]       # 8-byte Reload
	mov	rdx, r9
	adc	rdx, 0
	mov	rcx, qword ptr [rsp + 40]       # 8-byte Reload
	mov	rdx, rcx
	mulx	rdx, rsi, qword ptr [rsp + 8]   # 8-byte Folded Reload
	setb	r8b
	add	r15b, 255
	adc	rsi, r9
	movzx	ebp, r8b
	adc	rbp, rdx
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	r8, 1873798617647539866
	mulx	rdx, rdx, r8
	add	byte ptr [rsp - 40], 255        # 1-byte Folded Spill
	adc	r14, r10
	setb	r9b
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	r10, qword ptr [rsp + 176]      # 8-byte Folded Reload
	mov	r8, rbp
	adc	r8, 0
	add	rdx, r14
	movzx	eax, r9b
	adc	r8, rax
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	adc	rdx, rsi
	adc	r8, 0
	add	byte ptr [rsp + 112], 255       # 1-byte Folded Spill
	adc	r13, rdx
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	movabs	rax, 326064518108171314
	mov	rsi, qword ptr [rsp - 112]      # 8-byte Reload
	imul	rsi, rax
	mov	qword ptr [rsp - 112], rsi      # 8-byte Spill
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 24]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	movabs	rax, 5412103778470702295
	mulx	r14, r14, rax
	adc	r14, rsi
	xor	r9d, r9d
	add	r13, r14
	setb	r9b
	add	byte ptr [rsp + 104], 255       # 1-byte Folded Spill
	adc	r13, qword ptr [rsp + 192]      # 8-byte Folded Reload
	setb	byte ptr [rsp + 128]            # 1-byte Folded Spill
	add	byte ptr [rsp - 32], 255        # 1-byte Folded Spill
	adc	rbx, r13
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	mov	r13, qword ptr [rsp - 88]       # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	r13, rax
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	cmp	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	mov	r15, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rdx, r15
	movabs	rax, 7239337960414712511
	mulx	r12, r12, rax
	adc	r12, r13
	xor	r10d, r10d
	add	rbx, r12
	setb	r10b
	add	byte ptr [rsp + 80], 255        # 1-byte Folded Spill
	adc	rbx, r11
	setb	byte ptr [rsp + 8]              # 1-byte Folded Spill
	xor	eax, eax
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	add	qword ptr [rsp - 64], rdx       # 8-byte Folded Spill
	setb	al
	add	byte ptr [rsp - 96], 255        # 1-byte Folded Spill
	adc	rax, rbx
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	setb	byte ptr [rsp - 72]             # 1-byte Folded Spill
	movzx	r11d, byte ptr [rsp + 120]      # 1-byte Folded Reload
	mov	edx, r11d
	add	dl, 255
	mov	rax, qword ptr [rsp + 144]      # 8-byte Reload
	mov	rdx, rax
	adc	rdx, 0
	mov	rdx, rcx
	mulx	rdx, rbx, qword ptr [rsp + 136] # 8-byte Folded Reload
	setb	sil
	add	r11b, 255
	adc	rbx, rax
	movzx	r11d, sil
	adc	r11, rdx
	add	byte ptr [rsp - 122], 255       # 1-byte Folded Spill
	adc	r9, r8
	setb	sil
	cmp	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	movabs	r14, 1873798617647539866
	mulx	rdx, rdx, r14
	adc	rdx, 0
	cmp	r8, rbp
	mov	r14, r11
	adc	r14, 0
	add	rdx, r9
	movzx	esi, sil
	adc	r14, rsi
	add	byte ptr [rsp + 128], 255       # 1-byte Folded Spill
	adc	rdx, rbx
	adc	r14, 0
	add	byte ptr [rsp - 120], 255       # 1-byte Folded Spill
	adc	r10, rdx
	setb	bl
	movabs	rdx, 326064518108171314
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	imul	rax, rdx
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	cmp	r12, r13
	mov	rdx, r15
	movabs	rsi, 5412103778470702295
	mulx	r13, r13, rsi
	adc	r13, rax
	xor	r12d, r12d
	add	r10, r13
	setb	r12b
	add	byte ptr [rsp + 8], 255         # 1-byte Folded Spill
	adc	r10, qword ptr [rsp + 200]      # 8-byte Folded Reload
	setb	bpl
	movabs	r8, 3064711249896130499
	mov	rcx, qword ptr [rsp - 104]      # 8-byte Reload
	imul	r8, rcx
	mov	qword ptr [rsp - 120], r8       # 8-byte Spill
	mov	rax, qword ptr [rsp + 152]      # 8-byte Reload
	cmp	qword ptr [rsp + 24], rax       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rsi, 7435674573564081700
	mulx	r15, r15, rsi
	adc	r15, r8
	xor	r8d, r8d
	add	qword ptr [rsp - 96], r15       # 8-byte Folded Spill
	setb	r8b
	add	byte ptr [rsp - 72], 255        # 1-byte Folded Spill
	adc	r8, r10
	setb	byte ptr [rsp - 112]            # 1-byte Folded Spill
	movzx	eax, byte ptr [rsp]             # 1-byte Folded Reload
	mov	edx, eax
	add	dl, 255
	mov	r10, qword ptr [rsp + 208]      # 8-byte Reload
	mov	rdx, r10
	adc	rdx, 0
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	rdx, rsi, qword ptr [rsp + 16]  # 8-byte Folded Reload
	setb	r9b
	add	al, 255
	adc	rsi, r10
	movzx	r9d, r9b
	adc	r9, rdx
	add	bl, 255
	adc	r12, r14
	setb	r10b
	cmp	r13, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	movabs	rbx, 1873798617647539866
	mulx	rbx, rbx, rbx
	adc	rbx, 0
	cmp	r14, r11
	mov	r11, r9
	adc	r11, 0
	add	rbx, r12
	movzx	edx, r10b
	adc	r11, rdx
	add	bpl, 255
	adc	rbx, rsi
	adc	r11, 0
	movabs	rsi, 2995800253092329851
	imul	rsi, rcx
	cmp	r15, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	r13, 7239337960414712511
	mulx	rax, rax, r13
	adc	rax, rsi
	mov	r14, rsi
	xor	esi, esi
	add	r8, rax
	setb	sil
	add	byte ptr [rsp - 112], 255       # 1-byte Folded Spill
	adc	rsi, rbx
	setb	r10b
	movabs	rbx, 326064518108171314
	imul	rcx, rbx
	cmp	rax, r14
	mov	rax, rdx
	movabs	r13, 5412103778470702295
	mulx	rdx, rdx, r13
	adc	rdx, rcx
	xor	ebx, ebx
	add	rsi, rdx
	setb	bl
	add	r10b, 255
	adc	rbx, r11
	setb	r10b
	xor	r14d, r14d
	cmp	r11, r9
	setb	r14b
	cmp	rdx, rcx
	mov	rdx, rax
	movabs	rbp, 1873798617647539866
	mulx	rcx, rcx, rbp
	adc	rcx, 0
	add	rcx, rbx
	movzx	r10d, r10b
	adc	r10, r14
	xor	r11d, r11d
	mov	rbx, qword ptr [rsp - 64]       # 8-byte Reload
	movabs	rdx, 2210141511517208575
	sub	rbx, rdx
	mov	r14d, 0
	sbb	r14, r14
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	movabs	r9, -5044313057631688021
	sub	rdx, r9
	mov	r9, rbx
	sbb	r9, 0
	cmp	rbx, r9
	sbb	r14, 0
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mov	r15, rax
	movabs	rbx, 7435674573564081700
	sub	r15, rbx
	mov	r12d, 0
	sbb	r12, r12
	lea	rbx, [r14 + r15]
	cmp	r15, rbx
	sbb	r12, 0
	mov	r14, r8
	movabs	r15, 7239337960414712511
	sub	r14, r15
	mov	r15d, 0
	sbb	r15, r15
	add	r12, r14
	cmp	r14, r12
	sbb	r15, 0
	mov	r14, rsi
	sub	r14, r13
	mov	r13d, 0
	sbb	r13, r13
	add	r15, r14
	cmp	r14, r15
	sbb	r13, 0
	mov	r14, rcx
	sub	r14, rbp
	sbb	r11, r11
	add	r13, r14
	cmp	r14, r13
	sbb	r11, 0
	add	r11, r10
	cmp	r10, r11
	cmovb	r9, qword ptr [rsp - 64]        # 8-byte Folded Reload
	cmovae	rax, rbx
	cmovae	r8, r12
	cmovae	rsi, r15
	cmovb	rdx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	qword ptr [rdi], rdx
	mov	qword ptr [rdi + 8], r9
	mov	qword ptr [rdi + 16], rax
	mov	qword ptr [rdi + 24], r8
	mov	qword ptr [rdi + 32], rsi
	cmovae	rcx, r13
	mov	qword ptr [rdi + 40], rcx
	add	rsp, 240
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

	.text
	.intel_syntax noprefix
	.file	"bls12_mul.5faeeca7e3bee518-cgu.0"
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
	sub	rsp, 224
	.cfi_def_cfa_offset 280
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 216], rdi      # 8-byte Spill
	mov	r12, qword ptr [rdx]
	mov	qword ptr [rsp - 72], r8        # 8-byte Spill
	mov	rdi, qword ptr [r8]
	mov	qword ptr [rsp - 112], rdi      # 8-byte Spill
	mov	rcx, qword ptr [r8 + 8]
	mov	qword ptr [rsp + 112], rcx      # 8-byte Spill
	mov	rbp, qword ptr [r8 + 16]
	mov	rax, rbp
	mov	qword ptr [rsp + 120], rbp      # 8-byte Spill
	mul	r12
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rsi, rax
	mov	rax, rcx
	mul	r12
	mov	rcx, rdx
	mov	r14, rax
	mov	rax, rdi
	mul	r12
	mov	rdi, rdx
	movabs	rdx, -8506173809081122819
	mov	r9, rax
	mov	rbx, rax
	imul	rbx, rdx
	mov	qword ptr [rsp - 56], rbx       # 8-byte Spill
	movabs	rax, 5532603552561700244
	mov	r8, r9
	imul	r8, rax
	movabs	rax, 436827220531937283
	mov	r10, r9
	mov	r13, r9
	mov	qword ptr [rsp - 80], r9        # 8-byte Spill
	imul	r10, rax
	movabs	rdx, 2210141511517208575
	mov	rax, rbx
	mul	rdx
	mov	r15, rdx
	movabs	rdx, -5044313057631688021
	mov	rax, rbx
	mul	rdx
	mov	r9, rdx
	add	r9, r10
	adc	r15, r8
	xor	eax, eax
	test	r13, r13
	setne	al
	add	rdi, r14
	adc	rcx, rsi
	setb	r11b
	lea	rdx, [rdi + rax]
	xor	ebx, ebx
	add	r9, rdx
	setb	bl
	add	rdi, rax
	adc	rbx, rcx
	setb	r10b
	mov	rcx, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rax, qword ptr [rcx + 32]
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mov	qword ptr [rsp + 32], r12       # 8-byte Spill
	mul	r12
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	rax, qword ptr [rcx + 24]
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mul	r12
	mov	r12, rax
	mov	r13, rdx
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rcx, qword ptr [rax + 8]
	mov	qword ptr [rsp + 104], rcx      # 8-byte Spill
	mov	rax, rbp
	mul	rcx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rbp, rax
	mov	rax, qword ptr [rsp + 112]      # 8-byte Reload
	mul	rcx
	mov	rsi, rdx
	mov	rdi, rax
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mul	rcx
	mov	rcx, rax
	mov	r14, rdx
	add	r14, rdi
	adc	rsi, rbp
	setb	byte ptr [rsp - 64]             # 1-byte Folded Spill
	add	r11b, 255
	adc	r12, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], r13      # 8-byte Spill
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	xor	edi, edi
	mov	rbp, rbx
	add	rbp, r15
	setb	dil
	add	r10b, 255
	adc	rdi, r12
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	movabs	rax, 3064711249896130499
	mov	r13, qword ptr [rsp - 80]       # 8-byte Reload
	imul	r13, rax
	movabs	rdx, 7435674573564081700
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mul	rdx
	mov	r10, rdx
	cmp	r15, r8
	adc	r10, r13
	xor	r8d, r8d
	add	rdi, r10
	setb	r8b
	mov	rax, r9
	add	rax, rcx
	adc	rbx, r15
	add	r9, rcx
	adc	rbp, r14
	lea	rbx, [rbx + r14]
	adc	rdi, rsi
	setb	byte ptr [rsp + 24]             # 1-byte Folded Spill
	mov	rcx, r9
	movabs	rax, -8506173809081122819
	imul	rcx, rax
	mov	qword ptr [rsp], rcx            # 8-byte Spill
	mov	r14, r9
	movabs	rax, 5532603552561700244
	imul	r14, rax
	mov	rsi, r9
	mov	r15, r9
	movabs	rax, 436827220531937283
	imul	rsi, rax
	mov	rax, rcx
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	r9, rdx
	mov	rax, rcx
	movabs	rcx, -5044313057631688021
	mul	rcx
	mov	r11, rdx
	add	r11, rsi
	adc	r9, r14
	xor	eax, eax
	test	r15, r15
	mov	qword ptr [rsp - 8], r15        # 8-byte Spill
	setne	al
	lea	rdx, [rbx + rax]
	xor	r12d, r12d
	add	r11, rdx
	setb	r12b
	add	rbx, rax
	adc	r12, rdi
	setb	bpl
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rcx, qword ptr [rsp + 104]      # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	rdi, rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	rcx
	mov	rsi, rax
	add	byte ptr [rsp - 64], 255        # 1-byte Folded Spill
	adc	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rdx, rdi
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	setb	byte ptr [rsp + 192]            # 1-byte Folded Spill
	add	byte ptr [rsp - 120], 255       # 1-byte Folded Spill
	adc	r8, qword ptr [rsp - 104]       # 8-byte Folded Reload
	setb	byte ptr [rsp - 16]             # 1-byte Folded Spill
	movabs	rax, 2995800253092329851
	mov	rdi, qword ptr [rsp - 80]       # 8-byte Reload
	imul	rdi, rax
	mov	qword ptr [rsp - 24], rdi       # 8-byte Spill
	movabs	rcx, 7239337960414712511
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mul	rcx
	cmp	r10, r13
	adc	rdx, rdi
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	xor	ebx, ebx
	add	r8, rdx
	setb	bl
	add	byte ptr [rsp + 24], 255        # 1-byte Folded Spill
	adc	r8, rsi
	setb	byte ptr [rsp + 56]             # 1-byte Folded Spill
	xor	ecx, ecx
	mov	rsi, r12
	add	rsi, r9
	setb	cl
	add	bpl, 255
	adc	rcx, r8
	setb	byte ptr [rsp - 40]             # 1-byte Folded Spill
	movabs	rax, 3064711249896130499
	imul	r15, rax
	mov	qword ptr [rsp - 48], r15       # 8-byte Spill
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	movabs	rdx, 7435674573564081700
	mul	rdx
	cmp	r9, r14
	adc	rdx, r15
	mov	rbp, rdx
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	r8, qword ptr [rax + 16]
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mul	r8
	mov	rdi, rax
	mov	r13, rdx
	mov	r10, r11
	add	r10, rax
	adc	r12, r9
	mov	r9, r10
	movabs	rax, -8506173809081122819
	imul	r9, rax
	mov	qword ptr [rsp - 120], r9       # 8-byte Spill
	mov	rax, r10
	movabs	rdx, 5532603552561700244
	imul	rax, rdx
	mov	r14, rax
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	r10, rax
	mov	rax, r9
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	r15, rdx
	mov	rax, r9
	movabs	rdx, -5044313057631688021
	mul	rdx
	mov	r9, rdx
	add	r9, r10
	adc	r15, r14
	mov	qword ptr [rsp + 176], r15      # 8-byte Spill
	xor	r15d, r15d
	add	rcx, rbp
	setb	r15b
	mov	r14, qword ptr [rsp + 120]      # 8-byte Reload
	mov	rax, r14
	mul	r8
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rbp, rax
	mov	r10, qword ptr [rsp + 112]      # 8-byte Reload
	mov	rax, r10
	mul	r8
	add	rax, r13
	adc	rdx, rbp
	setb	bpl
	add	r11, rdi
	mov	qword ptr [rsp - 64], r11       # 8-byte Spill
	lea	rdi, [r12 + rax]
	adc	rax, rsi
	adc	rdx, rcx
	setb	byte ptr [rsp - 125]            # 1-byte Folded Spill
	xor	eax, eax
	test	r11, r11
	setne	al
	lea	rsi, [rdi + rax]
	xor	r13d, r13d
	add	r9, rsi
	mov	qword ptr [rsp - 96], r9        # 8-byte Spill
	setb	r13b
	add	rdi, rax
	adc	r13, rdx
	setb	byte ptr [rsp + 40]             # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	qword ptr [rsp + 208], r8       # 8-byte Spill
	mul	r8
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	rsi, rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	r8
	mov	rdi, rax
	mov	r8, rdx
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rcx, qword ptr [rax + 24]
	mov	qword ptr [rsp + 24], rcx       # 8-byte Spill
	mov	rax, r14
	mul	rcx
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	r9, rax
	mov	rax, r10
	mul	rcx
	mov	r11, rdx
	mov	r10, rax
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	r14, rdx
	add	r14, r10
	adc	r11, r9
	mov	qword ptr [rsp + 144], r11      # 8-byte Spill
	setb	byte ptr [rsp - 124]            # 1-byte Folded Spill
	add	bpl, 255
	adc	rdi, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r8, rsi
	mov	qword ptr [rsp + 72], r8        # 8-byte Spill
	setb	byte ptr [rsp - 123]            # 1-byte Folded Spill
	movzx	r9d, byte ptr [rsp - 122]       # 1-byte Folded Reload
	mov	eax, r9d
	add	al, 255
	mov	r8, qword ptr [rsp + 96]        # 8-byte Reload
	mov	rax, r8
	adc	rax, 0
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rax, qword ptr [rax + 40]
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	setb	sil
	mul	qword ptr [rsp + 32]            # 8-byte Folded Reload
	add	r9b, 255
	adc	rax, r8
	movzx	ecx, sil
	adc	rcx, rdx
	mov	qword ptr [rsp + 184], rcx      # 8-byte Spill
	add	byte ptr [rsp - 16], 255        # 1-byte Folded Spill
	adc	rbx, rax
	setb	byte ptr [rsp - 16]             # 1-byte Folded Spill
	movabs	rax, 326064518108171314
	mov	rcx, qword ptr [rsp - 80]       # 8-byte Reload
	imul	rcx, rax
	mov	qword ptr [rsp - 80], rcx       # 8-byte Spill
	movabs	rdx, 5412103778470702295
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mul	rdx
	mov	rax, qword ptr [rsp - 32]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	xor	ebp, ebp
	add	rbx, rdx
	setb	bpl
	add	byte ptr [rsp + 56], 255        # 1-byte Folded Spill
	adc	rbx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	setb	byte ptr [rsp + 168]            # 1-byte Folded Spill
	add	byte ptr [rsp - 40], 255        # 1-byte Folded Spill
	adc	r15, rbx
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 8]        # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	rcx, rax
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	movabs	rdx, 7239337960414712511
	mul	rdx
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	cmp	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	xor	r12d, r12d
	add	r15, rdx
	setb	r12b
	add	byte ptr [rsp - 125], 255       # 1-byte Folded Spill
	adc	r15, rdi
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	xor	r9d, r9d
	mov	rsi, r13
	mov	rcx, qword ptr [rsp + 176]      # 8-byte Reload
	add	rsi, rcx
	setb	r9b
	add	byte ptr [rsp + 40], 255        # 1-byte Folded Spill
	adc	r9, r15
	setb	byte ptr [rsp - 125]            # 1-byte Folded Spill
	mov	r8, qword ptr [rsp - 64]        # 8-byte Reload
	movabs	rax, 3064711249896130499
	imul	r8, rax
	mov	qword ptr [rsp + 40], r8        # 8-byte Spill
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rdx, 7435674573564081700
	mul	rdx
	mov	rdi, rdx
	cmp	rcx, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	rdi, r8
	mov	r11, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rbx, r11
	mov	r10, qword ptr [rsp + 128]      # 8-byte Reload
	add	rbx, r10
	adc	r13, rcx
	mov	r8, rbx
	movabs	rax, -8506173809081122819
	imul	r8, rax
	mov	qword ptr [rsp + 32], r8        # 8-byte Spill
	mov	rdx, rbx
	movabs	rax, 5532603552561700244
	imul	rdx, rax
	mov	r15, rdx
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	rbx, rax
	mov	rax, r8
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	rcx, rdx
	mov	rax, r8
	movabs	rdx, -5044313057631688021
	mul	rdx
	add	rdx, rbx
	mov	r8, rdx
	adc	rcx, r15
	mov	qword ptr [rsp + 136], rcx      # 8-byte Spill
	xor	r15d, r15d
	add	r9, rdi
	setb	r15b
	add	r11, r10
	mov	qword ptr [rsp - 96], r11       # 8-byte Spill
	adc	rsi, r14
	lea	rax, [r13 + r14]
	adc	r9, qword ptr [rsp + 144]       # 8-byte Folded Reload
	setb	r10b
	xor	ecx, ecx
	test	r11, r11
	setne	cl
	lea	rdx, [rax + rcx]
	xor	esi, esi
	add	r8, rdx
	mov	qword ptr [rsp - 72], r8        # 8-byte Spill
	setb	sil
	add	rax, rcx
	adc	rsi, r9
	setb	r11b
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r8, qword ptr [rsp + 24]        # 8-byte Reload
	mul	r8
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	rcx, rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	r8
	mov	r9, rax
	add	byte ptr [rsp - 124], 255       # 1-byte Folded Spill
	adc	r9, qword ptr [rsp + 64]        # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	setb	byte ptr [rsp - 122]            # 1-byte Folded Spill
	movzx	r14d, byte ptr [rsp + 192]      # 1-byte Folded Reload
	mov	eax, r14d
	add	al, 255
	mov	r8, qword ptr [rsp + 200]       # 8-byte Reload
	mov	rax, r8
	adc	rax, 0
	setb	bl
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp + 104]           # 8-byte Folded Reload
	mov	rcx, rax
	add	r14b, 255
	adc	rcx, r8
	movzx	eax, bl
	adc	rax, rdx
	mov	r8, rax
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	add	byte ptr [rsp - 16], 255        # 1-byte Folded Spill
	adc	rbp, qword ptr [rsp + 184]      # 8-byte Folded Reload
	setb	bl
	movabs	rdx, 1873798617647539866
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mul	rdx
	mov	rax, qword ptr [rsp + 152]      # 8-byte Reload
	cmp	rax, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	rdx, 0
	add	rdx, rbp
	movzx	eax, bl
	adc	rax, r8
	add	byte ptr [rsp + 168], 255       # 1-byte Folded Spill
	adc	rdx, rcx
	adc	rax, 0
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	r12, rdx
	setb	byte ptr [rsp + 184]            # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 8]        # 8-byte Reload
	movabs	rax, 326064518108171314
	imul	rcx, rax
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	movabs	rdx, 5412103778470702295
	mul	rdx
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	xor	eax, eax
	add	r12, rdx
	setb	al
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	add	byte ptr [rsp - 32], 255        # 1-byte Folded Spill
	adc	r12, qword ptr [rsp + 72]       # 8-byte Folded Reload
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	add	byte ptr [rsp - 125], 255       # 1-byte Folded Spill
	adc	r15, r12
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	mov	r8, qword ptr [rsp - 64]        # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	r8, rax
	mov	qword ptr [rsp - 40], r8        # 8-byte Spill
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rcx, 7239337960414712511
	mul	rcx
	cmp	rdi, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rdx, r8
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	xor	ebx, ebx
	add	r15, rdx
	setb	bl
	add	r10b, 255
	adc	r15, r9
	setb	byte ptr [rsp - 32]             # 1-byte Folded Spill
	xor	r13d, r13d
	mov	r14, rsi
	mov	rdi, qword ptr [rsp + 136]      # 8-byte Reload
	add	r14, rdi
	setb	r13b
	add	r11b, 255
	adc	r13, r15
	setb	byte ptr [rsp - 124]            # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 96]       # 8-byte Reload
	movabs	rax, 3064711249896130499
	imul	rcx, rax
	mov	qword ptr [rsp + 176], rcx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rdx, 7435674573564081700
	mul	rdx
	cmp	rdi, qword ptr [rsp + 56]       # 8-byte Folded Reload
	mov	r10, rdi
	adc	rdx, rcx
	mov	r15, rdx
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rcx, qword ptr [rax + 32]
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mul	rcx
	mov	rdi, rax
	mov	r12, rdx
	mov	r8, qword ptr [rsp - 72]        # 8-byte Reload
	mov	r9, r8
	add	r9, rax
	adc	rsi, r10
	mov	r10, r9
	movabs	rax, -8506173809081122819
	imul	r10, rax
	mov	qword ptr [rsp - 56], r10       # 8-byte Spill
	mov	rdx, r9
	movabs	rax, 5532603552561700244
	imul	rdx, rax
	mov	r11, rdx
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	r9, rax
	mov	rax, r10
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	rbp, rdx
	mov	rax, r10
	movabs	rdx, -5044313057631688021
	mul	rdx
	mov	r10, rdx
	add	r10, r9
	adc	rbp, r11
	mov	qword ptr [rsp + 40], rbp       # 8-byte Spill
	xor	r11d, r11d
	add	r13, r15
	setb	r11b
	mov	r15, qword ptr [rsp + 120]      # 8-byte Reload
	mov	rax, r15
	mul	rcx
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	mov	rbp, rax
	mov	r9, qword ptr [rsp + 112]       # 8-byte Reload
	mov	rax, r9
	mul	rcx
	add	rax, r12
	adc	rdx, rbp
	setb	bpl
	add	r8, rdi
	mov	qword ptr [rsp - 72], r8        # 8-byte Spill
	lea	rsi, [rsi + rax]
	adc	rax, r14
	adc	rdx, r13
	setb	byte ptr [rsp + 128]            # 1-byte Folded Spill
	xor	eax, eax
	test	r8, r8
	setne	al
	lea	r8, [rsi + rax]
	xor	edi, edi
	add	r10, r8
	mov	qword ptr [rsp - 80], r10       # 8-byte Spill
	setb	dil
	add	rsi, rax
	adc	rdi, rdx
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mov	r8, qword ptr [rax + 40]
	mov	qword ptr [rsp + 104], r8       # 8-byte Spill
	setb	byte ptr [rsp - 121]            # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	qword ptr [rsp + 192], rcx      # 8-byte Spill
	mul	rcx
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	r14, rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	rcx
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, r15
	mul	r8
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	r10, rax
	mov	rax, r9
	mul	r8
	mov	r9, rdx
	mov	r13, rax
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mul	r8
	mov	r8, rax
	add	rdx, r13
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	adc	r9, r10
	mov	qword ptr [rsp - 112], r9       # 8-byte Spill
	setb	byte ptr [rsp - 125]            # 1-byte Folded Spill
	add	bpl, 255
	adc	rsi, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rcx, r14
	mov	qword ptr [rsp + 72], rcx       # 8-byte Spill
	setb	byte ptr [rsp + 112]            # 1-byte Folded Spill
	movzx	ecx, byte ptr [rsp - 123]       # 1-byte Folded Reload
	mov	eax, ecx
	add	al, 255
	mov	r14, qword ptr [rsp + 88]       # 8-byte Reload
	mov	rax, r14
	adc	rax, 0
	setb	r10b
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp + 208]           # 8-byte Folded Reload
	mov	r9, rax
	add	cl, 255
	adc	r9, r14
	movzx	r15d, r10b
	adc	r15, rdx
	mov	qword ptr [rsp + 136], r15      # 8-byte Spill
	add	byte ptr [rsp + 184], 255       # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 16]       # 8-byte Reload
	mov	r12, qword ptr [rsp + 152]      # 8-byte Reload
	adc	r12, rcx
	setb	r14b
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	movabs	rdx, 1873798617647539866
	mul	rdx
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	cmp	rax, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rdx, 0
	cmp	rcx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	adc	r15, 0
	add	rdx, r12
	movzx	eax, r14b
	adc	r15, rax
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	rdx, r9
	adc	r15, 0
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	rbx, rdx
	setb	byte ptr [rsp - 48]             # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 64]       # 8-byte Reload
	movabs	rax, 326064518108171314
	imul	rcx, rax
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rdx, 5412103778470702295
	mul	rdx
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rdx, rcx
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	xor	r14d, r14d
	add	rbx, rdx
	setb	r14b
	add	byte ptr [rsp - 32], 255        # 1-byte Folded Spill
	adc	rbx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	setb	byte ptr [rsp + 64]             # 1-byte Folded Spill
	add	byte ptr [rsp - 124], 255       # 1-byte Folded Spill
	adc	r11, rbx
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	mov	r9, qword ptr [rsp - 96]        # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	r9, rax
	mov	qword ptr [rsp + 80], r9        # 8-byte Spill
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rcx, 7239337960414712511
	mul	rcx
	mov	rax, qword ptr [rsp + 144]      # 8-byte Reload
	cmp	rax, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	rdx, r9
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	xor	r10d, r10d
	add	r11, rdx
	setb	r10b
	add	byte ptr [rsp + 128], 255       # 1-byte Folded Spill
	adc	r11, rsi
	setb	byte ptr [rsp - 123]            # 1-byte Folded Spill
	xor	esi, esi
	mov	r12, rdi
	mov	r9, rdi
	mov	rbx, qword ptr [rsp + 40]       # 8-byte Reload
	add	r9, rbx
	setb	sil
	add	byte ptr [rsp - 121], 255       # 1-byte Folded Spill
	adc	rsi, r11
	setb	byte ptr [rsp - 24]             # 1-byte Folded Spill
	mov	rcx, qword ptr [rsp - 72]       # 8-byte Reload
	movabs	rax, 3064711249896130499
	imul	rcx, rax
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	movabs	rdx, 7435674573564081700
	mul	rdx
	cmp	rbx, qword ptr [rsp + 168]      # 8-byte Folded Reload
	adc	rdx, rcx
	mov	rcx, rdx
	mov	rbp, qword ptr [rsp - 80]       # 8-byte Reload
	mov	r11, rbp
	mov	rdi, r8
	add	r11, r8
	adc	r12, rbx
	mov	r8, r12
	movabs	rbx, -8506173809081122819
	imul	rbx, r11
	mov	qword ptr [rsp], rbx            # 8-byte Spill
	movabs	r13, 5532603552561700244
	imul	r13, r11
	mov	qword ptr [rsp + 120], r13      # 8-byte Spill
	movabs	rax, 436827220531937283
	imul	r11, rax
	mov	rax, rbx
	movabs	rdx, 2210141511517208575
	mul	rdx
	mov	r12, rdx
	mov	rax, rbx
	movabs	rdx, -5044313057631688021
	mul	rdx
	add	rdx, r11
	mov	rbx, rdx
	adc	r12, r13
	mov	qword ptr [rsp - 8], r12        # 8-byte Spill
	xor	r11d, r11d
	add	rsi, rcx
	setb	r11b
	mov	r12, rbp
	add	r12, rdi
	mov	qword ptr [rsp - 80], r12       # 8-byte Spill
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	adc	r9, rax
	lea	rax, [r8 + rax]
	adc	rsi, qword ptr [rsp - 112]      # 8-byte Folded Reload
	setb	r13b
	xor	edx, edx
	test	r12, r12
	setne	dl
	lea	rdi, [rax + rdx]
	xor	r8d, r8d
	add	rbx, rdi
	mov	qword ptr [rsp - 88], rbx       # 8-byte Spill
	setb	r8b
	add	rax, rdx
	adc	r8, rsi
	mov	qword ptr [rsp - 112], r8       # 8-byte Spill
	setb	byte ptr [rsp + 48]             # 1-byte Folded Spill
	mov	rax, qword ptr [rsp + 16]       # 8-byte Reload
	mov	rdi, qword ptr [rsp + 104]      # 8-byte Reload
	mul	rdi
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	rsi, rax
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	rdi
	mov	r9, rax
	add	byte ptr [rsp - 125], 255       # 1-byte Folded Spill
	adc	r9, qword ptr [rsp + 56]        # 8-byte Folded Reload
	adc	rdx, rsi
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	setb	byte ptr [rsp + 8]              # 1-byte Folded Spill
	movzx	r8d, byte ptr [rsp - 122]       # 1-byte Folded Reload
	mov	eax, r8d
	add	al, 255
	mov	rdi, qword ptr [rsp + 96]       # 8-byte Reload
	mov	rax, rdi
	adc	rax, 0
	setb	sil
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp + 24]            # 8-byte Folded Reload
	mov	r12, rax
	add	r8b, 255
	adc	r12, rdi
	movzx	esi, sil
	adc	rsi, rdx
	mov	qword ptr [rsp + 24], rsi       # 8-byte Spill
	add	byte ptr [rsp - 48], 255        # 1-byte Folded Spill
	adc	r14, r15
	setb	dil
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	movabs	rdx, 1873798617647539866
	mul	rdx
	mov	rax, qword ptr [rsp - 40]       # 8-byte Reload
	cmp	rax, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	r15, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	rsi, 0
	add	rdx, r14
	movzx	eax, dil
	adc	rsi, rax
	add	byte ptr [rsp + 64], 255        # 1-byte Folded Spill
	adc	rdx, r12
	adc	rsi, 0
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	r10, rdx
	setb	bl
	movabs	rax, 326064518108171314
	mov	rdi, qword ptr [rsp - 96]       # 8-byte Reload
	imul	rdi, rax
	mov	qword ptr [rsp - 96], rdi       # 8-byte Spill
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rdx, 5412103778470702295
	mul	rdx
	mov	r12, rdx
	mov	rax, qword ptr [rsp - 16]       # 8-byte Reload
	cmp	rax, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r12, rdi
	xor	ebp, ebp
	add	r10, r12
	setb	bpl
	add	byte ptr [rsp - 123], 255       # 1-byte Folded Spill
	adc	r10, qword ptr [rsp + 72]       # 8-byte Folded Reload
	setb	byte ptr [rsp + 88]             # 1-byte Folded Spill
	add	byte ptr [rsp - 24], 255        # 1-byte Folded Spill
	adc	r11, r10
	setb	byte ptr [rsp - 120]            # 1-byte Folded Spill
	mov	r8, qword ptr [rsp - 72]        # 8-byte Reload
	movabs	rax, 2995800253092329851
	imul	r8, rax
	mov	r15, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rax, r15
	movabs	rdx, 7239337960414712511
	mul	rdx
	mov	r14, rdx
	cmp	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r14, r8
	xor	r10d, r10d
	add	r11, r14
	setb	r10b
	add	r13b, 255
	adc	r11, r9
	setb	byte ptr [rsp + 96]             # 1-byte Folded Spill
	xor	r13d, r13d
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	add	qword ptr [rsp - 112], rax      # 8-byte Folded Spill
	setb	r13b
	add	byte ptr [rsp + 48], 255        # 1-byte Folded Spill
	adc	r13, r11
	setb	byte ptr [rsp - 64]             # 1-byte Folded Spill
	movzx	r11d, byte ptr [rsp + 112]      # 1-byte Folded Reload
	mov	eax, r11d
	add	al, 255
	mov	rcx, qword ptr [rsp + 200]      # 8-byte Reload
	mov	rax, rcx
	adc	rax, 0
	setb	dil
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp + 192]           # 8-byte Folded Reload
	mov	r9, rax
	add	r11b, 255
	adc	r9, rcx
	movzx	r11d, dil
	adc	r11, rdx
	add	bl, 255
	adc	rbp, rsi
	setb	bl
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	movabs	rcx, 1873798617647539866
	mul	rcx
	cmp	r12, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rdx, 0
	cmp	rsi, qword ptr [rsp + 24]       # 8-byte Folded Reload
	mov	rsi, r11
	adc	rsi, 0
	add	rdx, rbp
	movzx	eax, bl
	adc	rsi, rax
	add	byte ptr [rsp + 88], 255        # 1-byte Folded Spill
	adc	rdx, r9
	adc	rsi, 0
	add	byte ptr [rsp - 120], 255       # 1-byte Folded Spill
	adc	r10, rdx
	setb	bpl
	mov	rdi, qword ptr [rsp - 72]       # 8-byte Reload
	movabs	rax, 326064518108171314
	imul	rdi, rax
	mov	qword ptr [rsp - 72], rdi       # 8-byte Spill
	mov	rax, r15
	movabs	rcx, 5412103778470702295
	mul	rcx
	mov	r9, rdx
	cmp	r14, r8
	adc	r9, rdi
	xor	r14d, r14d
	add	r10, r9
	setb	r14b
	add	byte ptr [rsp + 96], 255        # 1-byte Folded Spill
	adc	r10, qword ptr [rsp + 208]      # 8-byte Folded Reload
	setb	r12b
	movabs	rdi, 3064711249896130499
	imul	rdi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rdi      # 8-byte Spill
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	movabs	rcx, 7435674573564081700
	mul	rcx
	mov	rcx, rdx
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	cmp	qword ptr [rsp - 8], rax        # 8-byte Folded Reload
	adc	rcx, rdi
	xor	edi, edi
	add	r13, rcx
	setb	dil
	add	byte ptr [rsp - 64], 255        # 1-byte Folded Spill
	adc	rdi, r10
	setb	byte ptr [rsp - 96]             # 1-byte Folded Spill
	movzx	r15d, byte ptr [rsp + 8]        # 1-byte Folded Reload
	mov	eax, r15d
	add	al, 255
	mov	r8, qword ptr [rsp + 16]        # 8-byte Reload
	mov	rax, r8
	adc	rax, 0
	setb	bl
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp + 104]           # 8-byte Folded Reload
	mov	r10, rax
	add	r15b, 255
	adc	r10, r8
	movzx	r15d, bl
	adc	r15, rdx
	add	bpl, 255
	adc	r14, rsi
	setb	bl
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	movabs	rbp, 1873798617647539866
	mul	rbp
	mov	r8, rdx
	cmp	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	adc	r8, 0
	cmp	rsi, r11
	mov	r11, r15
	adc	r11, 0
	add	r8, r14
	movzx	eax, bl
	adc	r11, rax
	add	r12b, 255
	adc	r8, r10
	adc	r11, 0
	movabs	r9, 2995800253092329851
	mov	r14, qword ptr [rsp - 80]       # 8-byte Reload
	imul	r9, r14
	mov	rbx, qword ptr [rsp]            # 8-byte Reload
	mov	rax, rbx
	movabs	r12, 7239337960414712511
	mul	r12
	mov	rsi, rdx
	cmp	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rsi, r9
	mov	r10, r9
	xor	r9d, r9d
	add	rdi, rsi
	setb	r9b
	add	byte ptr [rsp - 96], 255        # 1-byte Folded Spill
	adc	r9, r8
	setb	r8b
	movabs	rax, 326064518108171314
	imul	r14, rax
	mov	rax, rbx
	movabs	r12, 5412103778470702295
	mul	r12
	mov	rcx, rdx
	cmp	rsi, r10
	adc	rcx, r14
	xor	esi, esi
	add	r9, rcx
	setb	sil
	add	r8b, 255
	adc	rsi, r11
	setb	r8b
	xor	r10d, r10d
	cmp	r11, r15
	setb	r10b
	mov	rax, rbx
	mul	rbp
	cmp	rcx, r14
	adc	rdx, 0
	add	rdx, rsi
	movzx	r8d, r8b
	adc	r8, r10
	xor	ecx, ecx
	mov	r10, qword ptr [rsp - 112]      # 8-byte Reload
	movabs	rax, 2210141511517208575
	sub	r10, rax
	mov	r11d, 0
	sbb	r11, r11
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	movabs	rsi, -5044313057631688021
	sub	rax, rsi
	mov	rsi, r10
	sbb	rsi, 0
	cmp	r10, rsi
	sbb	r11, 0
	mov	rbx, r13
	movabs	r10, 7435674573564081700
	sub	rbx, r10
	mov	r14d, 0
	sbb	r14, r14
	lea	r10, [r11 + rbx]
	cmp	rbx, r10
	sbb	r14, 0
	mov	r11, rdi
	movabs	rbx, 7239337960414712511
	sub	r11, rbx
	mov	r15d, 0
	sbb	r15, r15
	lea	rbx, [r14 + r11]
	cmp	r11, rbx
	sbb	r15, 0
	mov	r11, r9
	sub	r11, r12
	mov	r12d, 0
	sbb	r12, r12
	lea	r14, [r15 + r11]
	cmp	r11, r14
	sbb	r12, 0
	mov	r15, rdx
	sub	r15, rbp
	mov	ebp, 0
	sbb	rbp, rbp
	lea	r11, [r12 + r15]
	cmp	r15, r11
	sbb	rbp, 0
	add	rbp, r8
	cmp	r8, rbp
	mov	r12d, 0
	sbb	r12, r12
	cmp	r8, rbp
	cmovb	rsi, rcx
	cmovb	r10, rcx
	cmovb	rbx, rcx
	cmovb	r14, rcx
	cmovb	rax, rcx
	cmovb	r11, rcx
	mov	rcx, qword ptr [rsp - 112]      # 8-byte Reload
	and	rcx, r12
	or	rcx, rsi
	mov	rsi, rcx
	and	r13, r12
	or	r13, r10
	and	rdi, r12
	or	rdi, rbx
	and	r9, r12
	or	r9, r14
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	and	rcx, r12
	or	rcx, rax
	mov	rax, qword ptr [rsp + 216]      # 8-byte Reload
	mov	qword ptr [rax], rcx
	mov	qword ptr [rax + 8], rsi
	mov	qword ptr [rax + 16], r13
	mov	qword ptr [rax + 24], rdi
	mov	qword ptr [rax + 32], r9
	and	r12, rdx
	or	r12, r11
	mov	qword ptr [rax + 40], r12
	add	rsp, 224
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

	.type	.Lalloc_e9bd63dd98e94b31ccf7d08f66ec79a5,@object # @alloc_e9bd63dd98e94b31ccf7d08f66ec79a5
	.p2align	3, 0x0
.Lalloc_e9bd63dd98e94b31ccf7d08f66ec79a5:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000X\003\000\000\n\000\000"
	.size	.Lalloc_e9bd63dd98e94b31ccf7d08f66ec79a5, 24

	.type	.Lalloc_8f289943c5dfd7b314c24d06c8f083ca,@object # @alloc_8f289943c5dfd7b314c24d06c8f083ca
	.p2align	3, 0x0
.Lalloc_8f289943c5dfd7b314c24d06c8f083ca:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000Y\003\000\000\n\000\000"
	.size	.Lalloc_8f289943c5dfd7b314c24d06c8f083ca, 24

	.type	.Lalloc_71c53652abca8a51eb60ebd3631eb768,@object # @alloc_71c53652abca8a51eb60ebd3631eb768
	.p2align	3, 0x0
.Lalloc_71c53652abca8a51eb60ebd3631eb768:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000Z\003\000\000\n\000\000"
	.size	.Lalloc_71c53652abca8a51eb60ebd3631eb768, 24

	.type	.Lalloc_1852ddabd7a7e545aeef1de9b485fe67,@object # @alloc_1852ddabd7a7e545aeef1de9b485fe67
	.p2align	3, 0x0
.Lalloc_1852ddabd7a7e545aeef1de9b485fe67:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000[\003\000\000\n\000\000"
	.size	.Lalloc_1852ddabd7a7e545aeef1de9b485fe67, 24

	.type	.Lalloc_932ab575725f35df0960868ec086384e,@object # @alloc_932ab575725f35df0960868ec086384e
	.p2align	3, 0x0
.Lalloc_932ab575725f35df0960868ec086384e:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\\\003\000\000\n\000\000"
	.size	.Lalloc_932ab575725f35df0960868ec086384e, 24

	.type	.Lalloc_60574b00e2fff1f9c05e4d546e000c83,@object # @alloc_60574b00e2fff1f9c05e4d546e000c83
	.p2align	3, 0x0
.Lalloc_60574b00e2fff1f9c05e4d546e000c83:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000]\003\000\000\n\000\000"
	.size	.Lalloc_60574b00e2fff1f9c05e4d546e000c83, 24

	.type	.Lalloc_2c68f43360b35bda9eb427728e788b4b,@object # @alloc_2c68f43360b35bda9eb427728e788b4b
	.p2align	3, 0x0
.Lalloc_2c68f43360b35bda9eb427728e788b4b:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000_\003\000\000\n\000\000"
	.size	.Lalloc_2c68f43360b35bda9eb427728e788b4b, 24

	.type	.Lalloc_fb947b470f1d012f353fe867ddfc52e5,@object # @alloc_fb947b470f1d012f353fe867ddfc52e5
	.p2align	3, 0x0
.Lalloc_fb947b470f1d012f353fe867ddfc52e5:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000`\003\000\000\n\000\000"
	.size	.Lalloc_fb947b470f1d012f353fe867ddfc52e5, 24

	.type	.Lalloc_2513605e7e8ad7c4f4d2ef03df4c2730,@object # @alloc_2513605e7e8ad7c4f4d2ef03df4c2730
	.p2align	3, 0x0
.Lalloc_2513605e7e8ad7c4f4d2ef03df4c2730:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000a\003\000\000\n\000\000"
	.size	.Lalloc_2513605e7e8ad7c4f4d2ef03df4c2730, 24

	.type	.Lalloc_9abc5c5a3719caea0b6c1509c834d06a,@object # @alloc_9abc5c5a3719caea0b6c1509c834d06a
	.p2align	3, 0x0
.Lalloc_9abc5c5a3719caea0b6c1509c834d06a:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000b\003\000\000\n\000\000"
	.size	.Lalloc_9abc5c5a3719caea0b6c1509c834d06a, 24

	.type	.Lalloc_0985a57f7ced15affe9dcab2ce37865d,@object # @alloc_0985a57f7ced15affe9dcab2ce37865d
	.p2align	3, 0x0
.Lalloc_0985a57f7ced15affe9dcab2ce37865d:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000c\003\000\000\013\000\000"
	.size	.Lalloc_0985a57f7ced15affe9dcab2ce37865d, 24

	.type	.Lalloc_e7e3feff08307baee212ddc5ca323a79,@object # @alloc_e7e3feff08307baee212ddc5ca323a79
	.p2align	3, 0x0
.Lalloc_e7e3feff08307baee212ddc5ca323a79:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000d\003\000\000\013\000\000"
	.size	.Lalloc_e7e3feff08307baee212ddc5ca323a79, 24

	.type	.Lalloc_54a0420761e120886671384eafca676e,@object # @alloc_54a0420761e120886671384eafca676e
	.p2align	3, 0x0
.Lalloc_54a0420761e120886671384eafca676e:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\262\006\000\000\005\000\000"
	.size	.Lalloc_54a0420761e120886671384eafca676e, 24

	.type	.Lalloc_e71d16686660edf0ac4635f24d7ef080,@object # @alloc_e71d16686660edf0ac4635f24d7ef080
	.p2align	3, 0x0
.Lalloc_e71d16686660edf0ac4635f24d7ef080:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\263\006\000\000\005\000\000"
	.size	.Lalloc_e71d16686660edf0ac4635f24d7ef080, 24

	.type	.Lalloc_c4a1da9892a9328aeb0c7ce56c96cc0f,@object # @alloc_c4a1da9892a9328aeb0c7ce56c96cc0f
	.p2align	3, 0x0
.Lalloc_c4a1da9892a9328aeb0c7ce56c96cc0f:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\264\006\000\000\005\000\000"
	.size	.Lalloc_c4a1da9892a9328aeb0c7ce56c96cc0f, 24

	.type	.Lalloc_e4cb97ff5e3f19b11cae213b2805ff31,@object # @alloc_e4cb97ff5e3f19b11cae213b2805ff31
	.p2align	3, 0x0
.Lalloc_e4cb97ff5e3f19b11cae213b2805ff31:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\265\006\000\000\005\000\000"
	.size	.Lalloc_e4cb97ff5e3f19b11cae213b2805ff31, 24

	.type	.Lalloc_fe3a2b043de24dcbb1347ea6a56848d6,@object # @alloc_fe3a2b043de24dcbb1347ea6a56848d6
	.p2align	3, 0x0
.Lalloc_fe3a2b043de24dcbb1347ea6a56848d6:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\266\006\000\000\005\000\000"
	.size	.Lalloc_fe3a2b043de24dcbb1347ea6a56848d6, 24

	.type	.Lalloc_d960939cb83710d4cbb4de88fa25717c,@object # @alloc_d960939cb83710d4cbb4de88fa25717c
	.p2align	3, 0x0
.Lalloc_d960939cb83710d4cbb4de88fa25717c:
	.quad	.Lalloc_9b921ae87d3738fc962385f5b727e7d4
	.asciz	"\f\000\000\000\000\000\000\000\267\006\000\000\005\000\000"
	.size	.Lalloc_d960939cb83710d4cbb4de88fa25717c, 24

	.section	".note.GNU-stack","",@progbits

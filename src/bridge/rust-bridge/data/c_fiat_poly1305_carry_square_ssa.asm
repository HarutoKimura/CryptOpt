	.text
	.intel_syntax noprefix
	.file	"c_fiat_poly1305_carry_square.c"
	.globl	c_fiat_poly1305_carry_square    # -- Begin function c_fiat_poly1305_carry_square
	.p2align	4, 0x90
	.type	c_fiat_poly1305_carry_square,@function
c_fiat_poly1305_carry_square:           # @c_fiat_poly1305_carry_square
	.cfi_startproc
# %bb.0:
	push	r15
	.cfi_def_cfa_offset 16
	push	r14
	.cfi_def_cfa_offset 24
	push	r13
	.cfi_def_cfa_offset 32
	push	r12
	.cfi_def_cfa_offset 40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset rbx, -48
	.cfi_offset r12, -40
	.cfi_offset r13, -32
	.cfi_offset r14, -24
	.cfi_offset r15, -16
	mov	r10, qword ptr [rsi + 16]
	lea	rax, [r10 + 4*r10]
	lea	r11, [r10 + r10]
	mov	rbx, qword ptr [rsi]
	mov	r9, qword ptr [rsi + 8]
	lea	rcx, [r9 + r9]
	mul	r10
	mov	r8, rax
	mov	rsi, rdx
	shl	r10, 2
	lea	rdx, [r10 + 4*r10]
	mov	rax, r9
	mul	rdx
	mov	r15, rdx
	mov	r13, rax
	mov	rax, rcx
	mul	r9
	mov	r14, rdx
	mov	r12, rax
	mov	rax, rbx
	mul	r11
	mov	r9, rdx
	mov	r11, rax
	mov	rax, rbx
	mul	rcx
	mov	rcx, rdx
	mov	r10, rax
	mov	rax, rbx
	mul	rbx
	add	rax, r13
	adc	rdx, r15
	shld	rdx, rax, 20
	movabs	rbx, 17592186044415
	and	rax, rbx
	add	r11, r12
	adc	r9, r14
	add	r10, r8
	adc	rcx, rsi
	add	r10, rdx
	adc	rcx, 0
	shld	rcx, r10, 21
	movabs	rdx, 8796093022207
	and	r10, rdx
	add	rcx, r11
	adc	r9, 0
	shld	r9, rcx, 21
	and	rcx, rdx
	lea	rsi, [r9 + 4*r9]
	add	rsi, rax
	mov	rax, rsi
	shr	rax, 44
	add	rax, r10
	and	rsi, rbx
	mov	r8, rax
	shr	r8, 43
	add	r8, rcx
	and	rax, rdx
	mov	qword ptr [rdi], rsi
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], r8
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.Lfunc_end0:
	.size	c_fiat_poly1305_carry_square, .Lfunc_end0-c_fiat_poly1305_carry_square
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

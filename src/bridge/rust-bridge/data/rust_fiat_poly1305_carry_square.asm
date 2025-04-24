	.text
	.intel_syntax noprefix
	.file	"rust_fiat_poly1305_carry_square.738b5a6c1d110e9e-cgu.0"
	.globl	rust_fiat_poly1305_carry_square # -- Begin function rust_fiat_poly1305_carry_square
	.p2align	4, 0x90
	.type	rust_fiat_poly1305_carry_square,@function
rust_fiat_poly1305_carry_square:        # @rust_fiat_poly1305_carry_square
	.cfi_startproc
# %bb.0:                                # %start
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
	mov	rsi, qword ptr [rsi + 8]
	lea	rcx, [rsi + rsi]
	mul	r10
	mov	r9, rax
	mov	r8, rdx
	shl	r10, 2
	lea	rdx, [r10 + 4*r10]
	mov	rax, rsi
	mul	rdx
	mov	r15, rdx
	mov	r13, rax
	mov	rax, rcx
	mul	rsi
	mov	r14, rdx
	mov	r12, rax
	mov	rax, rbx
	mul	r11
	mov	r10, rdx
	mov	r11, rax
	mov	rax, rbx
	mul	rcx
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, rbx
	mul	rbx
	add	rax, r13
	adc	rdx, r15
	shld	rdx, rax, 20
	movabs	rbx, 17592186044413
	and	rax, rbx
	add	r11, r12
	adc	r10, r14
	add	rsi, r9
	adc	rcx, r8
	add	rsi, rdx
	adc	rcx, 0
	shld	rcx, rsi, 21
	movabs	rdx, 8796093022207
	and	rsi, rdx
	add	rcx, r11
	adc	r10, 0
	shld	r10, rcx, 21
	and	rcx, rdx
	lea	r8, [r10 + 4*r10]
	add	r8, rax
	or	rbx, 2
	and	rbx, r8
	shr	r8, 44
	add	r8, rsi
	mov	rax, r8
	shr	rax, 43
	add	rax, rcx
	and	r8, rdx
	mov	qword ptr [rdi], rbx
	mov	qword ptr [rdi + 8], r8
	mov	qword ptr [rdi + 16], rax
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
	.size	rust_fiat_poly1305_carry_square, .Lfunc_end0-rust_fiat_poly1305_carry_square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

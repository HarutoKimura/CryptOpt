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
	mov	r8, qword ptr [rsi + 16]
	lea	rdx, [r8 + 4*r8]
	lea	r10, [r8 + r8]
	mov	rax, qword ptr [rsi]
	mulx	r9, r11, r8
	mov	rcx, qword ptr [rsi + 8]
	lea	rsi, [rcx + rcx]
	shl	r8, 2
	lea	r8, [r8 + 4*r8]
	mov	rdx, rcx
	mulx	rbx, r14, r8
	mov	rdx, rsi
	mulx	r15, r12, rcx
	mov	rdx, rax
	mulx	rcx, r8, r10
	mulx	rsi, r10, rsi
	mulx	r13, rdx, rax
	add	rdx, r14
	adc	r13, rbx
	shld	r13, rdx, 20
	movabs	rax, 17592186044413
	and	rdx, rax
	add	r8, r12
	adc	rcx, r15
	add	r10, r11
	adc	rsi, r9
	add	r10, r13
	adc	rsi, 0
	shld	rsi, r10, 21
	mov	r9b, 43
	bzhi	r10, r10, r9
	add	rsi, r8
	adc	rcx, 0
	shld	rcx, rsi, 21
	bzhi	rsi, rsi, r9
	lea	rcx, [rcx + 4*rcx]
	add	rcx, rdx
	or	rax, 2
	and	rax, rcx
	shr	rcx, 44
	add	rcx, r10
	bzhi	rdx, rcx, r9
	shr	rcx, 43
	add	rcx, rsi
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], rcx
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

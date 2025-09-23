	.text
	.intel_syntax noprefix
	.file	"c_fiat_poly1305_carry_mul.c"
	.globl	c_fiat_poly1305_carry_mul       # -- Begin function c_fiat_poly1305_carry_mul
	.p2align	4, 0x90
	.type	c_fiat_poly1305_carry_mul,@function
c_fiat_poly1305_carry_mul:              # @c_fiat_poly1305_carry_mul
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
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, rdx
	mov	r8, qword ptr [rsi + 16]
	mov	r15, qword ptr [rdx + 16]
	lea	rdx, [r15 + 4*r15]
	mulx	rcx, rdx, r8
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	mov	r13, qword ptr [rax + 8]
	lea	r10, [r13 + r13]
	lea	rdx, [r10 + 4*r10]
	mulx	r14, r11, r8
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rsi + 8]
	lea	rdx, [r15 + r15]
	lea	r9, [rdx + 4*rdx]
	mov	rdx, rcx
	mulx	rbx, r9, r9
	mov	rdx, rax
	mulx	rdx, rbp, r8
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	r8, r10, r10
	add	r9, r11
	mov	rsi, qword ptr [rsi]
	adc	rbx, r14
	mov	rdx, rax
	mulx	rcx, r14, rcx
	mov	rdx, rsi
	mulx	r11, r15, r15
	mulx	r13, r12, r13
	mulx	rax, rdx, rax
	add	r9, rdx
	adc	rbx, rax
	shld	rbx, r9, 20
	mov	al, 44
	bzhi	rdx, r9, rax
	add	r10, rbp
	adc	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	add	r10, r15
	adc	r8, r11
	add	r14, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r14, r12
	adc	rcx, r13
	add	r14, rbx
	adc	rcx, 0
	shld	rcx, r14, 21
	mov	sil, 43
	bzhi	r9, r14, rsi
	add	rcx, r10
	adc	r8, 0
	shld	r8, rcx, 21
	lea	r8, [r8 + 4*r8]
	add	r8, rdx
	bzhi	rax, r8, rax
	shr	r8, 44
	add	r8, r9
	bzhi	rcx, rcx, rsi
	bzhi	rdx, r8, rsi
	shr	r8, 43
	add	r8, rcx
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], r8
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
	.size	c_fiat_poly1305_carry_mul, .Lfunc_end0-c_fiat_poly1305_carry_mul
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

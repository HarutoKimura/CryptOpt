	.text
	.intel_syntax noprefix
	.file	"openssl_poly1305_mul.c"
	.globl	poly1305_mul                    # -- Begin function poly1305_mul
	.p2align	4, 0x90
	.type	poly1305_mul,@function
poly1305_mul:                           # @poly1305_mul
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
	mov	r10, rdx
	mov	r14, qword ptr [rdi]
	mov	rax, r14
	mul	rcx
	mov	r15, rax
	mov	r12, rdx
	mov	r13, qword ptr [rsi]
	mov	rax, r13
	mul	r9
	mov	r11, rdx
	mov	rbx, rax
	add	rbx, r15
	adc	r11, r12
	mov	rax, r14
	mul	r8
	mov	r8, rdx
	mov	r14, rax
	mov	rax, r13
	mul	rcx
	add	rax, r14
	adc	rdx, r8
	mov	r8, qword ptr [r10]
	imul	r9, r8
	add	r9, rax
	adc	rdx, 0
	imul	r8, rcx
	mov	qword ptr [r10], r8
	mov	qword ptr [rdi], rbx
	add	r9, r11
	mov	qword ptr [rsi], r9
	adc	rdx, qword ptr [r10]
	mov	rax, rdx
	shr	rax, 2
	mov	rcx, rdx
	and	rcx, -4
	add	rcx, rax
	and	edx, 3
	mov	qword ptr [r10], rdx
	add	qword ptr [rdi], rcx
	adc	qword ptr [rsi], 0
	adc	qword ptr [r10], 0
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
	.size	poly1305_mul, .Lfunc_end0-poly1305_mul
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

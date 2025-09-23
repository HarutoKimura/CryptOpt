	.text
	.intel_syntax noprefix
	.file	"c_fiat_curve25519_carry_square.c"
	.globl	c_fiat_curve25519_carry_square_vec  # -- Begin function c_fiat_curve25519_carry_square
	.p2align	4, 0x90
	.type	c_fiat_curve25519_carry_square,@function
c_fiat_curve25519_carry_square_vec:         # @c_fiat_curve25519_carry_square
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
	mov	r10, qword ptr [rsi + 32]
	lea	rax, [r10 + 8*r10]
	lea	rdx, [r10 + 2*rax]
	imul	r11, r10, 38
	mov	rax, qword ptr [rsi + 24]
	lea	rcx, [rax + 8*rax]
	lea	r8, [rax + 2*rcx]
	imul	rbx, rax, 38
	mov	rcx, qword ptr [rsi + 16]
	mulx	rdx, r9, r10
	mov	qword ptr [rsp - 48], r9        # 8-byte Spill
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, r11
	mov	qword ptr [rsp - 32], r9        # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r8, rax
	mov	qword ptr [rsp - 16], r8        # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, rcx
	mulx	r8, r9, r11
	mulx	r14, r15, rbx
	mulx	rdx, rbx, rcx
	mov	qword ptr [rsp - 64], rbx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsi + 8]
	mulx	rbx, rbp, r11
	add	rbp, r15
	adc	rbx, r14
	lea	r12, [r10 + r10]
	lea	r13, [rax + rax]
	lea	r15, [rcx + rcx]
	mov	rax, qword ptr [rsi]
	mulx	rsi, rcx, r13
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mulx	rcx, r11, r15
	lea	r10, [rdx + rdx]
	mov	qword ptr [rsp - 128], r10      # 8-byte Spill
	mulx	r10, r14, rdx
	mov	rdx, rax
	mulx	rdx, r12, r12
	mov	qword ptr [rsp - 112], r12      # 8-byte Spill
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r13, r13
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r15, r15
	mov	qword ptr [rsp - 88], r15       # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r15, qword ptr [rsp - 128] # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], r15       # 8-byte Spill
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rax, rdx, rax
	add	rbp, rdx
	adc	rbx, rax
	shld	rbx, rbp, 13
	mov	al, 51
	bzhi	rdx, rbp, rax
	mov	r15, qword ptr [rsp - 120]      # 8-byte Reload
	add	r15, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 56]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r11, r13
	adc	rcx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 16]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 8]         # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 128]       # 8-byte Folded Reload
	add	r9, rbx
	adc	r8, 0
	shld	r8, r9, 13
	bzhi	r9, r9, rax
	add	r8, r14
	adc	r10, 0
	shld	r10, r8, 13
	bzhi	r8, r8, rax
	add	r10, r11
	adc	rcx, 0
	shld	rcx, r10, 13
	bzhi	r10, r10, rax
	add	rcx, r15
	adc	rsi, 0
	shld	rsi, rcx, 13
	lea	r11, [rsi + 8*rsi]
	lea	rsi, [rsi + 2*r11]
	add	rsi, rdx
	bzhi	rdx, rsi, rax
	shr	rsi, 51
	add	rsi, r9
	bzhi	rcx, rcx, rax
	bzhi	rax, rsi, rax
	shr	rsi, 51
	add	rsi, r8
	mov	qword ptr [rdi], rdx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], rsi
	mov	qword ptr [rdi + 24], r10
	mov	qword ptr [rdi + 32], rcx
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
	.size	c_fiat_curve25519_carry_square, .Lfunc_end0-c_fiat_curve25519_carry_square
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

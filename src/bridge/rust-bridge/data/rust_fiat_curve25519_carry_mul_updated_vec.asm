	.text
	.intel_syntax noprefix
	.file	"rust_fiat_curve25519_carry_mul.fa7678d88e318ec8-cgu.0"
	.globl	rust_fiat_curve25519_carry_mul_vec  # -- Begin function rust_fiat_curve25519_carry_mul
	.p2align	4, 0x90
	.type	rust_fiat_curve25519_carry_mul_vec,@function
rust_fiat_curve25519_carry_mul_vec:         # @rust_fiat_curve25519_carry_mul
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
	sub	rsp, 136
	.cfi_def_cfa_offset 192
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, rdx
	mov	r14, qword ptr [rsi + 32]
	mov	rdx, qword ptr [rdx + 32]
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	mov	rdx, rcx
	mulx	rdx, r8, r14
	mov	qword ptr [rsp + 120], r8       # 8-byte Spill
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	mov	r8, qword ptr [rax + 24]
	mov	qword ptr [rsp - 120], r8       # 8-byte Spill
	lea	rdx, [r8 + 8*r8]
	lea	r9, [r8 + 2*rdx]
	mov	rdx, r9
	mulx	rdx, r8, r14
	mov	qword ptr [rsp + 96], r8        # 8-byte Spill
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	mov	r8, qword ptr [rax + 16]
	mov	qword ptr [rsp - 128], r8       # 8-byte Spill
	lea	rdx, [r8 + 8*r8]
	lea	r10, [r8 + 2*rdx]
	mov	rdx, r10
	mulx	rdx, r8, r14
	mov	qword ptr [rsp + 88], r8        # 8-byte Spill
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	r8, qword ptr [rax + 8]
	lea	rdx, [r8 + 8*r8]
	lea	rdx, [r8 + 2*rdx]
	mov	r15, r8
	mulx	rdx, rbp, r14
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	r8, qword ptr [rsi + 24]
	mov	rdx, r8
	mulx	rdx, r11, rcx
	mov	qword ptr [rsp + 40], r11       # 8-byte Spill
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	r12, r13, r9
	mulx	rdx, rbx, r10
	add	rbx, rbp
	mov	r11, rdx
	adc	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	mov	r10, qword ptr [rsi + 16]
	mov	rdx, r10
	mulx	rdx, rbp, rcx
	mov	qword ptr [rsp - 24], rbp       # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, r9, r9
	add	rbx, r9
	adc	r11, rdx
	mov	r9, qword ptr [rsi + 8]
	mov	rdx, r9
	mulx	rcx, rdx, rcx
	add	rbx, rdx
	adc	r11, rcx
	mov	qword ptr [rsp - 80], r11       # 8-byte Spill
	mov	rax, qword ptr [rax]
	mov	rcx, qword ptr [rsi]
	mov	rdx, rax
	mulx	rdx, rsi, r14
	mov	qword ptr [rsp + 80], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	r11, r15
	mulx	rdx, rsi, r15
	mov	qword ptr [rsp + 56], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 16], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	rdx, r10
	mov	r15, qword ptr [rsp - 128]      # 8-byte Reload
	mulx	r8, rdx, r15
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rdx, r10
	mulx	rbp, r14, r11
	mov	rsi, r11
	mov	rdx, rax
	mulx	rdx, r10, r10
	mov	qword ptr [rsp - 40], r10       # 8-byte Spill
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	mov	rdx, r9
	mov	r10, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rdx, r11, r10
	mov	qword ptr [rsp + 32], r11       # 8-byte Spill
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	rdx, r9
	mulx	rdx, r11, r15
	mov	qword ptr [rsp], r11            # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	rdx, r9
	mulx	rdx, r11, rsi
	mov	qword ptr [rsp - 56], r11       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, r9
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r11, qword ptr [rsp - 112] # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r9, r10
	mov	qword ptr [rsp - 8], r9         # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r9, r15
	mov	qword ptr [rsp - 64], r9        # 8-byte Spill
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	r9, r10, rsi
	mulx	rax, rcx, rax
	add	rbx, rcx
	mov	rcx, qword ptr [rsp - 80]       # 8-byte Reload
	adc	rcx, rax
	shld	rcx, rbx, 13
	mov	rdx, rcx
	mov	al, 51
	bzhi	rcx, rbx, rax
	mov	r15, qword ptr [rsp + 40]       # 8-byte Reload
	add	r15, qword ptr [rsp + 96]       # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp + 64]       # 8-byte Reload
	adc	rbx, qword ptr [rsp + 112]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 88]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	r13, r10
	adc	r12, r9
	add	r13, rdx
	adc	r12, 0
	shld	r12, r13, 13
	bzhi	rdx, r13, rax
	mov	r10, r15
	add	r10, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	r9, rbx
	adc	r9, qword ptr [rsp - 48]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 32]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 128]       # 8-byte Folded Reload
	add	r10, r12
	adc	r9, 0
	shld	r9, r10, 13
	bzhi	r10, r10, rax
	add	r14, qword ptr [rsp + 120]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 128]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r14, r9
	adc	rbp, 0
	shld	rbp, r14, 13
	bzhi	r9, r14, rax
	mov	rsi, qword ptr [rsp - 96]       # 8-byte Reload
	add	rsi, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 72]        # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 48]        # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 104]       # 8-byte Folded Reload
	add	rsi, r11
	adc	r8, qword ptr [rsp - 112]       # 8-byte Folded Reload
	add	rsi, rbp
	adc	r8, 0
	shld	r8, rsi, 13
	lea	r11, [r8 + 8*r8]
	lea	r8, [r8 + 2*r11]
	add	r8, rcx
	bzhi	rcx, r8, rax
	shr	r8, 51
	add	r8, rdx
	bzhi	rdx, rsi, rax
	bzhi	rax, r8, rax
	shr	r8, 51
	add	r8, r10
	mov	qword ptr [rdi], rcx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], r9
	mov	qword ptr [rdi + 32], rdx
	add	rsp, 136
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
	.size	rust_fiat_curve25519_carry_mul, .Lfunc_end0-rust_fiat_curve25519_carry_mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

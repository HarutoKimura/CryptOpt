	.text
	.intel_syntax noprefix
	.file	"rust_fiat_curve25519_square.5092e006b1862508-cgu.0"
	.globl	rust_fiat_curve25519_carry_square # -- Begin function rust_fiat_curve25519_carry_square
	.p2align	4, 0x90
	.type	rust_fiat_curve25519_carry_square,@function
rust_fiat_curve25519_carry_square:      # @rust_fiat_curve25519_carry_square
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
	push	rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rdx, qword ptr [rsi + 32]
	lea	rax, [rdx + 8*rdx]
	lea	rax, [rdx + 2*rax]
	imul	r10, rdx, 38
	lea	rcx, [rdx + rdx]
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mov	r8, qword ptr [rsi + 24]
	lea	rcx, [r8 + 8*r8]
	lea	rcx, [r8 + 2*rcx]
	imul	r11, r8, 38
	mul	rdx
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	r9, qword ptr [rsi + 16]
	mov	rax, r8
	mul	r10
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rax, rcx
	mul	r8
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rax, r9
	mul	r10
	mov	rbx, rax
	mov	rcx, rdx
	add	r8, r8
	mov	qword ptr [rsp - 128], r8       # 8-byte Spill
	mov	rax, r9
	mul	r11
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	lea	r14, [r9 + r9]
	mov	qword ptr [rsp - 120], r14      # 8-byte Spill
	mov	rax, r9
	mul	r9
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rbp, qword ptr [rsi + 8]
	mov	rax, rbp
	mul	r10
	mov	r15, rdx
	mov	r9, rax
	mov	rax, rbp
	mul	r8
	mov	r11, rdx
	mov	r13, rax
	mov	rax, rbp
	mul	r14
	mov	r14, rax
	mov	r8, rdx
	mov	rsi, qword ptr [rsi]
	mov	rax, rbp
	mul	rbp
	mov	r10, rdx
	mov	r12, rax
	mov	rax, rsi
	mul	qword ptr [rsp - 112]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, rsi
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	add	rbp, rbp
	mov	rax, rsi
	mul	qword ptr [rsp - 120]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rax, rsi
	mul	rbp
	mov	rbp, rdx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, rsi
	mul	rsi
	add	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	r9, rax
	adc	r15, rdx
	shld	r15, r9, 13
	movabs	rax, 2251799813685247
	and	r9, rax
	add	r13, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 128]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp]            # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rcx, rbp
	add	rbx, r15
	adc	rcx, 0
	shld	rcx, rbx, 13
	and	rbx, rax
	add	rcx, r12
	adc	r10, 0
	shld	r10, rcx, 13
	and	rcx, rax
	add	r10, r14
	adc	r8, 0
	shld	r8, r10, 13
	and	r10, rax
	add	r8, r13
	adc	r11, 0
	shld	r11, r8, 13
	lea	rdx, [r11 + 8*r11]
	lea	rdx, [r11 + 2*rdx]
	add	rdx, r9
	mov	rsi, rdx
	shr	rsi, 51
	add	rsi, rbx
	mov	r9, rsi
	shr	r9, 51
	add	r9, rcx
	and	r8, rax
	and	rdx, rax
	and	rsi, rax
	mov	qword ptr [rdi], rdx
	mov	qword ptr [rdi + 8], rsi
	mov	qword ptr [rdi + 16], r9
	mov	qword ptr [rdi + 24], r10
	mov	qword ptr [rdi + 32], r8
	add	rsp, 8
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
	.size	rust_fiat_curve25519_carry_square, .Lfunc_end0-rust_fiat_curve25519_carry_square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

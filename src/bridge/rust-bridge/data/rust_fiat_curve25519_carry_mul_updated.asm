	.text
	.intel_syntax noprefix
	.file	"rust_fiat_curve25519_carry_mul.fa7678d88e318ec8-cgu.0"
	.globl	rust_fiat_curve25519_carry_mul  # -- Begin function rust_fiat_curve25519_carry_mul
	.p2align	4, 0x90
	.type	rust_fiat_curve25519_carry_mul,@function
rust_fiat_curve25519_carry_mul:         # @rust_fiat_curve25519_carry_mul
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
	sub	rsp, 192
	.cfi_def_cfa_offset 248
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r8, rdx
	mov	r15, qword ptr [rsi + 32]
	mov	r13, rsi
	mov	qword ptr [rsp - 104], rsi      # 8-byte Spill
	mov	rcx, qword ptr [rdx + 32]
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	lea	rax, [rcx + 8*rcx]
	lea	rbx, [rcx + 2*rax]
	mov	rax, rbx
	mul	r15
	mov	qword ptr [rsp + 176], rax      # 8-byte Spill
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	rcx, qword ptr [r8 + 24]
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	lea	rax, [rcx + 8*rcx]
	lea	r9, [rcx + 2*rax]
	mov	rax, r9
	mul	r15
	mov	qword ptr [rsp + 144], rax      # 8-byte Spill
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	mov	rcx, qword ptr [r8 + 16]
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	lea	rax, [rcx + 8*rcx]
	lea	r10, [rcx + 2*rax]
	mov	rax, r10
	mul	r15
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	rcx, qword ptr [r8 + 8]
	lea	rax, [rcx + 8*rcx]
	lea	rax, [rcx + 2*rax]
	mul	r15
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	r14, qword ptr [rsi + 24]
	mov	rax, r14
	mul	rbx
	mov	r11, rdx
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mov	rax, r14
	mul	r9
	mov	rbp, rdx
	mov	rsi, rax
	mov	rax, r14
	mul	r10
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mov	r12, rdx
	mov	r10, qword ptr [r13 + 16]
	mov	rax, r10
	mul	rbx
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	mov	rax, r10
	mul	r9
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	r9, qword ptr [r13 + 8]
	mov	rax, r9
	mul	rbx
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	r8, qword ptr [r8]
	mov	rax, r8
	mul	r15
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 160], rax      # 8-byte Spill
	mov	rax, r14
	mov	r15, rcx
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mul	rcx
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	mov	rax, r8
	mov	qword ptr [rsp - 88], r8        # 8-byte Spill
	mul	r14
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	rax, r10
	mov	rcx, qword ptr [rsp - 128]      # 8-byte Reload
	mul	rcx
	mov	r13, rdx
	mov	rbx, rax
	mov	rax, r10
	mul	r15
	mov	r15, rdx
	mov	r14, rax
	mov	rax, r8
	mul	r10
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	rax, r9
	mul	qword ptr [rsp - 120]           # 8-byte Folded Reload
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	mov	rax, r9
	mul	rcx
	mov	qword ptr [rsp + 32], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rax, r9
	mov	r8, qword ptr [rsp - 112]       # 8-byte Reload
	mul	r8
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mov	r10, qword ptr [rax]
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, rcx
	mul	r9
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rax, r10
	mul	qword ptr [rsp - 96]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, r10
	mul	qword ptr [rsp - 120]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rax, r10
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rax, r10
	mul	r8
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	r9, rax
	mov	rax, r10
	mul	rcx
	mov	r8, qword ptr [rsp + 16]        # 8-byte Reload
	add	r8, qword ptr [rsp + 56]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r8, rax
	adc	r12, rdx
	shld	r12, r8, 13
	movabs	rax, 2251799813685247
	and	r8, rax
	mov	rcx, qword ptr [rsp + 40]       # 8-byte Reload
	add	rcx, qword ptr [rsp + 144]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 152]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	rsi, r9
	adc	rbp, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rsi, r12
	adc	rbp, 0
	shld	rbp, rsi, 13
	and	rsi, rax
	add	rcx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rcx, rbp
	adc	r11, 0
	shld	r11, rcx, 13
	and	rcx, rax
	add	r14, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 32]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r14, r11
	adc	r15, 0
	shld	r15, r14, 13
	and	r14, rax
	add	rbx, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 168]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	rbx, r15
	adc	r13, 0
	shld	r13, rbx, 13
	lea	rdx, [8*r13]
	add	rdx, r13
	lea	rdx, [2*rdx]
	add	rdx, r13
	add	rdx, r8
	mov	r8, rdx
	shr	r8, 51
	add	r8, rsi
	mov	rsi, r8
	shr	rsi, 51
	add	rsi, rcx
	and	rbx, rax
	and	rdx, rax
	and	r8, rax
	mov	qword ptr [rdi], rdx
	mov	qword ptr [rdi + 8], r8
	mov	qword ptr [rdi + 16], rsi
	mov	qword ptr [rdi + 24], r14
	mov	qword ptr [rdi + 32], rbx
	add	rsp, 192
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

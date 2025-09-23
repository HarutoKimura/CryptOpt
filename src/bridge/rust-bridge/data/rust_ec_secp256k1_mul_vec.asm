	.text
	.intel_syntax noprefix
	.file	"field_5x52.25cc2e35debd5488-cgu.0"
	.globl	rust_ec_secp256k1_mul_vec                       # -- Begin function mul_inner
	.p2align	4, 0x90
	.type	rust_ec_secp256k1_mul_vec,@function
rust_ec_secp256k1_mul_vec:                              # @mul_inner
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
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r9, qword ptr [rsi]
	mov	qword ptr [rsp - 80], r9        # 8-byte Spill
	mov	rax, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	r8, qword ptr [rsi + 16]
	mov	qword ptr [rsp - 56], r8        # 8-byte Spill
	mov	rcx, qword ptr [rsi + 24]
	mov	rsi, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 8], rsi        # 8-byte Spill
	mov	rbx, qword ptr [rdx]
	mov	qword ptr [rsp - 40], rbx       # 8-byte Spill
	mov	r15, qword ptr [rdx + 8]
	mov	qword ptr [rsp - 64], r15       # 8-byte Spill
	mov	r14, qword ptr [rdx + 16]
	mov	qword ptr [rsp - 104], r14      # 8-byte Spill
	mov	r12, qword ptr [rdx + 24]
	mov	r11, qword ptr [rdx + 32]
	mov	rdx, r12
	mov	qword ptr [rsp - 16], r12       # 8-byte Spill
	mulx	rdx, r9, r9
	mov	qword ptr [rsp - 112], r9       # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rdx, r14
	mulx	r14, r13, rax
	mov	rdx, r15
	mulx	rbp, rax, r8
	mov	rdx, rbx
	mulx	r15, r9, rcx
	mov	r8, rcx
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 24], r11       # 8-byte Spill
	mov	rdx, r11
	mulx	r10, rcx, rsi
	mov	dl, 52
	bzhi	rdx, rcx, rdx
	add	r9, rax
	adc	r15, rbp
	add	r9, r13
	adc	r15, r14
	add	r9, qword ptr [rsp - 112]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	movabs	rax, 68719492368
	mulx	rax, rdx, rax
	add	r9, rdx
	mov	qword ptr [rsp - 72], r9        # 8-byte Spill
	adc	r15, rax
	shld	r10, rcx, 12
	shld	r15, r9, 12
	mov	rdx, r11
	mov	rbx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	rax, rcx, rbx
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rdx, r12
	mov	r11, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rcx, rax, r11
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mov	r14, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	rcx, rsi, r14
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r8, r9, r8
	mov	rbp, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rdx, rbp
	mulx	r13, r12, qword ptr [rsp - 8]   # 8-byte Folded Reload
	add	r12, r9
	adc	r13, r8
	add	r12, rsi
	adc	r13, rcx
	add	r12, rax
	adc	r13, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	rdx, r10
	movabs	rax, 68719492368
	mulx	rax, rcx, rax
	add	r12, rcx
	adc	r13, rax
	add	r12, r15
	adc	r13, 0
	shld	r13, r12, 12
	mov	r10, r12
	shr	r10, 48
	mov	rdx, rbp
	mulx	rax, rcx, rbx
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rcx, rax, r11
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	r11, qword ptr [rsp - 16]       # 8-byte Reload
	mov	rdx, r11
	mulx	rsi, r8, r14
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r9, r14, qword ptr [rsp - 32]   # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rdx, rcx
	mov	rbx, qword ptr [rsp - 8]        # 8-byte Reload
	mulx	r15, rbp, rbx
	and	r10d, 15
	add	rbp, r14
	adc	r15, r9
	add	rbp, r8
	adc	r15, rsi
	add	rbp, rax
	adc	r15, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	rbp, r13
	adc	r15, 0
	shld	r15, rbp, 12
	shl	rbp, 4
	movabs	rdx, 72057594037927920
	and	rdx, rbp
	or	rdx, r10
	movabs	rax, 4294968273
	mulx	r14, rax, rax
	add	rax, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	shld	r14, rax, 12
	mov	rdx, rcx
	mulx	rcx, rdx, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	r10, rbp, qword ptr [rsp - 48]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r8, r9, qword ptr [rsp - 56]    # 8-byte Folded Reload
	mov	rdx, r11
	mulx	rcx, rsi, qword ptr [rsp - 32]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r13, r11, rbx
	mov	dl, 52
	bzhi	rax, rax, rdx
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	add	r11, rsi
	adc	r13, rcx
	add	r11, r9
	adc	r13, r8
	add	r11, r15
	adc	r13, 0
	bzhi	rdx, r11, rdx
	add	rbp, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 88]       # 8-byte Folded Reload
	movabs	rax, 68719492368
	mulx	rax, rcx, rax
	add	rbp, rcx
	adc	r10, rax
	add	rbp, r14
	adc	r10, 0
	shld	r13, r11, 12
	shld	r10, rbp, 12
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 80], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r15, rcx, qword ptr [rsp - 48]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	r8, r9, qword ptr [rsp - 56]    # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	r11, r14, qword ptr [rsp - 32]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rax, rsi, rbx
	mov	dl, 52
	bzhi	rbp, rbp, rdx
	add	rsi, r14
	adc	rax, r11
	add	rsi, r13
	adc	rax, 0
	bzhi	rdx, rsi, rdx
	add	r9, rcx
	adc	r8, r15
	add	r9, qword ptr [rsp - 80]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 104]       # 8-byte Folded Reload
	movabs	r11, 68719492368
	mulx	rcx, rdx, r11
	add	r9, rdx
	adc	r8, rcx
	add	r9, r10
	adc	r8, 0
	shld	rax, rsi, 12
	shld	r8, r9, 12
	mov	sil, 52
	bzhi	rcx, r9, rsi
	mov	rdx, rax
	mulx	rdx, rax, r11
	bzhi	rsi, qword ptr [rsp - 72], rsi  # 8-byte Folded Reload
	mov	r9b, 52
	add	rsi, rax
	adc	rdx, 0
	mov	rax, rdi
	add	rsi, r8
	adc	rdx, 0
	bzhi	rdi, rsi, r9
	shld	rdx, rsi, 12
	mov	sil, 48
	bzhi	rsi, r12, rsi
	add	rsi, rdx
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mov	qword ptr [rax], rdx
	mov	qword ptr [rax + 8], rbp
	mov	qword ptr [rax + 16], rcx
	mov	qword ptr [rax + 24], rdi
	mov	qword ptr [rax + 32], rsi
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
	.size	mul_inner, .Lfunc_end0-mul_inner
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

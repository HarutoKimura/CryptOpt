	.text
	.intel_syntax noprefix
	.file	"rust_fiat_secp256k1_dettman_mul.b4d26cdb596d8137-cgu.0"
	.globl	rust_fiat_secp256k1_dettman_mul_vec # -- Begin function rust_fiat_secp256k1_dettman_mul
	.p2align	4, 0x90
	.type	rust_fiat_secp256k1_dettman_mul_vec,@function
rust_fiat_secp256k1_dettman_mul_vec:        # @rust_fiat_secp256k1_dettman_mul
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
	mov	r8, rdx
	mov	rax, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rdx, qword ptr [rdx + 32]
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mulx	rcx, r13, rax
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mov	rdx, qword ptr [r8 + 24]
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rbx, qword ptr [rsi]
	mov	rcx, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mulx	r15, rax, rbx
	mov	qword ptr [rsp], rbx            # 8-byte Spill
	mov	rdx, qword ptr [r8 + 16]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mulx	rcx, rbp, rcx
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	r14, qword ptr [rsi + 16]
	mov	rdx, qword ptr [r8 + 8]
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mulx	rdx, r10, r14
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 64], r14       # 8-byte Spill
	mov	r12, qword ptr [r8]
	mov	r9, qword ptr [rsi + 24]
	mov	rdx, r12
	mov	qword ptr [rsp - 8], r12        # 8-byte Spill
	mulx	r8, r11, r9
	mov	qword ptr [rsp - 80], r9        # 8-byte Spill
	movabs	rcx, 68719492368
	mov	rdx, r13
	mulx	rsi, rcx, rcx
	add	rcx, rax
	adc	rsi, r15
	add	rcx, rbp
	adc	rsi, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rcx, r10
	adc	rsi, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rcx, r11
	adc	rsi, r8
	mov	rdx, rbx
	mulx	rax, r8, qword ptr [rsp - 104]  # 8-byte Folded Reload
	mov	r11, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rdx, r11
	mov	rbp, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	rbx, r10, rbp
	mov	rdx, r14
	mulx	rdx, r14, qword ptr [rsp - 96]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 40], r14       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, r9
	mov	r9, qword ptr [rsp - 56]        # 8-byte Reload
	mulx	rdx, r14, r9
	mov	qword ptr [rsp - 32], r14       # 8-byte Spill
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rdx, r12
	mov	r12, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rdx, r14, r12
	mov	qword ptr [rsp - 16], r14       # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	shld	rsi, rcx, 12
	movabs	r14, 281475040739328
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r15, r13, r14
	mov	dl, 52
	bzhi	rcx, rcx, rdx
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	add	r13, r8
	adc	r15, rax
	add	r13, r10
	adc	r15, rbx
	add	r13, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r13, rsi
	adc	r15, 0
	shld	r15, r13, 12
	mov	rdx, r11
	mov	r11, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rsi, r8, r11
	mov	r10, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rdx, r10
	mulx	rax, rcx, rbp
	add	rcx, r8
	adc	rax, rsi
	mov	rbx, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rdx, rbx
	mov	r14, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rsi, r8, r14
	mov	rdx, r9
	mulx	rdx, r9, r12
	add	rcx, r9
	adc	rax, rdx
	add	rcx, r8
	adc	rax, rsi
	add	rcx, r15
	adc	rax, 0
	shld	rax, rcx, 12
	shl	rcx, 4
	movabs	rsi, 72057594037927920
	and	rsi, rcx
	mov	cl, 48
	bzhi	rcx, r13, rcx
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	shr	r13, 48
	mov	rbp, qword ptr [rsp - 8]        # 8-byte Reload
	mov	rdx, rbp
	mov	r15, qword ptr [rsp]            # 8-byte Reload
	mulx	rcx, r8, r15
	and	r13d, 15
	or	rsi, r13
	movabs	r9, 4294968273
	mov	rdx, rsi
	mulx	rsi, r9, r9
	add	r9, r8
	adc	rsi, rcx
	shld	rsi, r9, 12
	mov	rdx, r10
	mulx	r8, r10, r11
	mov	rdx, rbx
	mulx	r11, rbx, qword ptr [rsp - 88]  # 8-byte Folded Reload
	mov	rdx, r14
	mulx	rcx, r14, r12
	mov	dl, 52
	bzhi	rdx, r9, rdx
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	add	r14, r10
	adc	rcx, r8
	add	r14, rbx
	adc	rcx, r11
	add	r14, rax
	adc	rcx, 0
	shld	rcx, r14, 12
	mov	r13, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rdx, r13
	mulx	rax, r8, r15
	mov	r12, r15
	mov	rdx, rbp
	mov	rbx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r10, r9, rbx
	add	r9, r8
	adc	r10, rax
	mov	al, 52
	bzhi	rdx, r14, rax
	movabs	r14, 68719492368
	mulx	r15, rax, r14
	add	rax, r9
	adc	r15, r10
	add	rax, rsi
	adc	r15, 0
	shld	r15, rax, 12
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r8, r9, qword ptr [rsp - 104]   # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	mulx	r11, rsi, qword ptr [rsp - 72]  # 8-byte Folded Reload
	mov	dl, 52
	bzhi	rax, rax, rdx
	add	rsi, r9
	adc	r11, r8
	add	rsi, rcx
	adc	r11, 0
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	r8, r9, r12
	mov	rdx, r13
	mulx	rcx, r10, rbx
	add	r10, r9
	adc	rcx, r8
	mov	rdx, rbp
	mulx	rdx, r8, qword ptr [rsp - 64]   # 8-byte Folded Reload
	add	r10, r8
	adc	rcx, rdx
	mov	rdx, rsi
	mulx	rdx, rsi, r14
	add	r10, rsi
	adc	rcx, rdx
	add	r10, r15
	adc	rcx, 0
	shld	rcx, r10, 12
	add	rcx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r9b, 52
	bzhi	rsi, r10, r9
	mov	rdx, r11
	movabs	r8, 281475040739328
	mulx	r8, rdx, r8
	add	rdx, rcx
	adc	r8, 0
	shld	r8, rdx, 12
	add	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	bzhi	rcx, rdx, r9
	mov	rdx, qword ptr [rsp - 128]      # 8-byte Reload
	mov	qword ptr [rdi], rdx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], rsi
	mov	qword ptr [rdi + 24], rcx
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
	.size	rust_fiat_secp256k1_dettman_mul, .Lfunc_end0-rust_fiat_secp256k1_dettman_mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

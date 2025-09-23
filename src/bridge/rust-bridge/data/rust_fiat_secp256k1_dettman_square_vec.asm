	.text
	.intel_syntax noprefix
	.file	"rust_fiat_secp256k1_dettman_square.fa9f04e4069e5e9f-cgu.0"
	.globl	rust_fiat_secp256k1_dettman_square_vec # -- Begin function rust_fiat_secp256k1_dettman_square
	.p2align	4, 0x90
	.type	rust_fiat_secp256k1_dettman_square_vec,@function
rust_fiat_secp256k1_dettman_square_vec:     # @rust_fiat_secp256k1_dettman_square
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
	mov	r8, qword ptr [rsi + 24]
	mov	rax, qword ptr [rsi + 16]
	mov	r10, qword ptr [rsi]
	mov	rcx, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	lea	rbx, [rcx + rcx]
	lea	r11, [r10 + r10]
	mov	r9, qword ptr [rsi + 32]
	mov	rdx, r9
	mulx	rdx, rsi, r9
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	mov	rdx, r11
	mov	qword ptr [rsp - 16], r11       # 8-byte Spill
	mulx	r15, r12, r8
	mov	rdx, rbx
	mulx	rbp, r13, rax
	add	r13, r12
	adc	rbp, r15
	movabs	rcx, 68719492368
	mov	rdx, rsi
	mulx	rsi, rdx, rcx
	add	rdx, r13
	adc	rsi, rbp
	shld	rsi, rdx, 12
	movabs	r15, 4503599627370495
	dec	r15
	and	r15, rdx
	mov	rdx, r11
	mulx	r13, rbp, r9
	mov	rdx, rbx
	mulx	r12, rcx, r8
	mov	rdx, rax
	mulx	r11, r14, rax
	add	r14, rcx
	adc	r11, r12
	add	r14, rbp
	adc	r11, r13
	movabs	rcx, 281475040739328
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	rcx, r13, rcx
	add	r13, r14
	adc	rcx, r11
	lea	r11, [rax + rax]
	add	r13, rsi
	adc	rcx, 0
	shld	rcx, r13, 12
	mov	rdx, r9
	mulx	rsi, rbx, rbx
	mov	rdx, r11
	mulx	rbp, rdx, r8
	add	rdx, rbx
	adc	rbp, rsi
	add	rdx, rcx
	adc	rbp, 0
	shld	rbp, rdx, 12
	shl	rdx, 4
	movabs	rsi, 72057594037927920
	and	rsi, rdx
	mov	rcx, r13
	shr	rcx, 48
	mov	rdx, r10
	mulx	rbx, r14, r10
	and	ecx, 15
	or	rsi, rcx
	movabs	rcx, 4294968273
	mov	rdx, rsi
	mulx	rsi, rcx, rcx
	mov	dl, 48
	bzhi	rdx, r13, rdx
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	add	rcx, r14
	adc	rsi, rbx
	shld	rsi, rcx, 12
	mov	rdx, r9
	mulx	r14, r12, r11
	mov	rdx, r8
	mulx	r13, rbx, r8
	mov	r11b, 52
	bzhi	rcx, rcx, r11
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	add	rbx, r12
	adc	r13, r14
	add	rbx, rbp
	adc	r13, 0
	mov	r10, qword ptr [rsp - 16]       # 8-byte Reload
	mov	rdx, r10
	mov	rcx, qword ptr [rsp - 8]        # 8-byte Reload
	mulx	r14, r12, rcx
	shld	r13, rbx, 12
	bzhi	rdx, rbx, r11
	movabs	rbx, 68719492368
	mulx	rbp, rbx, rbx
	add	rbx, r12
	adc	rbp, r14
	add	rbx, rsi
	lea	rsi, [r8 + r8]
	adc	rbp, 0
	shld	rbp, rbx, 12
	mov	rdx, r9
	mulx	r8, rsi, rsi
	bzhi	r9, rbx, r11
	add	rsi, r13
	adc	r8, 0
	mov	rdx, r10
	mulx	rax, rbx, rax
	mov	rdx, rcx
	mulx	r12, r14, rcx
	add	r14, rbx
	adc	r12, rax
	mov	rdx, rsi
	movabs	rax, 68719492368
	mulx	rsi, rax, rax
	add	rax, r14
	adc	rsi, r12
	add	rax, rbp
	mov	rdx, r8
	movabs	rcx, 281475040739328
	mulx	r8, rdx, rcx
	adc	rsi, 0
	shld	rsi, rax, 12
	add	rsi, r15
	bzhi	rax, rax, r11
	add	rdx, rsi
	adc	r8, 0
	shld	r8, rdx, 12
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	bzhi	rdx, rdx, r11
	mov	rcx, qword ptr [rsp - 24]       # 8-byte Reload
	mov	qword ptr [rdi], rcx
	mov	qword ptr [rdi + 8], r9
	mov	qword ptr [rdi + 16], rax
	mov	qword ptr [rdi + 24], rdx
	mov	qword ptr [rdi + 32], r8
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
	.size	rust_fiat_secp256k1_dettman_square, .Lfunc_end0-rust_fiat_secp256k1_dettman_square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

	.text
	.intel_syntax noprefix
	.file	"rust_ec_secp256k1_square.2c12f92f8d7bb4cc-cgu.0"
	.globl	rust_ec_secp256k1_square_vec        # -- Begin function rust_ec_secp25k61_square
	.p2align	4, 0x90
	.type	rust_ec_secp25k61_square_vec,@function
rust_ec_secp256k1_square_vec:               # @rust_ec_secp25k61_square
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
	mov	r8, qword ptr [rsi + 8]
	mov	rcx, qword ptr [rsi + 16]
	mov	rdx, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rax, qword ptr [rsi + 32]
	mulx	r10, r15, r9
	mov	rdx, rcx
	mulx	r14, rbx, r8
	mov	r11, r8
	mov	rdx, rax
	mulx	rsi, r12, rax
	mov	r8, rax
	movabs	rdx, 4503599627370493
	and	rdx, r12
	movabs	rax, 68719492368
	mulx	rdx, r13, rax
	add	rbx, r15
	adc	r14, r10
	shld	r14, rbx, 1
	add	rbx, rbx
	add	rbx, r13
	adc	r14, rdx
	shld	rsi, r12, 12
	shld	r14, rbx, 12
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rcx, r13, rcx
	mov	rdx, rsi
	mulx	r10, r15, rax
	mov	rax, r8
	mov	rdx, r8
	mulx	rsi, rbp, r9
	mov	r12, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rdx, r12
	mulx	rdx, r8, r11
	mov	qword ptr [rsp - 16], r11       # 8-byte Spill
	add	r8, rbp
	adc	rdx, rsi
	shld	rdx, r8, 1
	add	r8, r8
	add	r15, r13
	adc	r10, rcx
	add	r15, r14
	adc	r10, 0
	add	r15, r8
	adc	r10, rdx
	shld	r10, r15, 12
	mov	r14, r15
	shr	r14, 48
	and	r14d, 15
	mov	rdx, r9
	mulx	rcx, r8, r9
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	rdx, rax
	mov	rcx, rax
	mulx	r13, rbp, r11
	mov	rax, r12
	mov	rdx, r12
	mov	r11, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	rsi, r12, r11
	add	r12, rbp
	adc	rsi, r13
	shld	rsi, r12, 1
	add	r12, r12
	add	r12, r10
	adc	rsi, 0
	shld	rsi, r12, 12
	shl	r12, 4
	movabs	rdx, 72057594037927920
	and	rdx, r12
	or	rdx, r14
	movabs	r10, 4294968273
	mulx	rbp, r10, r10
	add	r10, r8
	adc	rbp, qword ptr [rsp - 48]       # 8-byte Folded Reload
	shld	rbp, r10, 12
	mov	rdx, rax
	mulx	r8, r12, rax
	mov	rdx, r11
	mulx	r14, r13, rcx
	mov	al, 52
	bzhi	rax, r10, rax
	mov	dl, 52
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	shld	r14, r13, 1
	add	r13, r13
	add	r13, r12
	adc	r14, r8
	add	r13, rsi
	adc	r14, 0
	bzhi	rdx, r13, rdx
	movabs	rax, 68719492368
	mulx	rsi, r8, rax
	lea	rdx, [r9 + r9]
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	shr	r9, 63
	mov	rax, r9
	mov	r11, qword ptr [rsp - 16]       # 8-byte Reload
	imul	rax, r11
	mulx	r12, r10, r11
	mov	rdx, r11
	add	r12, rax
	add	r10, r8
	adc	r12, rsi
	add	r10, rbp
	adc	r12, 0
	shld	r14, r13, 12
	shld	r12, r10, 12
	mov	r13b, 52
	bzhi	rax, r10, r13
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mulx	rax, r11, rdx
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	rsi, r8, rcx
	shld	rsi, r8, 1
	add	r8, r8
	add	r8, r14
	adc	rsi, 0
	bzhi	rdx, r8, r13
	movabs	rbp, 68719492368
	mulx	r14, r13, rbp
	mov	rcx, qword ptr [rsp - 32]       # 8-byte Reload
	imul	r9, rcx
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rcx, r10, rcx
	add	rcx, r9
	add	r10, r11
	adc	rcx, rax
	add	r10, r13
	adc	rcx, r14
	add	r10, r12
	adc	rcx, 0
	shld	rsi, r8, 12
	mov	rdx, rsi
	mulx	rdx, rax, rbp
	movabs	rsi, 4503599627370494
	and	rsi, rbx
	shld	rcx, r10, 12
	mov	r9b, 52
	bzhi	r8, r10, r9
	add	rsi, rax
	adc	rdx, 0
	mov	rax, rdi
	add	rsi, rcx
	adc	rdx, 0
	bzhi	rcx, rsi, r9
	shld	rdx, rsi, 12
	mov	sil, 48
	bzhi	rsi, r15, rsi
	add	rsi, rdx
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mov	qword ptr [rdi], rdx
	mov	rdx, qword ptr [rsp - 8]        # 8-byte Reload
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], rcx
	mov	qword ptr [rdi + 32], rsi
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
	.size	rust_ec_secp25k61_square, .Lfunc_end0-rust_ec_secp25k61_square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

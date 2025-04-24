	.text
	.intel_syntax noprefix
	.file	"rust_fiat_secp256k1_dettman_square.fa9f04e4069e5e9f-cgu.0"
	.globl	rust_fiat_secp256k1_dettman_square # -- Begin function rust_fiat_secp256k1_dettman_square
	.p2align	4, 0x90
	.type	rust_fiat_secp256k1_dettman_square,@function
rust_fiat_secp256k1_dettman_square:     # @rust_fiat_secp256k1_dettman_square
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
	mov	r10, qword ptr [rsi + 24]
	mov	r13, qword ptr [rsi + 16]
	mov	r11, qword ptr [rsi]
	mov	rax, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	lea	rbx, [rax + rax]
	mov	rcx, qword ptr [rsi + 32]
	mov	rax, rcx
	mul	rcx
	mov	r8, rcx
	mov	rsi, rax
	mov	r14, rdx
	lea	r9, [r11 + r11]
	mov	rax, r9
	mov	qword ptr [rsp - 24], r9        # 8-byte Spill
	mul	r10
	mov	r15, rdx
	mov	r12, rax
	mov	rax, rbx
	mul	r13
	mov	rbp, rdx
	mov	rcx, rax
	add	rcx, r12
	adc	rbp, r15
	movabs	rdx, 68719492368
	mov	rax, rsi
	mul	rdx
	mov	r15, rdx
	mov	rsi, rax
	add	rsi, rcx
	adc	r15, rbp
	shld	r15, rsi, 12
	mov	rax, r9
	mul	r8
	mov	r9, r8
	mov	rcx, rdx
	mov	rbp, rax
	mov	rax, rbx
	mul	r10
	mov	r8, rax
	mov	r12, rdx
	movabs	rax, 4503599627370495
	lea	rdx, [rax - 1]
	and	rdx, rsi
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rax, r13
	mul	r13
	mov	qword ptr [rsp - 32], r13       # 8-byte Spill
	mov	rsi, rax
	add	rsi, r8
	adc	r12, rdx
	add	rsi, rbp
	adc	r12, rcx
	movabs	rcx, 281475040739328
	mov	rax, r14
	mul	rcx
	mov	r14, rax
	add	r14, rsi
	adc	r12, rdx
	add	r14, r15
	adc	r12, 0
	shld	r12, r14, 12
	mov	qword ptr [rsp - 48], r9        # 8-byte Spill
	mov	rax, r9
	mul	rbx
	mov	rcx, rax
	mov	rbx, rdx
	lea	r15, [2*r13]
	mov	rax, r15
	mul	r10
	add	rax, rcx
	adc	rbx, rdx
	add	rax, r12
	adc	rbx, 0
	shld	rbx, rax, 12
	shl	rax, 4
	movabs	rcx, 72057594037927920
	and	rcx, rax
	mov	r12, r14
	shr	r12, 48
	and	r12d, 15
	mov	rax, r11
	mul	r11
	mov	rsi, rax
	mov	r8, rdx
	or	rcx, r12
	movabs	rdx, 4294968273
	mov	rax, rcx
	mul	rdx
	mov	r11, rax
	mov	r12, rdx
	movabs	rax, 281474976710655
	and	rax, r14
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	add	r11, rsi
	adc	r12, r8
	shld	r12, r11, 12
	mov	rax, r9
	mul	r15
	mov	rcx, rax
	mov	r14, rdx
	movabs	rbp, 4503599627370495
	and	r11, rbp
	mov	r9, r10
	mov	rax, r10
	mul	r10
	mov	rsi, rax
	add	rsi, rcx
	adc	r14, rdx
	add	rsi, rbx
	adc	r14, 0
	shld	r14, rsi, 12
	mov	r10, qword ptr [rsp - 24]       # 8-byte Reload
	mov	rax, r10
	mov	r13, qword ptr [rsp - 16]       # 8-byte Reload
	mul	r13
	mov	rcx, rax
	mov	r8, rdx
	and	rsi, rbp
	mov	rax, rsi
	movabs	rdx, 68719492368
	mul	rdx
	mov	r15, rdx
	mov	rbx, rax
	add	rbx, rcx
	adc	r15, r8
	add	rbx, r12
	adc	r15, 0
	lea	rcx, [r9 + r9]
	shld	r15, rbx, 12
	and	rbx, rbp
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mul	rcx
	mov	r9, rdx
	mov	rcx, rax
	add	rcx, r14
	adc	r9, 0
	mov	rax, r10
	mul	qword ptr [rsp - 32]            # 8-byte Folded Reload
	mov	rsi, rdx
	mov	r8, rax
	mov	rax, r13
	mul	r13
	mov	r10, rdx
	mov	r14, rax
	add	r14, r8
	adc	r10, rsi
	mov	rax, rcx
	movabs	rcx, 68719492368
	mul	rcx
	mov	rsi, rdx
	mov	rcx, rax
	add	rcx, r14
	adc	rsi, r10
	add	rcx, r15
	adc	rsi, 0
	shld	rsi, rcx, 12
	add	rsi, qword ptr [rsp - 8]        # 8-byte Folded Reload
	mov	rax, r9
	movabs	rdx, 281475040739328
	mul	rdx
	and	rcx, rbp
	add	rax, rsi
	adc	rdx, 0
	shld	rdx, rax, 12
	add	rdx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	and	rax, rbp
	mov	qword ptr [rdi], r11
	mov	qword ptr [rdi + 8], rbx
	mov	qword ptr [rdi + 16], rcx
	mov	qword ptr [rdi + 24], rax
	mov	qword ptr [rdi + 32], rdx
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

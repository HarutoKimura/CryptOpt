	.text
	.intel_syntax noprefix
	.file	"rust_ec_secp256k1_square.2c12f92f8d7bb4cc-cgu.0"
	.globl	rust_ec_secp256k1_square        # -- Begin function rust_ec_secp256k1_square
	.p2align	4, 0x90
	.type	rust_ec_secp256k1_square,@function
rust_ec_secp256k1_square:               # @rust_ec_secp256k1_square
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
	mov	rcx, qword ptr [rsi]
	mov	rbp, qword ptr [rsi + 8]
	mov	rbx, qword ptr [rsi + 16]
	mov	rax, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	r8, qword ptr [rsi + 32]
	mul	rcx
	mov	r10, rdx
	mov	r15, rax
	mov	rax, rbx
	mul	rbp
	mov	r14, rdx
	mov	rsi, rax
	mov	rax, r8
	mul	r8
	mov	r12, r8
	mov	r11, rax
	mov	r9, rdx
	movabs	rax, 4503599627370493
	and	rax, r11
	movabs	r8, 68719492368
	mul	r8
	add	rsi, r15
	adc	r14, r10
	shld	r14, rsi, 1
	add	rsi, rsi
	add	rsi, rax
	mov	qword ptr [rsp - 8], rsi        # 8-byte Spill
	adc	r14, rdx
	shld	r9, r11, 12
	shld	r14, rsi, 12
	mov	qword ptr [rsp - 40], rbx       # 8-byte Spill
	mov	rax, rbx
	mul	rbx
	mov	rsi, rdx
	mov	r11, rax
	mov	rax, r9
	mul	r8
	mov	r15, rdx
	mov	r9, rax
	mov	rbx, r12
	mov	rax, r12
	mul	rcx
	mov	r12, rdx
	mov	r13, rax
	mov	r10, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rax, r10
	mov	qword ptr [rsp - 56], rbp       # 8-byte Spill
	mul	rbp
	add	rax, r13
	adc	r12, rdx
	shld	r12, rax, 1
	add	rax, rax
	add	r9, r11
	adc	r15, rsi
	add	r9, r14
	adc	r15, 0
	add	r9, rax
	adc	r15, r12
	shld	r15, r9, 12
	mov	rsi, r9
	shr	rsi, 48
	mov	rax, rcx
	mul	rcx
	mov	r8, rdx
	mov	r12, rax
	mov	rax, rbx
	mov	r11, rbx
	mov	qword ptr [rsp - 16], rbx       # 8-byte Spill
	mul	rbp
	mov	r13, rdx
	mov	r14, rax
	mov	rax, r10
	mov	rbx, qword ptr [rsp - 40]       # 8-byte Reload
	mul	rbx
	and	esi, 15
	add	rax, r14
	adc	r13, rdx
	shld	r13, rax, 1
	add	rax, rax
	add	rax, r15
	adc	r13, 0
	shld	r13, rax, 12
	shl	rax, 4
	movabs	rdx, 72057594037927920
	and	rax, rdx
	or	rax, rsi
	movabs	rdx, 4294968273
	mul	rdx
	mov	rbp, rdx
	mov	r14, rax
	add	r14, r12
	adc	rbp, r8
	movabs	rsi, 4503599627370495
	shld	rbp, r14, 12
	and	r14, rsi
	mov	rax, r10
	mul	r10
	mov	r12, rdx
	mov	r10, rax
	mov	rax, rbx
	mul	r11
	mov	r11, rax
	shld	rdx, rax, 1
	add	r11, rax
	add	r11, r10
	adc	r12, rdx
	add	r11, r13
	adc	r12, 0
	mov	rax, r11
	and	rax, rsi
	movabs	rdx, 68719492368
	mul	rdx
	mov	r8, rax
	mov	rbx, rdx
	lea	rax, [rcx + rcx]
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	shr	rcx, 63
	mov	r10, qword ptr [rsp - 56]       # 8-byte Reload
	mul	r10
	mov	r15, rax
	mov	r13, rdx
	mov	rax, rcx
	imul	rax, r10
	add	r13, rax
	add	r15, r8
	adc	r13, rbx
	add	r15, rbp
	adc	r13, 0
	shld	r12, r11, 12
	shld	r13, r15, 12
	and	r15, rsi
	mov	rax, r10
	mul	r10
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mul	qword ptr [rsp - 16]            # 8-byte Folded Reload
	mov	r11, rdx
	mov	rbx, rax
	shld	r11, rax, 1
	add	rbx, rax
	add	rbx, r12
	adc	r11, 0
	mov	rax, rbx
	and	rax, rsi
	movabs	rdx, 68719492368
	mul	rdx
	mov	r12, rax
	mov	rbp, rdx
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	imul	rcx, rdx
	mov	rax, qword ptr [rsp - 24]       # 8-byte Reload
	mul	rdx
	mov	r8, rax
	mov	r10, rdx
	add	r10, rcx
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 56]       # 8-byte Folded Reload
	add	r8, r12
	adc	r10, rbp
	add	r8, r13
	adc	r10, 0
	shld	r11, rbx, 12
	movabs	rcx, 4503599627370494
	and	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	shld	r10, r8, 12
	and	r8, rsi
	mov	rax, r11
	movabs	rdx, 68719492368
	mul	rdx
	add	rcx, rax
	adc	rdx, 0
	mov	rax, rdi
	add	rcx, r10
	adc	rdx, 0
	and	rsi, rcx
	shld	rdx, rcx, 12
	movabs	rcx, 281474976710655
	and	rcx, r9
	add	rcx, rdx
	mov	qword ptr [rdi], r14
	mov	qword ptr [rdi + 8], r15
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], rsi
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
	.size	rust_ec_secp25k61_square, .Lfunc_end0-rust_ec_secp25k61_square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

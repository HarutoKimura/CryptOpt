	.text
	.intel_syntax noprefix
	.file	"open_ssl_curve25519_fe51_square.c"
	.globl	open_ssl_curve25519_fe51_square # -- Begin function open_ssl_curve25519_fe51_square
	.p2align	4, 0x90
	.type	open_ssl_curve25519_fe51_square,@function
open_ssl_curve25519_fe51_square:        # @open_ssl_curve25519_fe51_square
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
	mov	rcx, qword ptr [rsi]
	mov	r8, qword ptr [rsi + 8]
	mov	rax, qword ptr [rsi + 16]
	mov	r9, qword ptr [rsi + 24]
	mov	rsi, qword ptr [rsi + 32]
	mov	rdx, rcx
	mulx	rdx, r10, rcx
	mov	qword ptr [rsp - 80], r10       # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	add	rcx, rcx
	mov	rdx, rcx
	mulx	r11, r13, r8
	mov	rdx, rax
	mulx	r10, rbx, rcx
	mov	rdx, r9
	mulx	rdx, r14, rcx
	mov	qword ptr [rsp - 56], r14       # 8-byte Spill
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rdx, rsi
	mulx	rcx, rdx, rcx
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	lea	rcx, [rsi + 8*rsi]
	lea	rcx, [rsi + 2*rcx]
	mov	rdx, rcx
	mulx	rdx, rsi, rsi
	mov	qword ptr [rsp - 64], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	r15, rbp, r8
	add	rbp, rbx
	adc	r15, r10
	add	r8, r8
	mov	rdx, r8
	mulx	r14, r10, rax
	mov	rdx, r9
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp - 32], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp - 96], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	lea	rdx, [r9 + 8*r9]
	lea	rsi, [r9 + 2*rdx]
	mov	rdx, rsi
	mulx	rbx, r12, r9
	add	r12, r13
	adc	rbx, r11
	add	r9, r9
	mov	rdx, rcx
	mulx	r11, r13, r9
	add	r13, rbp
	adc	r11, r15
	mov	rdx, rax
	mulx	r9, r8, rax
	add	rax, rax
	mov	rdx, rsi
	mulx	rsi, rbp, rax
	add	rbp, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	rbp, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	rdx, rcx
	mulx	rax, rdx, rax
	add	rdx, r12
	adc	rax, rbx
	shld	r11, r13, 13
	add	r10, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r10, r11
	adc	r14, 0
	mov	cl, 51
	bzhi	r11, r13, rcx
	shld	rsi, rbp, 13
	add	rsi, rdx
	adc	rax, 0
	shld	r14, r10, 13
	bzhi	rdx, rbp, rcx
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 24]        # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 8]         # 8-byte Folded Reload
	add	r8, r14
	adc	r9, 0
	shld	rax, rsi, 13
	add	rax, r11
	shld	r9, r8, 13
	lea	r11, [r9 + 8*r9]
	lea	r9, [r9 + 2*r11]
	bzhi	r10, r10, rcx
	add	r9, rdx
	bzhi	rdx, rax, rcx
	shr	rax, 51
	add	rax, r10
	bzhi	rsi, rsi, rcx
	bzhi	r8, r8, rcx
	bzhi	rcx, r9, rcx
	shr	r9, 51
	add	r9, rsi
	mov	qword ptr [rdi], rcx
	mov	qword ptr [rdi + 8], r9
	mov	qword ptr [rdi + 16], rdx
	mov	qword ptr [rdi + 24], rax
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
	.size	open_ssl_curve25519_fe51_square, .Lfunc_end0-open_ssl_curve25519_fe51_square
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

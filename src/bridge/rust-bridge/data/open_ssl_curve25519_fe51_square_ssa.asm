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
	mov	r15, qword ptr [rsi + 8]
	mov	r9, qword ptr [rsi + 16]
	mov	rax, rcx
	mul	rcx
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	r10, qword ptr [rsi + 24]
	add	rcx, rcx
	mov	rax, rcx
	mul	r15
	mov	rbp, rdx
	mov	r12, rax
	mov	rax, r9
	mul	rcx
	mov	r8, rax
	mov	r11, rdx
	mov	rsi, qword ptr [rsi + 32]
	mov	rax, r10
	mul	rcx
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, rsi
	mul	rcx
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	lea	rax, [rsi + 8*rsi]
	lea	rcx, [rsi + 2*rax]
	mov	rax, rcx
	mul	rsi
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rax, r15
	mul	r15
	mov	r13, rdx
	mov	rbx, rax
	add	rbx, r8
	adc	r13, r11
	add	r15, r15
	mov	rax, r15
	mul	r9
	mov	r14, rdx
	mov	r8, rax
	mov	rax, r10
	mul	r15
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rax, rcx
	mul	r15
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	lea	rax, [r10 + 8*r10]
	lea	rax, [r10 + 2*rax]
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mul	r10
	mov	r11, rdx
	mov	rsi, rax
	add	rsi, r12
	adc	r11, rbp
	add	r10, r10
	mov	rax, rcx
	mul	r10
	mov	rbp, rdx
	mov	r10, rax
	add	r10, rbx
	adc	rbp, r13
	mov	rax, r9
	mul	r9
	mov	r12, rax
	mov	r15, rdx
	add	r9, r9
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	r9
	mov	rbx, rdx
	mov	r13, rax
	add	r13, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	rax, rcx
	mul	r9
	add	rax, rsi
	adc	rdx, r11
	shld	rbp, r10, 13
	add	r8, qword ptr [rsp - 48]        # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 56]       # 8-byte Folded Reload
	add	r8, rbp
	adc	r14, 0
	movabs	rcx, 2251799813685247
	and	r10, rcx
	shld	rbx, r13, 13
	add	rbx, rax
	adc	rdx, 0
	shld	r14, r8, 13
	and	r13, rcx
	add	r12, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r12, r14
	adc	r15, 0
	shld	rdx, rbx, 13
	shld	r15, r12, 13
	add	rdx, r10
	lea	rax, [r15 + 8*r15]
	lea	rax, [r15 + 2*rax]
	and	r8, rcx
	and	rbx, rcx
	add	rax, r13
	mov	rsi, rdx
	shr	rsi, 51
	add	rsi, r8
	mov	r8, rax
	shr	r8, 51
	add	r8, rbx
	and	r12, rcx
	and	rdx, rcx
	and	rax, rcx
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], r8
	mov	qword ptr [rdi + 16], rdx
	mov	qword ptr [rdi + 24], rsi
	mov	qword ptr [rdi + 32], r12
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

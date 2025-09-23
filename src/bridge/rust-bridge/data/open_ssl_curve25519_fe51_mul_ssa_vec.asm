	.text
	.intel_syntax noprefix
	.file	"open_ssl_curve25519_fe51_mul.c"
	.globl	open_ssl_curve25519_fe51_mul    # -- Begin function open_ssl_curve25519_fe51_mul
	.p2align	4, 0x90
	.type	open_ssl_curve25519_fe51_mul,@function
open_ssl_curve25519_fe51_mul:           # @open_ssl_curve25519_fe51_mul
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
	mov	r10, rdx
	mov	r12, qword ptr [rdx]
	mov	r8, qword ptr [rdx + 8]
	mov	rax, qword ptr [rsi]
	mov	r11, rsi
	mov	qword ptr [rsp - 40], rsi       # 8-byte Spill
	mov	rdx, r12
	mov	qword ptr [rsp - 48], r12       # 8-byte Spill
	mulx	rcx, rbx, rax
	mov	rdx, r8
	mov	qword ptr [rsp - 32], r8        # 8-byte Spill
	mulx	r14, r15, rax
	mov	rdx, qword ptr [r10 + 16]
	mov	r13, rdx
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mulx	rdx, rsi, rax
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	r9, qword ptr [r10 + 24]
	mov	rdx, r9
	mulx	rdx, rbp, rax
	mov	qword ptr [rsp - 8], rbp        # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rdx, qword ptr [r10 + 32]
	lea	r10, [rdx + 8*rdx]
	lea	r10, [rdx + 2*r10]
	mov	qword ptr [rsp - 56], r10       # 8-byte Spill
	mulx	rax, rdx, rax
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rdx, qword ptr [r11 + 8]
	mulx	r11, rbp, r10
	add	rbp, rbx
	adc	r11, rcx
	mulx	rbx, r10, r12
	add	r10, r15
	adc	rbx, r14
	mulx	r14, rax, r8
	add	rax, rsi
	adc	r14, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mulx	r15, rcx, r13
	add	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	mulx	r12, rsi, r9
	add	rsi, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 80]       # 8-byte Folded Reload
	lea	rdx, [r9 + 8*r9]
	lea	r9, [r9 + 2*rdx]
	mov	qword ptr [rsp - 72], r9        # 8-byte Spill
	mov	r8, qword ptr [rsp - 40]        # 8-byte Reload
	mov	rdx, qword ptr [r8 + 16]
	mulx	r13, r9, r9
	add	r9, rbp
	adc	r13, r11
	mulx	r11, rbp, qword ptr [rsp - 56]  # 8-byte Folded Reload
	add	rbp, r10
	adc	r11, rbx
	mulx	rbx, r10, qword ptr [rsp - 48]  # 8-byte Folded Reload
	add	r10, rax
	adc	rbx, r14
	mov	qword ptr [rsp - 80], rbx       # 8-byte Spill
	mulx	r14, rax, qword ptr [rsp - 32]  # 8-byte Folded Reload
	add	rax, rcx
	adc	r14, r15
	mov	rbx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r15, rcx, rbx
	add	rcx, rsi
	adc	r15, r12
	lea	rdx, [rbx + 8*rbx]
	lea	rsi, [rbx + 2*rdx]
	mov	qword ptr [rsp - 64], rsi       # 8-byte Spill
	mov	rdx, qword ptr [r8 + 24]
	mulx	r12, r8, rsi
	add	r8, r9
	adc	r12, r13
	mulx	r13, r9, qword ptr [rsp - 72]   # 8-byte Folded Reload
	add	r9, rbp
	adc	r13, r11
	mulx	rbp, rbx, qword ptr [rsp - 56]  # 8-byte Folded Reload
	add	rbx, r10
	adc	rbp, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mulx	rsi, r10, qword ptr [rsp - 48]  # 8-byte Folded Reload
	add	r10, rax
	adc	rsi, r14
	mov	qword ptr [rsp - 80], rsi       # 8-byte Spill
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	r14, rax, rsi
	add	rax, rcx
	adc	r14, r15
	lea	rcx, [rsi + 8*rsi]
	lea	rcx, [rsi + 2*rcx]
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rdx, qword ptr [rdx + 32]
	mulx	rsi, r11, rcx
	add	r11, r8
	adc	rsi, r12
	mulx	rcx, r15, qword ptr [rsp - 64]  # 8-byte Folded Reload
	add	r15, r9
	adc	rcx, r13
	mulx	r9, r12, qword ptr [rsp - 72]   # 8-byte Folded Reload
	add	r12, rbx
	adc	r9, rbp
	mulx	r8, rbx, qword ptr [rsp - 56]   # 8-byte Folded Reload
	add	rbx, r10
	adc	r8, qword ptr [rsp - 80]        # 8-byte Folded Reload
	mulx	rdx, r10, qword ptr [rsp - 48]  # 8-byte Folded Reload
	add	r10, rax
	adc	rdx, r14
	shld	r9, r12, 13
	add	r9, rbx
	adc	r8, 0
	mov	al, 51
	shld	rsi, r11, 13
	bzhi	rbx, r12, rax
	add	rsi, r15
	adc	rcx, 0
	bzhi	r11, r11, rax
	shld	r8, r9, 13
	add	r8, r10
	adc	rdx, 0
	shld	rcx, rsi, 13
	add	rcx, rbx
	shld	rdx, r8, 13
	lea	r10, [rdx + 8*rdx]
	lea	rdx, [rdx + 2*r10]
	bzhi	r9, r9, rax
	add	rdx, r11
	bzhi	r10, rcx, rax
	shr	rcx, 51
	add	rcx, r9
	bzhi	rsi, rsi, rax
	bzhi	r8, r8, rax
	bzhi	rax, rdx, rax
	shr	rdx, 51
	add	rdx, rsi
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], r10
	mov	qword ptr [rdi + 24], rcx
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
	.size	open_ssl_curve25519_fe51_mul, .Lfunc_end0-open_ssl_curve25519_fe51_mul
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

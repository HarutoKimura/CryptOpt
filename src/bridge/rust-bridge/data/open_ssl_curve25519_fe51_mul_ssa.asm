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
	mov	rcx, rdx
	mov	r14, qword ptr [rdx]
	mov	r8, qword ptr [rdx + 8]
	mov	r9, qword ptr [rsi]
	mov	r11, rsi
	mov	rax, r14
	mov	qword ptr [rsp - 24], r14       # 8-byte Spill
	mul	r9
	mov	rbx, rdx
	mov	r13, rax
	mov	rax, r8
	mov	qword ptr [rsp - 8], r8         # 8-byte Spill
	mul	r9
	mov	rbp, rax
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	r12, qword ptr [rcx + 16]
	mov	rax, r12
	mov	qword ptr [rsp - 40], r12       # 8-byte Spill
	mul	r9
	mov	r15, rax
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	r10, qword ptr [rcx + 24]
	mov	rax, r10
	mul	r9
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rcx, qword ptr [rcx + 32]
	mov	rax, rcx
	mul	r9
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	lea	rax, [rcx + 8*rcx]
	lea	rcx, [rcx + 2*rax]
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	rsi, qword ptr [rsi + 8]
	mov	r9, r11
	mov	qword ptr [rsp - 16], r11       # 8-byte Spill
	mov	rax, rsi
	mul	rcx
	mov	r11, rdx
	mov	rcx, rax
	add	rcx, r13
	adc	r11, rbx
	mov	rax, rsi
	mul	r14
	mov	r13, rax
	add	r13, rbp
	adc	rdx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rax, rsi
	mul	r8
	mov	r14, rdx
	mov	rbp, rax
	add	rbp, r15
	adc	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	rax, rsi
	mul	r12
	mov	r15, rdx
	mov	r8, rax
	add	r8, qword ptr [rsp - 56]        # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	mov	rax, rsi
	mul	r10
	mov	r12, rdx
	mov	rsi, rax
	add	rsi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 64]       # 8-byte Folded Reload
	lea	rax, [r10 + 8*r10]
	lea	rdx, [r10 + 2*rax]
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rbx, qword ptr [r9 + 16]
	mov	rax, rbx
	mul	rdx
	mov	r9, rax
	add	r9, rcx
	adc	rdx, r11
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rax, rbx
	mul	qword ptr [rsp - 32]            # 8-byte Folded Reload
	mov	rcx, rax
	add	rcx, r13
	adc	rdx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rax, rbx
	mov	r13, qword ptr [rsp - 24]       # 8-byte Reload
	mul	r13
	mov	r10, rax
	add	r10, rbp
	adc	rdx, r14
	mov	rbp, rdx
	mov	rax, rbx
	mul	qword ptr [rsp - 8]             # 8-byte Folded Reload
	mov	r11, rax
	add	r11, r8
	adc	rdx, r15
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rax, rbx
	mov	rbx, qword ptr [rsp - 40]       # 8-byte Reload
	mul	rbx
	mov	r8, rax
	add	r8, rsi
	adc	rdx, r12
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	lea	rax, [rbx + 8*rbx]
	lea	rdx, [rbx + 2*rax]
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 16]       # 8-byte Reload
	mov	rsi, qword ptr [rax + 24]
	mov	rax, rsi
	mul	rdx
	mov	rbx, rax
	add	rbx, r9
	adc	rdx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	rax, rsi
	mul	qword ptr [rsp - 64]            # 8-byte Folded Reload
	mov	r14, rax
	add	r14, rcx
	adc	rdx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rax, rsi
	mul	qword ptr [rsp - 32]            # 8-byte Folded Reload
	mov	r15, rax
	add	r15, r10
	adc	rdx, rbp
	mov	r10, rdx
	mov	rax, rsi
	mul	r13
	mov	rbp, rdx
	mov	r12, rax
	add	r12, r11
	adc	rbp, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	rax, rsi
	mov	rsi, qword ptr [rsp - 8]        # 8-byte Reload
	mul	rsi
	mov	rcx, rax
	add	rcx, r8
	adc	rdx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	lea	rax, [rsi + 8*rsi]
	lea	rdx, [rsi + 2*rax]
	mov	rax, qword ptr [rsp - 16]       # 8-byte Reload
	mov	r13, qword ptr [rax + 32]
	mov	rax, r13
	mul	rdx
	mov	rsi, rdx
	mov	r9, rax
	add	r9, rbx
	adc	rsi, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	rax, r13
	mul	qword ptr [rsp - 40]            # 8-byte Folded Reload
	mov	r8, rdx
	mov	rbx, rax
	add	rbx, r14
	adc	r8, qword ptr [rsp - 80]        # 8-byte Folded Reload
	mov	rax, r13
	mul	qword ptr [rsp - 64]            # 8-byte Folded Reload
	mov	r11, rdx
	mov	r14, rax
	add	r14, r15
	adc	r11, r10
	mov	rax, r13
	mul	qword ptr [rsp - 32]            # 8-byte Folded Reload
	mov	r10, rdx
	mov	r15, rax
	add	r15, r12
	adc	r10, rbp
	mov	rax, r13
	mul	qword ptr [rsp - 24]            # 8-byte Folded Reload
	add	rax, rcx
	adc	rdx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	shld	r11, r14, 13
	add	r11, r15
	adc	r10, 0
	movabs	rcx, 2251799813685247
	and	r14, rcx
	shld	rsi, r9, 13
	add	rsi, rbx
	adc	r8, 0
	shld	r10, r11, 13
	and	r9, rcx
	add	r10, rax
	adc	rdx, 0
	shld	r8, rsi, 13
	shld	rdx, r10, 13
	add	r8, r14
	lea	rax, [rdx + 8*rdx]
	lea	rax, [rdx + 2*rax]
	and	r11, rcx
	and	rsi, rcx
	add	rax, r9
	mov	rdx, r8
	shr	rdx, 51
	add	rdx, r11
	mov	r9, rax
	shr	r9, 51
	add	r9, rsi
	and	r10, rcx
	and	r8, rcx
	and	rax, rcx
	mov	qword ptr [rdi], rax
	mov	qword ptr [rdi + 8], r9
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], rdx
	mov	qword ptr [rdi + 32], r10
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

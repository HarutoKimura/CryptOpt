	.text
	.intel_syntax noprefix
	.file	"openssl_p448_square.c"
	.globl	openssl_p448_square             # -- Begin function openssl_p448_square
	.p2align	4, 0x90
	.type	openssl_p448_square,@function
openssl_p448_square:                    # @openssl_p448_square
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
	sub	rsp, 16
	.cfi_def_cfa_offset 72
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr [rsi + 32]
	mov	r10, qword ptr [rsi]
	mov	qword ptr [rsp - 128], r10      # 8-byte Spill
	mov	r9, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 56], r9        # 8-byte Spill
	lea	r14, [rax + r10]
	mov	qword ptr [rsp - 120], r14      # 8-byte Spill
	mov	r8, rax
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	r11, qword ptr [rsi + 56]
	mov	qword ptr [rsp - 64], r11       # 8-byte Spill
	lea	rcx, [r11 + rdx]
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mulx	rax, r10, r10
	mov	rdx, rcx
	mulx	rbx, rcx, r14
	mov	rdx, r11
	mulx	r11, r15, r8
	mov	rdx, qword ptr [rsi + 16]
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mulx	r12, r13, r9
	add	r13, r10
	adc	r12, rax
	mov	rax, qword ptr [rsi + 40]
	mov	r8, qword ptr [rsi + 48]
	lea	r10, [rax + r9]
	mov	rsi, rax
	lea	rbp, [r8 + rdx]
	mov	rdx, rbp
	mulx	rax, rdx, r10
	mov	qword ptr [rsp - 32], r10       # 8-byte Spill
	sub	rcx, r13
	sbb	rbx, r12
	add	rcx, rdx
	adc	rbx, rax
	mov	rdx, r8
	mulx	r14, rax, rsi
	mov	r9, rsi
	mov	qword ptr [rsp - 24], rsi       # 8-byte Spill
	add	rax, r15
	adc	r14, r11
	add	rax, r13
	adc	r14, r12
	movabs	rdx, 72057594037927935
	dec	rdx
	lea	rsi, [rax + rax]
	and	rsi, rdx
	mov	qword ptr [rsp], rsi            # 8-byte Spill
	lea	rsi, [rcx + rcx]
	and	rsi, rdx
	mov	qword ptr [rsp + 8], rsi        # 8-byte Spill
	mov	rsi, rbx
	shld	rbx, rcx, 9
	shr	rsi, 55
	shrd	rax, r14, 55
	lea	rcx, [r10 + r10]
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r10, r11, rcx
	lea	rcx, [r9 + r9]
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r15, r12, rcx
	mov	qword ptr [rsp - 40], rbp       # 8-byte Spill
	mov	rdx, rbp
	mulx	r13, rcx, rbp
	shr	r14, 55
	add	rcx, r11
	adc	r13, r10
	add	rcx, rbx
	adc	r13, rsi
	mov	qword ptr [rsp - 48], r8        # 8-byte Spill
	mov	rdx, r8
	mulx	r9, rbp, r8
	mov	rdx, qword ptr [rsp - 128]      # 8-byte Reload
	mulx	r10, r11, rdx
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	mulx	rsi, rbx, rdx
	sub	rbx, r11
	sbb	rsi, r10
	add	rbx, rbp
	adc	rsi, r9
	add	rbx, r12
	adc	rsi, r15
	add	rbx, rax
	adc	rsi, r14
	add	rbx, rcx
	adc	rsi, r13
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	r14, r15, rdx
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rax, r9, rdx
	mov	r8, qword ptr [rsp - 56]        # 8-byte Reload
	lea	r12, [r8 + r8]
	mov	rbp, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rdx, rbp
	mulx	r12, rdx, r12
	add	rdx, r9
	adc	r12, rax
	add	r15, r11
	adc	r14, r10
	sub	r15, rdx
	sbb	r14, r12
	add	r15, rcx
	adc	r14, r13
	mov	rax, r14
	shld	r14, r15, 8
	mov	r11, rsi
	shld	rsi, rbx, 8
	mov	rcx, qword ptr [rsp - 40]       # 8-byte Reload
	add	rcx, rcx
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	rcx, r10, rcx
	mov	r9b, 56
	bzhi	rdx, r15, r9
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	bzhi	rdx, rbx, r9
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	lea	r9, [rdx + rdx]
	mov	rdx, rbp
	mulx	rdx, r9, r9
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	lea	r9, [rdx + rdx]
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r9, r12, r9
	shr	rax, 56
	shr	r11, 56
	mov	rbx, qword ptr [rsp - 128]      # 8-byte Reload
	add	rbx, rbx
	mov	qword ptr [rsp - 128], rbx      # 8-byte Spill
	mov	rdx, r8
	mulx	rbp, r15, rbx
	mov	r8, qword ptr [rsp - 120]       # 8-byte Reload
	add	r8, r8
	mov	qword ptr [rsp - 120], r8       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	rbx, r13, r8
	mov	r8, qword ptr [rsp - 104]       # 8-byte Reload
	add	r8, r8
	sub	r13, r15
	sbb	rbx, rbp
	add	r13, r12
	adc	rbx, r9
	add	r13, r10
	adc	rbx, rcx
	add	r13, rsi
	adc	rbx, r11
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rsi, rdx, r8
	mov	r12, r8
	add	rdx, r15
	adc	rsi, rbp
	sub	rdx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	sbb	rsi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	rdx, r10
	adc	rsi, rcx
	add	rdx, r14
	adc	rsi, rax
	mov	r14, rsi
	shld	rsi, rdx, 8
	mov	cl, 56
	bzhi	rax, rdx, rcx
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	r10, rbx
	shld	rbx, r13, 8
	bzhi	rax, r13, rcx
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	shr	r14, 56
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r11, rax, rdx
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 96]       # 8-byte Reload
	mulx	rax, rcx, rdx
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r13, r9, rdx
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	mulx	rcx, r8, qword ptr [rsp - 128]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 40]       # 8-byte Reload
	mulx	r15, rax, qword ptr [rsp - 120] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	rdx, r12, r12
	mov	qword ptr [rsp - 128], r12      # 8-byte Spill
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mulx	r12, rbp, rdx
	shr	r10, 56
	add	rbp, r8
	adc	r12, rcx
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	rcx, r8, rdx
	sub	r8, rbp
	sbb	rcx, r12
	add	r8, rax
	adc	rcx, r15
	add	r8, r9
	adc	rcx, r13
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	add	r8, rax
	adc	rcx, r11
	add	r8, rbx
	adc	rcx, r10
	mov	rdx, qword ptr [rsp - 24]       # 8-byte Reload
	mulx	rdx, r10, rdx
	add	r10, rbp
	adc	rdx, r12
	add	r10, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	sub	r10, qword ptr [rsp - 96]       # 8-byte Folded Reload
	sbb	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r10, rax
	adc	rdx, r11
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mov	qword ptr [rdi + 8], rax
	add	r10, rsi
	adc	rdx, r14
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	mov	qword ptr [rdi + 40], rax
	mov	sil, 56
	bzhi	rax, r10, rsi
	mov	qword ptr [rdi + 16], rax
	bzhi	rax, r8, rsi
	mov	r9b, 56
	mov	qword ptr [rdi + 48], rax
	mov	rax, rdx
	shld	rdx, r10, 8
	mov	rsi, rcx
	shld	rcx, r8, 8
	shr	rax, 56
	shr	rsi, 56
	add	rdx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	rax, 0
	add	rcx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	rsi, 0
	bzhi	r8, rdx, r9
	mov	qword ptr [rdi + 24], r8
	shld	rax, rdx, 8
	bzhi	rdx, rcx, r9
	mov	qword ptr [rdi + 56], rdx
	add	rax, qword ptr [rsp - 16]       # 8-byte Folded Reload
	shld	rsi, rcx, 8
	add	rax, rsi
	mov	qword ptr [rdi + 32], rax
	add	rsi, qword ptr [rsp - 8]        # 8-byte Folded Reload
	mov	qword ptr [rdi], rsi
	add	rsp, 16
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
	.size	openssl_p448_square, .Lfunc_end0-openssl_p448_square
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

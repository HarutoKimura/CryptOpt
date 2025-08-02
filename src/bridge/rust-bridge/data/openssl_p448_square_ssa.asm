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
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr [rsi + 32]
	mov	rdx, qword ptr [rsi]
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	lea	r10, [rax + rdx]
	mov	qword ptr [rsp - 120], r10      # 8-byte Spill
	mov	r14, rax
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rax, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rcx, qword ptr [rsi + 56]
	lea	r8, [rcx + rax]
	mov	qword ptr [rsp - 96], r8        # 8-byte Spill
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mul	rdx
	mov	r9, rdx
	mov	r11, rax
	mov	rax, r8
	mul	r10
	mov	r10, rdx
	mov	rbx, rax
	mov	rax, rcx
	mul	r14
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	rcx, qword ptr [rsi + 8]
	mov	rax, qword ptr [rsi + 16]
	mov	r12, rax
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mul	rcx
	mov	r15, rcx
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	rcx, rdx
	mov	r8, rax
	add	r8, r11
	adc	rcx, r9
	mov	r9, qword ptr [rsi + 40]
	mov	r14, qword ptr [rsi + 48]
	lea	rsi, [r9 + r15]
	lea	r15, [r14 + r12]
	mov	rax, r15
	mul	rsi
	mov	rbp, rsi
	mov	qword ptr [rsp + 8], rsi        # 8-byte Spill
	mov	rsi, rdx
	mov	r12, rax
	mov	rax, r14
	mul	r9
	mov	r13, r9
	mov	qword ptr [rsp], r9             # 8-byte Spill
	mov	r11, rax
	mov	r9, rdx
	sub	rbx, r8
	sbb	r10, rcx
	add	rbx, r12
	adc	r10, rsi
	add	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 40]        # 8-byte Folded Reload
	add	r11, r8
	adc	r9, rcx
	lea	rcx, [r11 + r11]
	movabs	rax, 72057594037927935
	dec	rax
	and	rcx, rax
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	lea	rcx, [rbx + rbx]
	and	rcx, rax
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	mov	r8, r10
	shld	r10, rbx, 9
	shr	r8, 55
	shrd	r11, r9, 55
	shr	r9, 55
	lea	rcx, [2*rbp]
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mul	rcx
	mov	rcx, rax
	mov	rsi, rdx
	lea	rdx, [2*r13]
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mul	rdx
	mov	rbx, rdx
	mov	rbp, rax
	mov	qword ptr [rsp - 8], r15        # 8-byte Spill
	mov	rax, r15
	mul	r15
	mov	r13, rdx
	mov	r15, rax
	add	r15, rcx
	adc	r13, rsi
	add	r15, r10
	adc	r13, r8
	mov	qword ptr [rsp - 16], r14       # 8-byte Spill
	mov	rax, r14
	mul	r14
	mov	rcx, rdx
	mov	r8, rax
	mov	rax, qword ptr [rsp - 128]      # 8-byte Reload
	mul	rax
	mov	rsi, rdx
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	r12, rax
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	mul	rax
	mov	r10, rdx
	mov	r14, rax
	sub	r14, r12
	sbb	r10, rsi
	add	r14, r8
	adc	r10, rcx
	add	r14, rbp
	adc	r10, rbx
	add	r14, r11
	adc	r10, r9
	add	r14, r15
	adc	r10, r13
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mul	rax
	mov	rbx, rdx
	mov	r11, rax
	mov	rsi, qword ptr [rsp - 32]       # 8-byte Reload
	mov	rax, rsi
	mul	rsi
	mov	rcx, rax
	mov	r8, rdx
	mov	rbp, qword ptr [rsp - 24]       # 8-byte Reload
	lea	rdx, [2*rbp]
	mov	r9, qword ptr [rsp - 80]        # 8-byte Reload
	mov	rax, r9
	mul	rdx
	add	rax, rcx
	adc	rdx, r8
	add	r11, r12
	adc	rbx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	sub	r11, rax
	sbb	rbx, rdx
	add	r11, r15
	adc	rbx, r13
	mov	r12, rbx
	shld	rbx, r11, 8
	shr	r12, 56
	movabs	rax, 72057594037927935
	and	r11, rax
	mov	r8, r10
	shr	r8, 56
	shld	r10, r14, 8
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	lea	rcx, [rax + rax]
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mul	rcx
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	lea	rcx, [rsi + rsi]
	mov	rax, r9
	mul	rcx
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 16]       # 8-byte Reload
	lea	rcx, [rax + rax]
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mul	rcx
	mov	r15, rax
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 128]      # 8-byte Reload
	add	rcx, rcx
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	rax, rbp
	mul	rcx
	mov	rcx, rax
	mov	rbp, rdx
	mov	rdx, qword ptr [rsp - 120]      # 8-byte Reload
	add	rdx, rdx
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	rdx
	mov	rsi, rax
	mov	r9, rdx
	mov	rdx, qword ptr [rsp - 112]      # 8-byte Reload
	add	rdx, rdx
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	mul	rdx
	mov	r13, rdx
	movabs	rdx, 72057594037927935
	and	r14, rdx
	sub	rsi, rcx
	sbb	r9, rbp
	add	rsi, r15
	adc	r9, qword ptr [rsp + 16]        # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	add	rsi, rdx
	mov	r15, qword ptr [rsp - 64]       # 8-byte Reload
	adc	r9, r15
	add	rsi, r10
	adc	r9, r8
	add	rax, rcx
	adc	r13, rbp
	sub	rax, qword ptr [rsp - 56]       # 8-byte Folded Reload
	sbb	r13, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	rax, rdx
	adc	r13, r15
	add	rax, rbx
	adc	r13, r12
	mov	rcx, r13
	shld	r13, rax, 8
	mov	r8, rax
	movabs	rax, 72057594037927935
	and	r8, rax
	mov	qword ptr [rsp - 104], r8       # 8-byte Spill
	mov	r10, r9
	shld	r9, rsi, 8
	mov	rbx, rsi
	and	rbx, rax
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mul	rax
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	r8, rax
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	mul	rax
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	shr	rcx, 56
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mul	rax
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp - 32]       # 8-byte Reload
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	mul	qword ptr [rsp - 120]           # 8-byte Folded Reload
	mov	rbp, rax
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	shr	r10, 56
	mov	rax, qword ptr [rsp - 16]       # 8-byte Reload
	mul	qword ptr [rsp - 112]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 24]       # 8-byte Reload
	mul	rax
	mov	r12, rdx
	mov	r15, rax
	add	r15, rsi
	adc	r12, rcx
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	rax
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	mul	rax
	sub	rsi, r15
	sbb	rcx, r12
	add	rsi, rbp
	adc	rcx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	rsi, r8
	mov	rbp, qword ptr [rsp - 64]       # 8-byte Reload
	adc	rcx, rbp
	add	rsi, r9
	adc	rcx, r10
	add	rax, r15
	adc	rdx, r12
	add	rax, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r9, qword ptr [rsp - 104]       # 8-byte Reload
	mov	qword ptr [rdi + 8], r9
	sub	rax, qword ptr [rsp - 56]       # 8-byte Folded Reload
	sbb	rdx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	qword ptr [rdi + 40], rbx
	add	rax, r8
	adc	rdx, rbp
	add	rax, r13
	adc	rdx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	r8, rdx
	shld	rdx, rax, 8
	movabs	r9, 72057594037927935
	and	rax, r9
	mov	qword ptr [rdi + 16], rax
	mov	rax, rcx
	shld	rcx, rsi, 8
	and	rsi, r9
	shr	r8, 56
	shr	rax, 56
	add	rdx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r8, 0
	add	rcx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rax, 0
	shld	r8, rdx, 8
	mov	qword ptr [rdi + 48], rsi
	mov	rsi, r9
	and	rdx, r9
	mov	qword ptr [rdi + 24], rdx
	and	rsi, rcx
	mov	qword ptr [rdi + 56], rsi
	add	r8, r14
	shld	rax, rcx, 8
	add	r8, rax
	mov	qword ptr [rdi + 32], r8
	add	rax, r11
	mov	qword ptr [rdi], rax
	add	rsp, 24
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

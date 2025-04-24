	.text
	.intel_syntax noprefix
	.file	"curve25519_dalek_u64.80576f01c95d88f1-cgu.0"
	.globl	curve25519_dalek_mul                             # -- Begin function mul
	.p2align	4, 0x90
	.type	curve25519_dalek_mul,@function
curve25519_dalek_mul:                                    # @mul
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
	sub	rsp, 144
	.cfi_def_cfa_offset 200
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r8, rdx
	mov	rax, qword ptr [rdx]
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	r15, qword ptr [rdx + 8]
	lea	rcx, [r15 + 8*r15]
	lea	r11, [r15 + 2*rcx]
	mov	rcx, qword ptr [rdx + 16]
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	lea	rdx, [rcx + 8*rcx]
	lea	r10, [rcx + 2*rdx]
	mov	qword ptr [rsp - 96], r10       # 8-byte Spill
	mov	rcx, qword ptr [rsi]
	mov	qword ptr [rsp - 80], rcx       # 8-byte Spill
	mul	rcx
	mov	rcx, rax
	mov	r9, rdx
	mov	r12, qword ptr [r8 + 24]
	mov	rax, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mul	r11
	mov	r11, rdx
	mov	rbx, rax
	add	rbx, rcx
	adc	r11, r9
	mov	r13, qword ptr [rsi + 24]
	mov	rax, r13
	mov	qword ptr [rsp - 128], r13      # 8-byte Spill
	mul	r10
	mov	r9, rdx
	mov	r14, rax
	add	r14, rbx
	mov	qword ptr [rsp], r12            # 8-byte Spill
	lea	rax, [r12 + 8*r12]
	lea	r12, [r12 + 2*rax]
	adc	r9, r11
	mov	rcx, qword ptr [rsi + 16]
	mov	rax, rcx
	mul	r12
	mov	r11, rdx
	mov	rbx, rax
	add	rbx, r14
	adc	r11, r9
	mov	rdx, qword ptr [r8 + 32]
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	lea	rax, [rdx + 8*rdx]
	lea	rbp, [rdx + 2*rax]
	mov	r9, qword ptr [rsi + 8]
	mov	rax, r9
	mul	rbp
	add	rax, rbx
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	adc	rdx, r11
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	mov	rax, r9
	mov	r10, qword ptr [rsp - 120]      # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	r14, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rax, r14
	mul	r15
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	r8, qword ptr [rsp - 104]       # 8-byte Reload
	mov	rax, r8
	mul	qword ptr [rsp - 96]            # 8-byte Folded Reload
	mov	rbx, rdx
	mov	rsi, rax
	mov	rax, r13
	mul	r12
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	rax, rcx
	mul	rbp
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rax, rcx
	mul	r10
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	rax, r9
	mul	r15
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 88], rax       # 8-byte Spill
	mov	rax, r14
	mov	r11, qword ptr [rsp - 112]      # 8-byte Reload
	mul	r11
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rax, r8
	mov	r13, r8
	mul	r12
	mov	r12, rdx
	mov	r8, rax
	mov	rcx, qword ptr [rsp - 128]      # 8-byte Reload
	mov	rax, rcx
	mul	rbp
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, rcx
	mul	r10
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	mov	rcx, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, rcx
	mul	r15
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rax, r9
	mul	r11
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mov	rax, r14
	mov	r10, qword ptr [rsp]            # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rax, r13
	mul	rbp
	mov	rbp, rdx
	mov	r11, rax
	mov	rax, r13
	mul	qword ptr [rsp - 120]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 128]      # 8-byte Reload
	mul	r15
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	r13, rax
	mov	rax, rcx
	mul	qword ptr [rsp - 112]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	r15, rax
	mov	rax, r9
	mul	r10
	mov	r9, rdx
	mov	rcx, rax
	mov	rax, r14
	mul	qword ptr [rsp + 120]           # 8-byte Folded Reload
	mov	r14, qword ptr [rsp + 96]       # 8-byte Reload
	mov	r10, qword ptr [rsp + 80]       # 8-byte Reload
	shld	r10, r14, 13
	add	rsi, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	rsi, r10
	adc	rbx, 0
	shld	rbx, rsi, 13
	movabs	r10, 2251799813685247
	and	r14, r10
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 56]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 104]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 88]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 112]      # 8-byte Folded Reload
	add	r8, rbx
	adc	r12, 0
	shld	r12, r8, 13
	and	rsi, r10
	add	r11, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 56]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 40]       # 8-byte Folded Reload
	add	r11, r12
	adc	rbp, 0
	and	r8, r10
	shld	rbp, r11, 13
	add	rax, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rax, r13
	adc	rdx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rax, r15
	adc	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rax, rcx
	adc	rdx, r9
	add	rax, rbp
	adc	rdx, 0
	shld	rdx, rax, 13
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	add	rcx, r14
	mov	rdx, rcx
	shr	rdx, 51
	add	rdx, rsi
	and	r11, r10
	and	rax, r10
	and	rcx, r10
	mov	qword ptr [rdi], rcx
	mov	qword ptr [rdi + 8], rdx
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], r11
	mov	qword ptr [rdi + 32], rax
	mov	rax, rdi
	add	rsp, 144
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
	.size	mul, .Lfunc_end0-mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

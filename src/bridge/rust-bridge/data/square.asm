	.text
	.intel_syntax noprefix
	.file	"pow2k.4c4ecdcd6bd405c3-cgu.0"
	.globl	square                          # -- Begin function square
	.p2align	4, 0x90
	.type	square,@function
square:                                 # @square
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
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r15, qword ptr [rsi + 32]
	mov	rcx, qword ptr [rsi + 24]
	mov	r11, qword ptr [rsi + 16]
	mov	r12, qword ptr [rsi]
	mov	rbp, qword ptr [rsi + 8]
	lea	rax, [rcx + 8*rcx]
	lea	r8, [rcx + 2*rax]
	mov	rsi, rcx
	lea	rcx, [r15 + 8*r15]
	mov	rax, r12
	mul	r12
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	lea	r10, [r15 + 2*rcx]
	mov	rax, rbp
	mul	r10
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rax, r11
	mul	r8
	mov	rcx, rdx
	mov	r9, rax
	mov	rax, r8
	mul	rsi
	mov	rbx, rsi
	mov	qword ptr [rsp - 128], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	rax, r12
	mul	rbp
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	rax, r11
	mul	r10
	mov	rsi, rdx
	mov	r14, rax
	mov	rax, rbp
	mul	rbp
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rax, r12
	mul	r11
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, r8
	mul	r15
	mov	r8, rdx
	mov	r13, rax
	mov	rax, r10
	mul	r15
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rax, r12
	mul	rbx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rax, rbp
	mul	r11
	mov	r10, rdx
	mov	rbx, rax
	mov	rax, r11
	mul	r11
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, r12
	mul	r15
	mov	r12, rdx
	mov	r11, rax
	mov	rax, rbp
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	shld	rcx, r9, 1
	add	r9, r9
	add	r9, qword ptr [rsp - 40]        # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	movabs	rbp, 2251799813685247
	mov	r15, r9
	and	r15, rbp
	add	rax, r11
	adc	rdx, r12
	shld	rdx, rax, 1
	add	rax, rax
	add	rax, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 96]       # 8-byte Folded Reload
	shld	r10, rbx, 1
	add	rbx, rbx
	add	rbx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 48]        # 8-byte Folded Reload
	shld	r8, r13, 1
	add	r13, r13
	add	r13, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 16]        # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp]            # 8-byte Folded Reload
	shld	rsi, r14, 1
	add	r14, r14
	add	r14, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 16]       # 8-byte Folded Reload
	shld	rcx, r9, 13
	add	rcx, r14
	adc	rsi, 0
	shld	rsi, rcx, 13
	add	rsi, r13
	adc	r8, 0
	shld	r8, rsi, 13
	add	r8, rbx
	adc	r10, 0
	shld	r10, r8, 13
	add	r10, rax
	adc	rdx, 0
	mov	rax, rdi
	shld	rdx, r10, 13
	lea	rdi, [rdx + 8*rdx]
	lea	rdx, [rdx + 2*rdi]
	add	rdx, r15
	mov	rdi, rdx
	and	rcx, rbp
	shr	rdx, 51
	add	rdx, rcx
	and	rdi, rbp
	and	r10, rbp
	and	r8, rbp
	and	rsi, rbp
	mov	qword ptr [rax], rdi
	mov	qword ptr [rax + 8], rdx
	mov	qword ptr [rax + 16], rsi
	mov	qword ptr [rax + 24], r8
	mov	qword ptr [rax + 32], r10
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
	.size	square, .Lfunc_end0-square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

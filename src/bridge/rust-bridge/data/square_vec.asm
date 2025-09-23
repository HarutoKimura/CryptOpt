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
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r13, qword ptr [rsi + 32]
	mov	r12, qword ptr [rsi + 24]
	mov	rcx, qword ptr [rsi + 16]
	mov	r10, qword ptr [rsi]
	mov	rax, qword ptr [rsi + 8]
	lea	rdx, [r12 + 8*r12]
	lea	r8, [r12 + 2*rdx]
	lea	rdx, [r13 + 8*r13]
	lea	r9, [r13 + 2*rdx]
	mov	rdx, r10
	mulx	rbx, r14, r10
	mov	rdx, rax
	mulx	r15, rbp, r9
	mov	rdx, rcx
	mulx	rsi, r11, r8
	add	r11, rbp
	mov	rdx, r8
	mulx	rdx, rbp, r12
	mov	qword ptr [rsp - 16], rbp       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, rbp, rax
	mov	qword ptr [rsp - 40], rbp       # 8-byte Spill
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	adc	rsi, r15
	shld	rsi, r11, 1
	add	r11, r11
	add	r11, r14
	adc	rsi, rbx
	mov	rdx, rcx
	mulx	rbx, r15, r9
	mov	rdx, rax
	mulx	rdx, r14, rax
	mov	qword ptr [rsp - 56], r14       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, r14, rcx
	mov	qword ptr [rsp - 72], r14       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	r8, r14, r13
	mov	rdx, r9
	mulx	rdx, r9, r13
	mov	qword ptr [rsp - 88], r9        # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, r9, r12
	mov	qword ptr [rsp - 104], r9       # 8-byte Spill
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	r9, rbp, rcx
	mov	rdx, rcx
	mulx	rdx, rcx, rcx
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rdx, r10
	mulx	r10, r13, r13
	mov	rdx, rax
	mulx	rdx, r12, r12
	mov	al, 51
	bzhi	rax, r11, rax
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	add	r12, r13
	adc	rdx, r10
	shld	rdx, r12, 1
	add	r12, r12
	add	r12, rcx
	adc	rdx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 96]        # 8-byte Folded Reload
	shld	r9, rbp, 1
	add	rbp, rbp
	add	rbp, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 80]        # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	shld	r8, r14, 1
	add	r14, r14
	add	r14, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 48]        # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	shld	rbx, r15, 1
	add	r15, r15
	add	r15, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	shld	rsi, r11, 13
	add	rsi, r15
	adc	rbx, 0
	shld	rbx, rsi, 13
	add	rbx, r14
	adc	r8, 0
	shld	r8, rbx, 13
	add	r8, rbp
	adc	r9, 0
	mov	rax, rdi
	shld	r9, r8, 13
	add	r9, r12
	adc	rdx, 0
	shld	rdx, r9, 13
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	add	rcx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	mov	r10b, 51
	bzhi	rdx, rcx, r10
	bzhi	rsi, rsi, r10
	shr	rcx, 51
	add	rcx, rsi
	bzhi	rsi, r9, r10
	bzhi	rdi, r8, r10
	bzhi	r8, rbx, r10
	mov	qword ptr [rax], rdx
	mov	qword ptr [rax + 8], rcx
	mov	qword ptr [rax + 16], r8
	mov	qword ptr [rax + 24], rdi
	mov	qword ptr [rax + 32], rsi
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

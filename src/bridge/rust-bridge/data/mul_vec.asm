	.text
	.intel_syntax noprefix
	.file	"curve25519_dalek_u64.80576f01c95d88f1-cgu.0"
	.globl	mul                             # -- Begin function mul
	.p2align	4, 0x90
	.type	mul,@function
mul:                                    # @mul
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
	push	rax
	.cfi_def_cfa_offset 64
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r10, rdx
	mov	rdx, qword ptr [rdx]
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rcx, qword ptr [r10 + 8]
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	lea	rax, [rcx + 8*rcx]
	lea	rax, [rcx + 2*rax]
	mov	r8, qword ptr [r10 + 16]
	mov	qword ptr [rsp - 48], r8        # 8-byte Spill
	lea	rcx, [r8 + 8*r8]
	lea	r12, [r8 + 2*rcx]
	mov	r13, qword ptr [rsi]
	mulx	rcx, r8, r13
	mov	rbx, qword ptr [rsi + 32]
	mov	rdx, rbx
	mulx	r9, rax, rax
	add	rax, r8
	adc	r9, rcx
	mov	rdx, qword ptr [rsi + 24]
	mov	r15, rdx
	mulx	r8, rcx, r12
	mov	rdx, qword ptr [r10 + 24]
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	add	rcx, rax
	lea	rax, [rdx + 8*rdx]
	lea	rbp, [rdx + 2*rax]
	adc	r8, r9
	mov	rdx, qword ptr [rsi + 16]
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mulx	r11, rax, rbp
	add	rax, rcx
	adc	r11, r8
	mov	rdx, qword ptr [r10 + 32]
	mov	qword ptr [rsp], rdx            # 8-byte Spill
	lea	rcx, [rdx + 8*rdx]
	lea	rcx, [rdx + 2*rcx]
	mov	qword ptr [rsp - 16], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mulx	r14, rsi, rcx
	add	rsi, rax
	mov	r10, rsi
	mov	qword ptr [rsp - 96], rsi       # 8-byte Spill
	mov	r8, qword ptr [rsp - 80]        # 8-byte Reload
	mulx	rax, rcx, r8
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	qword ptr [rsp - 24], r13       # 8-byte Spill
	mov	rdx, r13
	mov	r9, qword ptr [rsp - 72]        # 8-byte Reload
	mulx	rax, rcx, r9
	mov	rdx, rbx
	mulx	r12, rsi, r12
	adc	r14, r11
	shld	r14, r10, 13
	add	rsi, rcx
	adc	r12, rax
	mov	r10, r15
	mov	rdx, r15
	mulx	rax, rcx, rbp
	add	rsi, rcx
	adc	r12, rax
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	mov	r15, qword ptr [rsp - 16]       # 8-byte Reload
	mulx	rax, rcx, r15
	add	rsi, rcx
	adc	r12, rax
	add	rsi, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mulx	rax, rcx, r8
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	r11, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rdx, r11
	mulx	rax, rcx, r9
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	r8, r9
	mov	rdx, r13
	mov	r13, qword ptr [rsp - 48]       # 8-byte Reload
	mulx	r9, rcx, r13
	mov	rdx, rbx
	mulx	rax, rbp, rbp
	add	rsi, r14
	adc	r12, 0
	shld	r12, rsi, 13
	mov	dl, 51
	bzhi	rdx, qword ptr [rsp - 96], rdx  # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	add	rbp, rcx
	adc	rax, r9
	mov	rdx, r10
	mov	qword ptr [rsp - 32], r10       # 8-byte Spill
	mulx	rcx, r9, r15
	add	rbp, r9
	adc	rax, rcx
	add	rbp, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	rbp, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rbp, r12
	mov	r9, qword ptr [rsp - 80]        # 8-byte Reload
	mulx	rcx, rdx, r9
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 112], rcx      # 8-byte Spill
	mov	r12, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rdx, r12
	mulx	rcx, rdx, r8
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	mov	rdx, r11
	mulx	rcx, r11, r13
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	r8, qword ptr [rsp - 24]        # 8-byte Reload
	mov	rdx, r8
	mov	rcx, qword ptr [rsp - 8]        # 8-byte Reload
	mulx	r13, r10, rcx
	mov	rdx, rbx
	mulx	r15, r14, r15
	adc	rax, 0
	shld	rax, rbp, 13
	mov	dl, 51
	bzhi	rdx, rsi, rdx
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	add	r14, r10
	adc	r15, r13
	add	r14, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	r14, r11
	adc	r15, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r14, rax
	mov	rdx, rbx
	mulx	rax, r9, r9
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	mulx	r10, r11, qword ptr [rsp - 72]  # 8-byte Folded Reload
	mov	rdx, r12
	mulx	rbx, r12, qword ptr [rsp - 48]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 64]       # 8-byte Reload
	mulx	r13, rsi, rcx
	mov	rdx, r8
	mulx	r8, rdx, qword ptr [rsp]        # 8-byte Folded Reload
	adc	r15, 0
	shld	r15, r14, 13
	mov	cl, 51
	bzhi	rcx, rbp, rcx
	add	rdx, r9
	adc	r8, rax
	add	rdx, r11
	adc	r8, r10
	add	rdx, r12
	adc	r8, rbx
	add	rdx, rsi
	adc	r8, r13
	mov	rax, rdi
	add	rdx, r15
	adc	r8, 0
	shld	r8, rdx, 13
	lea	rsi, [r8 + 8*r8]
	lea	rsi, [r8 + 2*rsi]
	add	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	mov	r8b, 51
	bzhi	rdi, r14, r8
	bzhi	rdx, rdx, r8
	bzhi	r8, rsi, r8
	shr	rsi, 51
	add	rsi, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	qword ptr [rax], r8
	mov	qword ptr [rax + 8], rsi
	mov	qword ptr [rax + 16], rcx
	mov	qword ptr [rax + 24], rdi
	mov	qword ptr [rax + 32], rdx
	add	rsp, 8
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

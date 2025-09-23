	.text
	.intel_syntax noprefix
	.file	"c_fiat_p448_carry_square.c"
	.globl	c_fiat_p448_carry_square        # -- Begin function c_fiat_p448_carry_square
	.p2align	4, 0x90
	.type	c_fiat_p448_carry_square,@function
c_fiat_p448_carry_square:               # @c_fiat_p448_carry_square
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
	sub	rsp, 336
	.cfi_def_cfa_offset 392
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rdx, qword ptr [rsi + 56]
	lea	r9, [rdx + rdx]
	mov	rcx, qword ptr [rsi + 48]
	lea	r11, [rcx + rcx]
	mov	rax, qword ptr [rsi + 40]
	mulx	rdx, r8, rdx
	mov	qword ptr [rsp - 56], r8        # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, r9
	mov	qword ptr [rsp - 72], r8        # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rcx, rdx, rcx
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 96], rcx       # 8-byte Spill
	mov	rdx, rax
	mov	r10, r9
	mulx	rcx, rdx, r9
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, r8, r11
	mulx	rdx, r9, rax
	mov	qword ptr [rsp + 320], r9       # 8-byte Spill
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 32]
	mulx	r15, rbp, r10
	mov	r14, r10
	add	rbp, r8
	adc	r15, rcx
	lea	r12, [rax + rax]
	mov	r8, r11
	mov	qword ptr [rsp - 112], r11      # 8-byte Spill
	mulx	r11, rax, r11
	mov	qword ptr [rsp + 312], rax      # 8-byte Spill
	mulx	rax, rcx, r12
	mov	qword ptr [rsp + 208], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mulx	rax, rcx, rdx
	mov	qword ptr [rsp + 104], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	lea	rbx, [rdx + rdx]
	mov	rdx, qword ptr [rsi + 24]
	mulx	rax, rcx, r10
	mov	qword ptr [rsp + 296], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	mulx	rax, rcx, r8
	mov	qword ptr [rsp + 192], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 200], rax      # 8-byte Spill
	mulx	r10, r13, r12
	mulx	rax, rcx, rbx
	mov	qword ptr [rsp + 16], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	r8, qword ptr [rsi + 16]
	mov	rax, qword ptr [rsi]
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rcx, qword ptr [rsi + 8]
	lea	rsi, [rdx + rdx]
	mulx	rdx, r9, rdx
	mov	qword ptr [rsp + 272], r9       # 8-byte Spill
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	qword ptr [rsp - 88], r14       # 8-byte Spill
	mulx	rdx, r9, r14
	mov	qword ptr [rsp + 160], r9       # 8-byte Spill
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mulx	r9, rdx, rax
	mov	qword ptr [rsp + 96], r9        # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r9, r12
	mov	qword ptr [rsp], r9             # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r9, rbx
	mov	qword ptr [rsp + 248], r9       # 8-byte Spill
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r9, rsi
	mov	qword ptr [rsp + 168], r9       # 8-byte Spill
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	lea	r9, [r8 + r8]
	mov	qword ptr [rsp + 120], r9       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, r8, r8
	mov	qword ptr [rsp + 64], r8        # 8-byte Spill
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, r14
	mov	qword ptr [rsp + 72], r8        # 8-byte Spill
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, rax
	mov	qword ptr [rsp - 16], r8        # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, r12
	mov	qword ptr [rsp + 232], r8       # 8-byte Spill
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, rbx
	mov	qword ptr [rsp + 144], r8       # 8-byte Spill
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, rsi
	mov	qword ptr [rsp + 48], r8        # 8-byte Spill
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	r14, r8, r9
	mulx	rdx, r9, rcx
	mov	qword ptr [rsp + 264], r9       # 8-byte Spill
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rdx, rax
	mulx	rdx, r9, qword ptr [rsp - 88]   # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], r9        # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, qword ptr [rsp - 112]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 224], r9       # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, r12
	mov	qword ptr [rsp + 128], r9       # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, rbx
	mov	qword ptr [rsp + 32], r9        # 8-byte Spill
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, rsi, rsi
	add	r8, rbp
	adc	r14, r15
	add	r8, rsi
	adc	r14, rdx
	shld	r14, r8, 8
	mov	dl, 56
	bzhi	rdx, r8, rdx
	mov	bl, 56
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	add	rbp, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	rbp, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	rbp, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	rbp, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 24]       # 8-byte Folded Reload
	mov	r8, qword ptr [rsp - 48]        # 8-byte Reload
	mov	rdx, qword ptr [rsp - 56]       # 8-byte Reload
	shld	r8, rdx, 1
	mov	r12, qword ptr [rsp - 64]       # 8-byte Reload
	mov	rdx, qword ptr [rsp - 72]       # 8-byte Reload
	shld	r12, rdx, 1
	mov	r9, qword ptr [rsp - 128]       # 8-byte Reload
	add	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], r9       # 8-byte Spill
	mov	rsi, qword ptr [rsp - 120]      # 8-byte Reload
	adc	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], rsi      # 8-byte Spill
	shld	r15, rbp, 8
	shld	rsi, r9, 1
	bzhi	rdx, rbp, rbx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	add	r13, qword ptr [rsp + 104]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 112]      # 8-byte Folded Reload
	lea	rdx, [r9 + r9]
	add	rdx, r13
	adc	rsi, r10
	add	rdx, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 96]       # 8-byte Reload
	adc	rsi, rbp
	add	rdx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 80]       # 8-byte Folded Reload
	mov	r9, qword ptr [rsp + 72]        # 8-byte Reload
	add	rdx, r9
	mov	rbx, qword ptr [rsp + 88]       # 8-byte Reload
	adc	rsi, rbx
	add	rdx, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 56]       # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 40]       # 8-byte Folded Reload
	add	rdx, r14
	adc	rsi, 0
	add	rdx, r15
	adc	rsi, 0
	shld	rsi, rdx, 8
	mov	r14b, 56
	bzhi	rdx, rdx, r14
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	add	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp - 80]       # 8-byte Folded Reload
	adc	r10, rbp
	add	r13, r9
	adc	r10, rbx
	lea	rbx, [rcx + rcx]
	mov	rdx, rax
	mulx	rcx, rdx, qword ptr [rsp + 120] # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rbx, r14, rbx
	mulx	rax, rdx, rax
	add	r13, rdx
	adc	r10, rax
	add	r13, r15
	adc	r10, 0
	mov	rcx, qword ptr [rsp + 192]      # 8-byte Reload
	add	rcx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 200]      # 8-byte Reload
	adc	rbp, qword ptr [rsp + 216]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 176]      # 8-byte Folded Reload
	mov	r15, qword ptr [rsp - 72]       # 8-byte Reload
	lea	rdx, [r15 + r15]
	add	rdx, rcx
	adc	r12, rbp
	add	rdx, qword ptr [rsp + 168]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 184]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 144]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 152]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	rdx, rsi
	adc	r12, 0
	shld	r10, r13, 8
	mov	r9b, 56
	bzhi	rax, r13, r9
	add	rcx, r15
	adc	rbp, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	rcx, r14
	adc	rbp, rbx
	add	rcx, r10
	adc	rbp, 0
	shld	r12, rdx, 8
	bzhi	rdx, rdx, r9
	mov	r14, qword ptr [rsp + 312]      # 8-byte Reload
	add	r14, qword ptr [rsp + 320]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 328]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 296]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 304]      # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp - 56]       # 8-byte Reload
	lea	rsi, [rbx + rbx]
	add	rsi, r14
	adc	r8, r11
	add	rsi, qword ptr [rsp + 272]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 288]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 256]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 240]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 88]        # 8-byte Folded Reload
	add	rsi, r12
	adc	r8, 0
	shld	rbp, rcx, 8
	mov	r15b, 56
	bzhi	r10, rcx, r15
	add	r14, rbx
	adc	r11, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 280]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r14, rbp
	adc	r11, 0
	shld	r8, rsi, 8
	add	r8, qword ptr [rsp - 96]        # 8-byte Folded Reload
	shld	r11, r14, 8
	add	r11, qword ptr [rsp - 112]      # 8-byte Folded Reload
	bzhi	rcx, r11, r15
	shr	r11, 56
	add	r11, qword ptr [rsp - 104]      # 8-byte Folded Reload
	bzhi	r9, r8, r15
	shr	r8, 56
	add	rax, r8
	add	r11, r8
	bzhi	r8, r11, r15
	shr	r11, 56
	add	r11, rdx
	bzhi	rdx, rsi, r15
	bzhi	rsi, r14, r15
	bzhi	rbx, rax, r15
	shr	rax, 56
	add	rax, r10
	mov	qword ptr [rdi], rbx
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], rsi
	mov	qword ptr [rdi + 24], rcx
	mov	qword ptr [rdi + 32], r8
	mov	qword ptr [rdi + 40], r11
	mov	qword ptr [rdi + 48], rdx
	mov	qword ptr [rdi + 56], r9
	add	rsp, 336
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
	.size	c_fiat_p448_carry_square, .Lfunc_end0-c_fiat_p448_carry_square
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

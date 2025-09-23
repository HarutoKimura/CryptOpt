	.text
	.intel_syntax noprefix
	.file	"rust_fiat_p448_solinas_carry_square.66fd646e711e0734-cgu.0"
	.globl	fiat_p448_solinas_carry_square_vec  # -- Begin function fiat_p448_solinas_carry_square
	.p2align	4, 0x90
	.type	fiat_p448_solinas_carry_square_vec,@function
fiat_p448_solinas_carry_square_vec:         # @fiat_p448_solinas_carry_square
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
	lea	r15, [rcx + rcx]
	mov	rax, qword ptr [rsi + 40]
	mulx	rdx, r8, rdx
	mov	qword ptr [rsp - 16], r8        # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, r8, r9
	mov	qword ptr [rsp - 32], r8        # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rcx, rdx, rcx
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 88], rcx       # 8-byte Spill
	mov	rdx, rax
	mov	r10, r9
	mulx	rbp, r12, r9
	mulx	rcx, r8, r15
	mulx	rdx, r9, rax
	mov	qword ptr [rsp + 320], r9       # 8-byte Spill
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsi + 32]
	mulx	rbx, r13, r10
	mov	r9, r10
	add	r13, r8
	adc	rbx, rcx
	mov	qword ptr [rsp], rbx            # 8-byte Spill
	lea	r10, [rax + rax]
	mulx	r11, rax, r15
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mulx	rax, rcx, r10
	mov	qword ptr [rsp + 208], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mulx	rax, rcx, rdx
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	lea	rbx, [rdx + rdx]
	mov	rdx, qword ptr [rsi + 24]
	mulx	rax, rcx, r9
	mov	qword ptr [rsp + 304], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 312], rax      # 8-byte Spill
	mulx	rax, rcx, r15
	mov	qword ptr [rsp + 192], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 200], rax      # 8-byte Spill
	mulx	rcx, rax, r10
	mov	qword ptr [rsp + 56], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mulx	rax, rcx, rbx
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	r8, qword ptr [rsi + 16]
	mov	rax, qword ptr [rsi]
	mov	rcx, qword ptr [rsi + 8]
	lea	r14, [rdx + rdx]
	mulx	rdx, rsi, rdx
	mov	qword ptr [rsp + 264], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	qword ptr [rsp - 120], r9       # 8-byte Spill
	mulx	rdx, rsi, r9
	mov	qword ptr [rsp + 176], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, rsi, r15
	mov	qword ptr [rsp - 80], r15       # 8-byte Spill
	mov	qword ptr [rsp - 56], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, rsi, r10
	mov	qword ptr [rsp + 40], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, rsi, rbx
	mov	qword ptr [rsp + 248], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	rdx, r8
	mov	r9, r14
	mulx	rdx, rsi, r14
	mov	qword ptr [rsp + 160], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	lea	r14, [r8 + r8]
	mov	qword ptr [rsp - 112], r14      # 8-byte Spill
	mov	rdx, r8
	mulx	rdx, rsi, r8
	mov	qword ptr [rsp + 112], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, qword ptr [rsp - 120] # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rsi       # 8-byte Spill
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r15
	mov	qword ptr [rsp + 24], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 32], rdx       # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r10
	mov	qword ptr [rsp + 232], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, rbx
	mov	qword ptr [rsp + 144], rsi      # 8-byte Spill
	mov	qword ptr [rsp + 152], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rdx, rsi, r9
	mov	qword ptr [rsp + 96], rsi       # 8-byte Spill
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	rdx, rcx
	mulx	rsi, r8, r14
	mulx	rdx, r15, rcx
	mov	qword ptr [rsp + 280], r15      # 8-byte Spill
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r15, qword ptr [rsp - 120] # 8-byte Folded Reload
	mov	qword ptr [rsp + 8], r15        # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r15, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 224], r15      # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r10, r10
	mov	qword ptr [rsp + 128], r10      # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r10, rbx
	mov	qword ptr [rsp + 72], r10       # 8-byte Spill
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rdx, r9, r9
	add	r8, r13
	mov	r14, qword ptr [rsp]            # 8-byte Reload
	adc	rsi, r14
	add	r8, r9
	adc	rsi, rdx
	shld	rsi, r8, 8
	mov	dl, 56
	bzhi	rdx, r8, rdx
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	add	r13, qword ptr [rsp - 104]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 32]       # 8-byte Folded Reload
	add	r13, qword ptr [rsp + 8]        # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 16]       # 8-byte Folded Reload
	mov	r8, qword ptr [rsp - 8]         # 8-byte Reload
	mov	rdx, qword ptr [rsp - 16]       # 8-byte Reload
	shld	r8, rdx, 1
	mov	r10, qword ptr [rsp - 24]       # 8-byte Reload
	mov	rdx, qword ptr [rsp - 32]       # 8-byte Reload
	shld	r10, rdx, 1
	add	r12, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	rcx, rcx
	mov	rdx, rax
	mulx	rdx, r9, qword ptr [rsp - 112]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], r9        # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rdx, rax
	mulx	rcx, rdx, rcx
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 104], rcx      # 8-byte Spill
	mov	rdx, rax
	mulx	rax, rcx, rax
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	r9, qword ptr [rsp + 64]        # 8-byte Reload
	mov	rdx, r9
	add	rdx, r12
	mov	r15, qword ptr [rsp + 80]       # 8-byte Reload
	mov	rax, r15
	adc	rax, rbp
	add	rdx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp + 56]       # 8-byte Reload
	adc	rax, rbx
	add	rdx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	rdx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	rdx, rcx
	adc	rax, qword ptr [rsp - 128]      # 8-byte Folded Reload
	shld	r14, r13, 8
	mov	cl, 56
	bzhi	rcx, r13, rcx
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	add	r12, r12
	adc	rbp, rbp
	add	r12, r9
	adc	rbp, r15
	add	r12, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rbp, rbx
	add	r12, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 112]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 120]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	r12, rsi
	adc	rbp, 0
	add	r12, r14
	adc	rbp, 0
	shld	rbp, r12, 8
	mov	cl, 56
	bzhi	r13, r12, rcx
	add	r14, rdx
	adc	rax, 0
	mov	rbx, qword ptr [rsp + 192]      # 8-byte Reload
	add	rbx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	mov	r15, qword ptr [rsp + 200]      # 8-byte Reload
	adc	r15, qword ptr [rsp + 216]      # 8-byte Folded Reload
	mov	r9, qword ptr [rsp - 32]        # 8-byte Reload
	lea	rdx, [r9 + r9]
	add	rdx, rbx
	adc	r10, r15
	mov	rcx, qword ptr [rsp + 176]      # 8-byte Reload
	add	rdx, rcx
	mov	r12, qword ptr [rsp + 184]      # 8-byte Reload
	adc	r10, r12
	add	rdx, qword ptr [rsp + 160]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 168]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 144]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 152]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 128]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 136]      # 8-byte Folded Reload
	add	rdx, rbp
	adc	r10, 0
	shld	rax, r14, 8
	mov	bpl, 56
	bzhi	rsi, r14, rbp
	add	rbx, r9
	adc	r15, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rbx, rcx
	adc	r15, r12
	add	rbx, qword ptr [rsp - 112]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	rbx, rax
	mov	rax, rbx
	adc	r15, 0
	shld	r10, rdx, 8
	bzhi	r12, rdx, rbp
	mov	dl, 56
	mov	rbx, qword ptr [rsp + 296]      # 8-byte Reload
	add	rbx, qword ptr [rsp + 320]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 328]      # 8-byte Folded Reload
	mov	r9, qword ptr [rsp - 16]        # 8-byte Reload
	lea	rcx, [r9 + r9]
	add	rcx, rbx
	adc	r8, r11
	mov	rbp, qword ptr [rsp + 304]      # 8-byte Reload
	add	rcx, rbp
	mov	r14, qword ptr [rsp + 312]      # 8-byte Reload
	adc	r8, r14
	add	rcx, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 272]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 248]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 256]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 232]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 240]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 224]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 80]        # 8-byte Folded Reload
	add	rcx, r10
	adc	r8, 0
	shld	r15, rax, 8
	bzhi	rdx, rax, rdx
	add	rbx, r9
	adc	r11, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	rbx, rbp
	adc	r11, r14
	add	rbx, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 288]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	rbx, r15
	adc	r11, 0
	shld	r8, rcx, 8
	add	r8, qword ptr [rsp - 128]       # 8-byte Folded Reload
	shld	r11, rbx, 8
	add	r11, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	r14b, 56
	bzhi	r9, r11, r14
	shr	r11, 56
	add	r11, r13
	bzhi	r10, r8, r14
	shr	r8, 56
	add	rsi, r8
	add	r11, r8
	bzhi	r8, r11, r14
	shr	r11, 56
	add	r11, r12
	bzhi	rax, rcx, r14
	bzhi	rcx, rbx, r14
	bzhi	rbx, rsi, r14
	shr	rsi, 56
	add	rsi, rdx
	mov	qword ptr [rdi], rbx
	mov	qword ptr [rdi + 8], rsi
	mov	qword ptr [rdi + 16], rcx
	mov	qword ptr [rdi + 24], r9
	mov	qword ptr [rdi + 32], r8
	mov	qword ptr [rdi + 40], r11
	mov	qword ptr [rdi + 48], rax
	mov	qword ptr [rdi + 56], r10
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
	.size	fiat_p448_solinas_carry_square, .Lfunc_end0-fiat_p448_solinas_carry_square
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

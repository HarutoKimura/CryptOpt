	.text
	.intel_syntax noprefix
	.file	"rust_fiat_p448_solinas_carry_square.66fd646e711e0734-cgu.0"
	.globl	fiat_p448_solinas_carry_square  # -- Begin function fiat_p448_solinas_carry_square
	.p2align	4, 0x90
	.type	fiat_p448_solinas_carry_square,@function
fiat_p448_solinas_carry_square:         # @fiat_p448_solinas_carry_square
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
	sub	rsp, 384
	.cfi_def_cfa_offset 440
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rbp, rsi
	mov	rax, qword ptr [rsi + 56]
	lea	r13, [rax + rax]
	mov	rcx, qword ptr [rsi + 48]
	lea	r8, [rcx + rcx]
	mul	rax
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rax, rcx
	mul	r13
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	rsi, qword ptr [rsi + 40]
	mov	rax, rcx
	mul	rcx
	mov	qword ptr [rsp + 240], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 232], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r13
	mov	r12, rdx
	mov	r9, rax
	mov	rax, rsi
	mov	rcx, r8
	mul	r8
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 136], rax      # 8-byte Spill
	mov	rax, rsi
	mul	rsi
	mov	qword ptr [rsp + 368], rax      # 8-byte Spill
	mov	qword ptr [rsp + 376], rdx      # 8-byte Spill
	mov	r11, qword ptr [rbp + 32]
	mov	rax, r11
	mul	r13
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	r8, rdx
	lea	r14, [rsi + rsi]
	mov	rax, r11
	mul	rcx
	mov	rsi, rcx
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 296], rax      # 8-byte Spill
	mov	rax, r11
	mul	r14
	mov	qword ptr [rsp + 312], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	mov	rax, r11
	mul	r11
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	mov	r10, qword ptr [rbp + 24]
	mov	rax, r10
	mul	r13
	mov	qword ptr [rsp + 360], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 352], rax      # 8-byte Spill
	mov	rax, r10
	mul	rcx
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mov	qword ptr [rsp + 224], rdx      # 8-byte Spill
	lea	rcx, [r11 + r11]
	mov	rax, r10
	mul	r14
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 120], rax      # 8-byte Spill
	mov	rax, r10
	mul	rcx
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	rax, r10
	mul	r10
	mov	qword ptr [rsp + 336], rax      # 8-byte Spill
	mov	qword ptr [rsp + 344], rdx      # 8-byte Spill
	mov	r11, qword ptr [rbp + 16]
	mov	rax, r11
	mul	r13
	mov	qword ptr [rsp + 256], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 248], rax      # 8-byte Spill
	mov	rax, r11
	mul	rsi
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	mov	rax, r11
	mul	r14
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	lea	r15, [r10 + r10]
	mov	rax, r11
	mul	rcx
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 320], rax      # 8-byte Spill
	mov	rax, r11
	mul	r15
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 168], rax      # 8-byte Spill
	mov	rax, r11
	mul	r11
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	mov	r10, qword ptr [rbp + 8]
	mov	rax, r10
	mul	r13
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rax, r10
	mul	rsi
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rax, r10
	mul	r14
	mov	qword ptr [rsp + 280], rax      # 8-byte Spill
	mov	qword ptr [rsp + 288], rdx      # 8-byte Spill
	lea	rbx, [r11 + r11]
	mov	rax, r10
	mul	rcx
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	mov	rax, r10
	mul	r15
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rax, r10
	mul	rbx
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	r11, rdx
	mov	rbp, qword ptr [rbp]
	mov	rax, r10
	mul	r10
	mov	qword ptr [rsp + 272], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 264], rax      # 8-byte Spill
	mov	rax, rbp
	mul	r13
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, rbp
	mul	rsi
	mov	qword ptr [rsp + 208], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	rax, rbp
	mul	r14
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 72], rax       # 8-byte Spill
	mov	rax, rbp
	mul	rcx
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rax, rbp
	mul	r15
	mov	r13, rax
	mov	rcx, rdx
	add	r10, r10
	mov	rax, rbp
	mul	rbx
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 176], rax      # 8-byte Spill
	mov	rax, rbp
	mul	r10
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 56], rax       # 8-byte Spill
	mov	rax, rbp
	mul	rbp
	mov	rsi, rax
	mov	r10, qword ptr [rsp - 128]      # 8-byte Reload
	add	r10, qword ptr [rsp + 136]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	add	rax, r10
	adc	r11, r8
	add	rax, r13
	adc	r11, rcx
	shld	r11, rax, 8
	mov	qword ptr [rsp - 120], r11      # 8-byte Spill
	movabs	rcx, 72057594037927935
	and	rax, rcx
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	add	r10, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 48]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 8]         # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	add	r10, qword ptr [rsp - 48]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], r10      # 8-byte Spill
	adc	r8, qword ptr [rsp - 40]        # 8-byte Folded Reload
	mov	r13, qword ptr [rsp - 56]       # 8-byte Reload
	mov	rbx, qword ptr [rsp - 64]       # 8-byte Reload
	shld	r13, rbx, 1
	mov	rbp, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 80]       # 8-byte Reload
	shld	rbp, rax, 1
	add	r9, qword ptr [rsp + 232]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 240]      # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp - 104]      # 8-byte Reload
	add	rbx, r9
	mov	r14, qword ptr [rsp + 16]       # 8-byte Reload
	mov	r15, r14
	adc	r15, r12
	mov	rcx, qword ptr [rsp + 120]      # 8-byte Reload
	add	rbx, rcx
	mov	r11, qword ptr [rsp + 128]      # 8-byte Reload
	adc	r15, r11
	mov	r10, qword ptr [rsp + 80]       # 8-byte Reload
	add	rbx, r10
	mov	rax, qword ptr [rsp + 96]       # 8-byte Reload
	adc	r15, rax
	add	rbx, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	rbx, rsi
	adc	r15, rdx
	mov	rdx, qword ptr [rsp - 128]      # 8-byte Reload
	shld	r8, rdx, 8
	movabs	rsi, 72057594037927935
	and	rdx, rsi
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	add	r9, r9
	adc	r12, r12
	add	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	adc	r12, r14
	add	r9, rcx
	adc	r12, r11
	add	r9, r10
	adc	r12, rax
	add	r9, qword ptr [rsp + 104]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 112]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 96]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 24]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 40]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 16]        # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 120]       # 8-byte Folded Reload
	adc	r12, 0
	add	r9, r8
	adc	r12, 0
	shld	r12, r9, 8
	movabs	r10, 72057594037927935
	and	r9, r10
	add	r8, rbx
	adc	r15, 0
	mov	rbx, qword ptr [rsp + 216]      # 8-byte Reload
	add	rbx, qword ptr [rsp + 304]      # 8-byte Folded Reload
	mov	rcx, qword ptr [rsp + 224]      # 8-byte Reload
	adc	rcx, qword ptr [rsp + 312]      # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	lea	rax, [rdx + rdx]
	add	rax, rbx
	adc	rbp, rcx
	mov	r14, qword ptr [rsp + 248]      # 8-byte Reload
	add	rax, r14
	mov	r11, qword ptr [rsp + 256]      # 8-byte Reload
	adc	rbp, r11
	add	rax, qword ptr [rsp + 168]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 192]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 152]      # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 160]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp + 88]       # 8-byte Folded Reload
	add	rax, r12
	adc	rbp, 0
	shld	r15, r8, 8
	and	r8, r10
	add	rbx, rdx
	adc	rcx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	rbx, r14
	adc	rcx, r11
	add	rbx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	rbx, r15
	adc	rcx, 0
	shld	rbp, rax, 8
	and	rax, r10
	mov	r14, qword ptr [rsp + 296]      # 8-byte Reload
	add	r14, qword ptr [rsp + 368]      # 8-byte Folded Reload
	mov	rsi, qword ptr [rsp + 144]      # 8-byte Reload
	adc	rsi, qword ptr [rsp + 376]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp - 64]       # 8-byte Reload
	lea	rdx, [r11 + r11]
	add	rdx, r14
	adc	r13, rsi
	mov	r12, qword ptr [rsp + 352]      # 8-byte Reload
	add	rdx, r12
	mov	r15, qword ptr [rsp + 360]      # 8-byte Reload
	adc	r13, r15
	add	rdx, qword ptr [rsp + 336]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 344]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 320]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 328]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 280]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 288]      # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 184]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 208]      # 8-byte Folded Reload
	add	rdx, rbp
	adc	r13, 0
	shld	rcx, rbx, 8
	and	rbx, r10
	add	r14, r11
	adc	rsi, qword ptr [rsp - 56]       # 8-byte Folded Reload
	add	r14, r12
	adc	rsi, r15
	add	r14, qword ptr [rsp + 264]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 272]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp + 200]      # 8-byte Folded Reload
	add	r14, rcx
	mov	rcx, r14
	adc	rsi, 0
	shld	r13, rdx, 8
	add	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	shld	rsi, r14, 8
	add	rsi, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r11, rsi
	shr	r11, 56
	add	r11, r9
	mov	r9, r13
	shr	r9, 56
	add	r8, r9
	add	r11, r9
	mov	r9, r11
	shr	r9, 56
	add	r9, rax
	mov	rax, r8
	shr	rax, 56
	add	rax, rbx
	and	rdx, r10
	and	rcx, r10
	and	r13, r10
	and	rsi, r10
	and	r11, r10
	and	r8, r10
	mov	qword ptr [rdi], r8
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], rcx
	mov	qword ptr [rdi + 24], rsi
	mov	qword ptr [rdi + 32], r11
	mov	qword ptr [rdi + 40], r9
	mov	qword ptr [rdi + 48], rdx
	mov	qword ptr [rdi + 56], r13
	add	rsp, 384
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

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
	sub	rsp, 392
	.cfi_def_cfa_offset 448
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	rax, qword ptr [rsi + 56]
	lea	rbx, [rax + rax]
	mov	r8, qword ptr [rsi + 48]
	lea	r9, [r8 + r8]
	mul	rax
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rax, r8
	mul	rbx
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	mov	rcx, qword ptr [rsi + 40]
	mov	rax, r8
	mul	r8
	mov	qword ptr [rsp + 264], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 256], rax      # 8-byte Spill
	mov	rax, rcx
	mul	rbx
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 232], rax      # 8-byte Spill
	mov	rax, rcx
	mov	r8, r9
	mul	r9
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 144], rax      # 8-byte Spill
	mov	rax, rcx
	mul	rcx
	mov	qword ptr [rsp + 376], rax      # 8-byte Spill
	mov	qword ptr [rsp + 384], rdx      # 8-byte Spill
	mov	r9, qword ptr [rsi + 32]
	mov	rax, r9
	mul	rbx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	r14, rdx
	lea	r12, [rcx + rcx]
	mov	rax, r9
	mul	r8
	mov	rcx, r8
	mov	r15, rdx
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	mov	rax, r9
	mul	r12
	mov	qword ptr [rsp + 328], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 312], rax      # 8-byte Spill
	mov	rax, r9
	mul	r9
	mov	qword ptr [rsp + 176], rax      # 8-byte Spill
	mov	qword ptr [rsp + 184], rdx      # 8-byte Spill
	mov	r8, qword ptr [rsi + 24]
	mov	rax, r8
	mul	rbx
	mov	qword ptr [rsp + 368], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 360], rax      # 8-byte Spill
	mov	rax, r8
	mul	rcx
	mov	qword ptr [rsp + 304], rax      # 8-byte Spill
	mov	qword ptr [rsp + 136], rdx      # 8-byte Spill
	lea	rbp, [r9 + r9]
	mov	rax, r8
	mul	r12
	mov	r13, rdx
	mov	r10, rax
	mov	rax, r8
	mul	rbp
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mov	rax, r8
	mul	r8
	mov	qword ptr [rsp + 344], rax      # 8-byte Spill
	mov	qword ptr [rsp + 352], rdx      # 8-byte Spill
	mov	r9, qword ptr [rsi + 16]
	mov	rax, r9
	mul	rbx
	mov	qword ptr [rsp + 248], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 240], rax      # 8-byte Spill
	mov	rax, r9
	mul	rcx
	mov	r11, rcx
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	qword ptr [rsp + 120], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 112], rax      # 8-byte Spill
	mov	rax, r9
	mul	r12
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	qword ptr [rsp + 16], rdx       # 8-byte Spill
	lea	rcx, [r8 + r8]
	mov	rax, r9
	mul	rbp
	mov	qword ptr [rsp + 336], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 320], rax      # 8-byte Spill
	mov	rax, r9
	mul	rcx
	mov	qword ptr [rsp + 224], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 216], rax      # 8-byte Spill
	mov	rax, r9
	mul	r9
	mov	qword ptr [rsp + 72], rax       # 8-byte Spill
	mov	qword ptr [rsp + 88], rdx       # 8-byte Spill
	mov	r8, qword ptr [rsi + 8]
	mov	rax, r8
	mul	rbx
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 32], rax       # 8-byte Spill
	mov	rax, r8
	mul	r11
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rax, r8
	mul	r12
	mov	qword ptr [rsp + 288], rax      # 8-byte Spill
	mov	qword ptr [rsp + 296], rdx      # 8-byte Spill
	lea	r11, [r9 + r9]
	mov	rax, r8
	mul	rbp
	mov	qword ptr [rsp + 168], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	mov	rax, r8
	mul	rcx
	mov	r9, rcx
	mov	qword ptr [rsp + 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	rax, r8
	mul	r11
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rcx, rdx
	mov	rsi, qword ptr [rsi]
	mov	rax, r8
	mul	r8
	mov	qword ptr [rsp + 280], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 272], rax      # 8-byte Spill
	mov	rax, rsi
	mul	rbx
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rax, rsi
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 208], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r12
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	rax, rsi
	mul	rbp
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, rsi
	mul	r9
	mov	r9, rax
	mov	rbx, rdx
	add	r8, r8
	mov	rax, rsi
	mul	r11
	mov	qword ptr [rsp + 200], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 192], rax      # 8-byte Spill
	mov	rax, rsi
	mul	r8
	mov	qword ptr [rsp + 80], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	mov	rax, rsi
	mul	rsi
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	r8, qword ptr [rsp - 120]       # 8-byte Reload
	add	r8, qword ptr [rsp + 144]       # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 160]      # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	add	rax, r8
	adc	rcx, r14
	add	rax, r9
	adc	rcx, rbx
	shld	rcx, rax, 8
	movabs	rdx, 72057594037927935
	and	rax, rdx
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	r9, rdx
	add	r8, qword ptr [rsp + 40]        # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 64]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp + 8]         # 8-byte Folded Reload
	adc	r14, qword ptr [rsp + 16]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	mov	rsi, r8
	adc	r14, qword ptr [rsp - 56]       # 8-byte Folded Reload
	mov	r8, qword ptr [rsp - 72]        # 8-byte Reload
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	shld	r8, rdx, 1
	mov	r12, qword ptr [rsp - 88]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	shld	r12, rax, 1
	mov	rax, qword ptr [rsp + 232]      # 8-byte Reload
	add	rax, qword ptr [rsp + 256]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp - 104]      # 8-byte Reload
	adc	r11, qword ptr [rsp + 264]      # 8-byte Folded Reload
	mov	qword ptr [rsp - 104], r11      # 8-byte Spill
	shld	r14, rsi, 8
	shld	r11, rax, 1
	and	rsi, r9
	mov	qword ptr [rsp - 120], rsi      # 8-byte Spill
	add	r10, qword ptr [rsp + 176]      # 8-byte Folded Reload
	adc	r13, qword ptr [rsp + 184]      # 8-byte Folded Reload
	lea	r9, [rax + rax]
	add	r9, r10
	adc	r11, r13
	mov	rdx, qword ptr [rsp + 112]      # 8-byte Reload
	add	r9, rdx
	mov	rsi, qword ptr [rsp + 120]      # 8-byte Reload
	adc	r11, rsi
	add	r9, qword ptr [rsp + 72]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 88]       # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp + 32]       # 8-byte Reload
	add	r9, rbp
	mov	rbx, qword ptr [rsp + 56]       # 8-byte Reload
	adc	r11, rbx
	add	r9, qword ptr [rsp]             # 8-byte Folded Reload
	adc	r11, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 48]        # 8-byte Folded Reload
	adc	r11, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r9, rcx
	adc	r11, 0
	add	r9, r14
	adc	r11, 0
	shld	r11, r9, 8
	movabs	rcx, 72057594037927935
	and	r9, rcx
	add	r10, rax
	adc	r13, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	r10, rdx
	adc	r13, rsi
	add	r10, rbp
	adc	r13, rbx
	add	r10, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r10, r14
	adc	r13, 0
	mov	r14, qword ptr [rsp + 304]      # 8-byte Reload
	add	r14, qword ptr [rsp + 312]      # 8-byte Folded Reload
	mov	rbx, qword ptr [rsp + 136]      # 8-byte Reload
	adc	rbx, qword ptr [rsp + 328]      # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 240]      # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 248]      # 8-byte Folded Reload
	mov	rbp, qword ptr [rsp - 96]       # 8-byte Reload
	lea	rax, [2*rbp]
	add	rax, r14
	adc	r12, rbx
	add	rax, qword ptr [rsp + 216]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 224]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 152]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 168]      # 8-byte Folded Reload
	add	rax, qword ptr [rsp + 96]       # 8-byte Folded Reload
	adc	r12, qword ptr [rsp + 104]      # 8-byte Folded Reload
	add	rax, r11
	adc	r12, 0
	shld	r13, r10, 8
	mov	rsi, rcx
	and	r10, rcx
	add	r14, rbp
	adc	rbx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp + 80]       # 8-byte Folded Reload
	add	r14, r13
	adc	rbx, 0
	shld	r12, rax, 8
	and	rax, rcx
	mov	rcx, qword ptr [rsp + 128]      # 8-byte Reload
	add	rcx, qword ptr [rsp + 376]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 384]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 360]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 368]      # 8-byte Folded Reload
	mov	r11, qword ptr [rsp - 80]       # 8-byte Reload
	lea	rdx, [r11 + r11]
	add	rdx, rcx
	adc	r8, r15
	add	rdx, qword ptr [rsp + 344]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 352]       # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 320]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 336]       # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 288]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 296]       # 8-byte Folded Reload
	add	rdx, qword ptr [rsp + 208]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 128]       # 8-byte Folded Reload
	add	rdx, r12
	adc	r8, 0
	shld	rbx, r14, 8
	and	r14, rsi
	add	rcx, r11
	adc	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 272]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 280]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 192]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp + 200]      # 8-byte Folded Reload
	add	rcx, rbx
	adc	r15, 0
	shld	r8, rdx, 8
	add	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	shld	r15, rcx, 8
	add	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	r11, r15
	shr	r11, 56
	add	r11, r9
	mov	r9, r8
	shr	r9, 56
	add	r10, r9
	add	r11, r9
	mov	r9, r11
	shr	r9, 56
	add	r9, rax
	mov	rax, r10
	shr	rax, 56
	add	rax, r14
	and	rdx, rsi
	and	rcx, rsi
	and	r8, rsi
	and	r15, rsi
	and	r11, rsi
	and	r10, rsi
	mov	qword ptr [rdi], r10
	mov	qword ptr [rdi + 8], rax
	mov	qword ptr [rdi + 16], rcx
	mov	qword ptr [rdi + 24], r15
	mov	qword ptr [rdi + 32], r11
	mov	qword ptr [rdi + 40], r9
	mov	qword ptr [rdi + 48], rdx
	mov	qword ptr [rdi + 56], r8
	add	rsp, 392
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

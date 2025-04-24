	.text
	.intel_syntax noprefix
	.file	"field_5x52.25cc2e35debd5488-cgu.0"
	.globl	rust_ec_secp256k1_mul_inner                       # -- Begin function mul_inner
	.p2align	4, 0x90
	.type	rust_ec_secp256k1_mul_inner,@function
rust_ec_secp256k1_mul_inner:                              # @mul_inner
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
	mov	rcx, rdx
	mov	rbp, qword ptr [rsi]
	mov	r10, qword ptr [rsi + 8]
	mov	qword ptr [rsp - 56], r10       # 8-byte Spill
	mov	rbx, qword ptr [rsi + 16]
	mov	r11, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 64], r11       # 8-byte Spill
	mov	rsi, qword ptr [rsi + 32]
	mov	r9, qword ptr [rdx + 8]
	mov	qword ptr [rsp - 96], r9        # 8-byte Spill
	mov	rax, qword ptr [rdx + 24]
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mul	rbp
	mov	qword ptr [rsp - 88], rbp       # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rax, qword ptr [rcx + 16]
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mul	r10
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	r10, rax
	mov	rax, r9
	mul	rbx
	mov	qword ptr [rsp - 24], rbx       # 8-byte Spill
	mov	r13, rax
	mov	r12, rdx
	mov	rax, qword ptr [rcx]
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	r8, qword ptr [rcx + 32]
	mul	r11
	mov	r14, rdx
	mov	rcx, rax
	mov	rax, r8
	mov	qword ptr [rsp - 32], r8        # 8-byte Spill
	mul	rsi
	mov	r9, rsi
	mov	qword ptr [rsp - 40], rsi       # 8-byte Spill
	mov	r15, rax
	mov	rsi, rdx
	movabs	rdx, 4503599627370495
	and	rax, rdx
	movabs	rdx, 68719492368
	mul	rdx
	add	rcx, r13
	adc	r14, r12
	add	rcx, r10
	adc	r14, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r14, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rcx, rax
	adc	r14, rdx
	shld	rsi, r15, 12
	shld	r14, rcx, 12
	mov	rax, r8
	mul	rbp
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mov	r10, qword ptr [rsp - 56]       # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	r13, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rax, r13
	mul	rbx
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rbp, rax
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rbx, qword ptr [rsp - 64]       # 8-byte Reload
	mul	rbx
	mov	r11, rdx
	mov	r8, rax
	mov	r12, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rax, r12
	mul	r9
	mov	r15, rdx
	mov	r9, rax
	mov	rax, rsi
	movabs	rdx, 68719492368
	mul	rdx
	add	r9, r8
	adc	r15, r11
	add	r9, rbp
	adc	r15, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 8]         # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 120]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r9, rax
	adc	r15, rdx
	add	r9, r14
	adc	r15, 0
	shld	r15, r9, 12
	mov	r14, r9
	shr	r14, 48
	mov	rax, r12
	mov	r12, qword ptr [rsp - 88]       # 8-byte Reload
	mul	r12
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 32]       # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rsi, rax
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mov	rbp, qword ptr [rsp - 24]       # 8-byte Reload
	mul	rbp
	mov	r10, rax
	mov	r11, rdx
	and	r14d, 15
	mov	rax, r13
	mul	rbx
	mov	r13, rdx
	mov	rbx, rax
	mov	r8, qword ptr [rsp - 96]        # 8-byte Reload
	mov	rax, r8
	mul	qword ptr [rsp - 40]            # 8-byte Folded Reload
	add	rax, rbx
	adc	r13, rdx
	add	rax, r10
	adc	r13, r11
	add	rax, rsi
	adc	r13, qword ptr [rsp - 104]      # 8-byte Folded Reload
	add	rax, r15
	adc	r13, 0
	shld	r13, rax, 12
	shl	rax, 4
	movabs	rdx, 72057594037927920
	and	rax, rdx
	or	rax, r14
	movabs	rdx, 4294968273
	mul	rdx
	mov	rsi, rdx
	mov	r14, rax
	add	r14, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 112]      # 8-byte Folded Reload
	shld	rsi, r14, 12
	mov	rax, r8
	mul	r12
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mul	qword ptr [rsp - 56]            # 8-byte Folded Reload
	mov	r12, rdx
	mov	r15, rax
	mov	rax, qword ptr [rsp - 32]       # 8-byte Reload
	mul	rbp
	mov	r11, rax
	mov	rbx, rdx
	movabs	rax, 4503599627370495
	and	r14, rax
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mul	qword ptr [rsp - 64]            # 8-byte Folded Reload
	mov	rbp, rdx
	mov	r8, rax
	mov	r10, qword ptr [rsp - 80]       # 8-byte Reload
	mov	rax, r10
	mul	qword ptr [rsp - 40]            # 8-byte Folded Reload
	add	rax, r8
	adc	rbp, rdx
	add	rax, r11
	adc	rbp, rbx
	add	rax, r13
	adc	rbp, 0
	shld	rbp, rax, 12
	movabs	rbx, 4503599627370495
	and	rax, rbx
	movabs	rdx, 68719492368
	mul	rdx
	add	r15, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r12, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r15, rax
	adc	r12, rdx
	add	r15, rsi
	adc	r12, 0
	shld	r12, r15, 12
	mov	rax, r10
	mul	qword ptr [rsp - 88]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mul	qword ptr [rsp - 56]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	r11, rax
	mov	rax, qword ptr [rsp - 48]       # 8-byte Reload
	mul	qword ptr [rsp - 24]            # 8-byte Folded Reload
	mov	r8, rax
	mov	rsi, rdx
	and	r15, rbx
	mov	rax, qword ptr [rsp - 32]       # 8-byte Reload
	mul	qword ptr [rsp - 64]            # 8-byte Folded Reload
	mov	r10, rdx
	mov	rbx, rax
	mov	rax, qword ptr [rsp - 72]       # 8-byte Reload
	mul	qword ptr [rsp - 40]            # 8-byte Folded Reload
	mov	r13, rax
	add	r13, rbx
	adc	r10, rdx
	add	r13, rbp
	adc	r10, 0
	mov	rax, r13
	movabs	rbp, 4503599627370495
	and	rax, rbp
	movabs	rbx, 68719492368
	mul	rbx
	add	r8, r11
	adc	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 88]        # 8-byte Folded Reload
	adc	rsi, qword ptr [rsp - 80]       # 8-byte Folded Reload
	add	r8, rax
	adc	rsi, rdx
	add	r8, r12
	adc	rsi, 0
	shld	r10, r13, 12
	shld	rsi, r8, 12
	mov	r11, rbp
	and	r8, rbp
	mov	rax, r10
	mul	rbx
	and	rcx, rbp
	add	rcx, rax
	adc	rdx, 0
	mov	rax, rdi
	add	rcx, rsi
	adc	rdx, 0
	and	r11, rcx
	shld	rdx, rcx, 12
	movabs	rcx, 281474976710655
	and	rcx, r9
	add	rcx, rdx
	mov	qword ptr [rdi], r14
	mov	qword ptr [rdi + 8], r15
	mov	qword ptr [rdi + 16], r8
	mov	qword ptr [rdi + 24], r11
	mov	qword ptr [rdi + 32], rcx
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
	.size	mul_inner, .Lfunc_end0-mul_inner
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.83.0 (90b35a623 2024-11-26)"
	.section	".note.GNU-stack","",@progbits

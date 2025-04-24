	.text
	.intel_syntax noprefix
	.file	"rust_fiat_secp256k1_dettman_mul.cb2a630e2e0eec4e-cgu.0"
	.globl	rust_fiat_secp256k1_dettman_mul # -- Begin function rust_fiat_secp256k1_dettman_mul
	.p2align	4, 0x90
	.type	rust_fiat_secp256k1_dettman_mul,@function
rust_fiat_secp256k1_dettman_mul:        # @rust_fiat_secp256k1_dettman_mul
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
	mov	r11, rdx
	mov	rcx, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	mov	rax, qword ptr [rdx + 32]
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mul	rcx
	mov	r8, rax
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	rax, qword ptr [r11 + 24]
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	r9, qword ptr [rsi]
	mov	r15, qword ptr [rsi + 8]
	mul	r9
	mov	qword ptr [rsp - 32], r9        # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	rax, qword ptr [r11 + 16]
	mov	r12, rax
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mul	r15
	mov	r10, rax
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rcx, qword ptr [r11]
	mov	rax, qword ptr [r11 + 8]
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	r11, qword ptr [rsi + 16]
	mul	r11
	mov	qword ptr [rsp - 48], r11       # 8-byte Spill
	mov	rbx, rax
	mov	r13, rdx
	mov	rdx, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	rax, rcx
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mul	rdx
	mov	rsi, rax
	mov	r14, rdx
	movabs	rdx, 68719492368
	mov	rax, r8
	mul	rdx
	mov	rbp, rdx
	mov	r8, rax
	add	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	r8, r10
	adc	rbp, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r8, rbx
	adc	rbp, r13
	add	r8, rsi
	adc	rbp, r14
	shld	rbp, r8, 12
	mov	rax, r9
	mov	r9, qword ptr [rsp - 80]        # 8-byte Reload
	mul	r9
	mov	r13, rdx
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rax, r15
	mov	qword ptr [rsp], r15            # 8-byte Spill
	mov	r10, qword ptr [rsp - 88]       # 8-byte Reload
	mul	r10
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	rax, r11
	mul	r12
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	r11, qword ptr [rsp - 96]       # 8-byte Reload
	mov	rax, r11
	mov	r14, qword ptr [rsp - 40]       # 8-byte Reload
	mul	r14
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rbx, rax
	mov	rax, rcx
	mul	qword ptr [rsp - 72]            # 8-byte Folded Reload
	mov	rsi, rax
	mov	r12, rdx
	movabs	rax, 4503599627370495
	and	r8, rax
	movabs	rcx, 281475040739328
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	rcx
	mov	rcx, rax
	add	rcx, qword ptr [rsp - 120]      # 8-byte Folded Reload
	adc	r13, rdx
	add	rcx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 112]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	rcx, rbx
	adc	r13, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	rcx, rsi
	adc	r13, r12
	add	rcx, rbp
	adc	r13, 0
	shld	r13, rcx, 12
	mov	rax, r15
	mul	r9
	mov	rsi, rdx
	mov	r9, rax
	mov	r12, qword ptr [rsp - 48]       # 8-byte Reload
	mov	rax, r12
	mul	r10
	mov	rbp, rdx
	mov	r10, rax
	mov	rax, r11
	mul	qword ptr [rsp - 56]            # 8-byte Folded Reload
	mov	r11, rdx
	mov	rbx, rax
	mov	rax, r14
	mov	r15, qword ptr [rsp - 72]       # 8-byte Reload
	mul	r15
	add	r10, r9
	adc	rbp, rsi
	add	rax, r10
	adc	rbp, rdx
	add	rax, rbx
	adc	rbp, r11
	add	rax, r13
	adc	rbp, 0
	shld	rbp, rax, 12
	shl	rax, 4
	movabs	rsi, 72057594037927920
	and	rsi, rax
	mov	r9, rcx
	shr	r9, 48
	and	r9d, 15
	mov	rax, qword ptr [rsp - 64]       # 8-byte Reload
	mov	r14, qword ptr [rsp - 32]       # 8-byte Reload
	mul	r14
	mov	r10, rax
	mov	r11, rdx
	or	rsi, r9
	movabs	rdx, 4294968273
	mov	rax, rsi
	mul	rdx
	mov	r13, rax
	mov	r9, rdx
	movabs	rax, 281474976710655
	and	rax, rcx
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	add	r13, r10
	adc	r9, r11
	shld	r9, r13, 12
	mov	rax, r12
	mul	qword ptr [rsp - 80]            # 8-byte Folded Reload
	mov	r10, rax
	mov	rsi, rdx
	movabs	rax, 4503599627370495
	and	r13, rax
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mul	qword ptr [rsp - 88]            # 8-byte Folded Reload
	mov	r11, rdx
	mov	rbx, rax
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mul	r15
	mov	rcx, rax
	add	rcx, r10
	adc	rsi, rdx
	add	rcx, rbx
	adc	rsi, r11
	add	rcx, rbp
	adc	rsi, 0
	shld	rsi, rcx, 12
	mov	r12, qword ptr [rsp - 40]       # 8-byte Reload
	mov	rax, r12
	mul	r14
	mov	r10, rdx
	mov	r11, rax
	mov	rax, qword ptr [rsp - 64]       # 8-byte Reload
	mov	r15, qword ptr [rsp]            # 8-byte Reload
	mul	r15
	mov	rbx, rdx
	mov	r14, rax
	add	r14, r11
	adc	rbx, r10
	movabs	r10, 4503599627370495
	and	rcx, r10
	mov	rax, rcx
	movabs	rcx, 68719492368
	mul	rcx
	mov	rbp, rdx
	mov	rcx, rax
	add	rcx, r14
	adc	rbp, rbx
	add	rcx, r9
	adc	rbp, 0
	shld	rbp, rcx, 12
	and	rcx, r10
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	mul	qword ptr [rsp - 80]            # 8-byte Folded Reload
	mov	r9, rdx
	mov	r10, rax
	mov	rax, qword ptr [rsp - 88]       # 8-byte Reload
	mul	qword ptr [rsp - 72]            # 8-byte Folded Reload
	mov	rbx, rax
	add	rbx, r10
	adc	r9, rdx
	add	rbx, rsi
	adc	r9, 0
	mov	rax, qword ptr [rsp - 56]       # 8-byte Reload
	mul	qword ptr [rsp - 32]            # 8-byte Folded Reload
	mov	r10, rdx
	mov	r14, rax
	mov	rax, r12
	mul	r15
	mov	r11, rdx
	mov	rsi, rax
	mov	rax, qword ptr [rsp - 64]       # 8-byte Reload
	mul	qword ptr [rsp - 48]            # 8-byte Folded Reload
	mov	r15, rdx
	mov	r12, rax
	mov	rax, rbx
	movabs	rdx, 68719492368
	mul	rdx
	add	rsi, r14
	adc	r11, r10
	add	rsi, r12
	adc	r11, r15
	add	rsi, rax
	adc	r11, rdx
	add	rsi, rbp
	adc	r11, 0
	shld	r11, rsi, 12
	add	r11, r8
	mov	rax, r9
	movabs	rdx, 281475040739328
	mul	rdx
	movabs	r8, 4503599627370495
	and	rsi, r8
	add	rax, r11
	adc	rdx, 0
	shld	rdx, rax, 12
	add	rdx, qword ptr [rsp - 104]      # 8-byte Folded Reload
	and	rax, r8
	mov	qword ptr [rdi], r13
	mov	qword ptr [rdi + 8], rcx
	mov	qword ptr [rdi + 16], rsi
	mov	qword ptr [rdi + 24], rax
	mov	qword ptr [rdi + 32], rdx
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
	.size	rust_fiat_secp256k1_dettman_mul, .Lfunc_end0-rust_fiat_secp256k1_dettman_mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"
	.section	".note.GNU-stack","",@progbits

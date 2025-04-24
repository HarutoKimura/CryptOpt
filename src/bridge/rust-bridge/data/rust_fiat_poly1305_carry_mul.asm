	.text
	.intel_syntax noprefix
	.file	"rust_fiat_poly1305_mul.f25a2bbeb74a0682-cgu.0"
	.globl	rust_fiat_poly1305_carry_mul    # -- Begin function rust_fiat_poly1305_carry_mul
	.p2align	4, 0x90
	.type	rust_fiat_poly1305_carry_mul,@function
rust_fiat_poly1305_carry_mul:           # @rust_fiat_poly1305_carry_mul
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
	mov	r8, rdx
	mov	r10, qword ptr [rsi + 16]
	mov	r15, qword ptr [rdx + 16]
	lea	rax, [r15 + 4*r15]
	mul	r10
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	r13, qword ptr [r8 + 8]
	lea	r11, [2*r13]
	lea	rax, [r11 + 4*r11]
	mul	r10
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	r9, qword ptr [rsi + 8]
	lea	rax, [r15 + r15]
	lea	rcx, [rax + 4*rax]
	mov	rax, r9
	mul	rcx
	mov	rcx, rax
	mov	rbx, rdx
	mov	r12, qword ptr [r8]
	mov	rax, r12
	mul	r10
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, r9
	mul	r11
	mov	r10, rdx
	mov	r14, rax
	mov	rax, r12
	mul	r9
	mov	r11, rax
	mov	r9, rdx
	mov	rbp, qword ptr [rsi]
	mov	rax, rbp
	mul	r15
	mov	r8, rdx
	mov	rsi, rax
	mov	rax, rbp
	mul	r13
	mov	r13, rdx
	mov	r15, rax
	mov	rax, rbp
	mul	r12
	add	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rcx, rax
	adc	rbx, rdx
	shld	rbx, rcx, 20
	movabs	rax, 17592186044415
	and	rcx, rax
	add	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r14, rsi
	adc	r10, r8
	add	r11, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 8]         # 8-byte Folded Reload
	add	r11, r15
	adc	r9, r13
	add	r11, rbx
	adc	r9, 0
	shld	r9, r11, 21
	movabs	rdx, 8796093022207
	and	r11, rdx
	add	r9, r14
	adc	r10, 0
	shld	r10, r9, 21
	lea	rsi, [r10 + 4*r10]
	add	rsi, rcx
	mov	rcx, rsi
	shr	rcx, 44
	add	rcx, r11
	and	r9, rdx
	and	rsi, rax
	mov	rax, rcx
	shr	rax, 43
	add	rax, r9
	and	rcx, rdx
	mov	qword ptr [rdi], rsi
	mov	qword ptr [rdi + 8], rcx
	mov	qword ptr [rdi + 16], rax
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
	.size	rust_fiat_poly1305_carry_mul, .Lfunc_end0-rust_fiat_poly1305_carry_mul
	.cfi_endproc
                                        # -- End function
	.ident	"rustc version 1.75.0 (82e1608df 2023-12-21) (built from a source tarball)"
	.section	".note.GNU-stack","",@progbits

	.text
	.intel_syntax noprefix
	.file	"openssl_p448_mul.c"
	.globl	openssl_p448_mul                # -- Begin function openssl_p448_mul
	.p2align	4, 0x90
	.type	openssl_p448_mul,@function
openssl_p448_mul:                       # @openssl_p448_mul
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
	sub	rsp, 208
	.cfi_def_cfa_offset 264
	.cfi_offset rbx, -56
	.cfi_offset r12, -48
	.cfi_offset r13, -40
	.cfi_offset r14, -32
	.cfi_offset r15, -24
	.cfi_offset rbp, -16
	mov	r8, rdx
	mov	rcx, qword ptr [rdx + 8]
	mov	qword ptr [rsp + 168], rcx      # 8-byte Spill
	mov	r9, qword ptr [rsi + 48]
	mov	rax, qword ptr [rdx + 16]
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	rdx, qword ptr [rdx + 48]
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	lea	rax, [rdx + rax]
	mov	rbx, qword ptr [rsi + 56]
	mov	r14, qword ptr [r8 + 40]
	lea	rdx, [r14 + rcx]
	mov	r11, rdx
	mov	qword ptr [rsp + 48], rdx       # 8-byte Spill
	mulx	rcx, rdx, rbx
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 8], rcx        # 8-byte Spill
	mov	r10, rbx
	mov	qword ptr [rsp + 24], rbx       # 8-byte Spill
	mov	rcx, rax
	mov	qword ptr [rsp + 40], rax       # 8-byte Spill
	mov	rdx, rax
	mulx	rax, rdx, r9
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	qword ptr [rsp + 16], r9        # 8-byte Spill
	mov	rax, qword ptr [r8 + 24]
	mov	qword ptr [rsp + 200], rax      # 8-byte Spill
	mov	r12, qword ptr [r8 + 56]
	lea	rax, [r12 + rax]
	mov	rdx, qword ptr [rsi + 40]
	mov	rbp, rdx
	mov	qword ptr [rsp + 8], rdx        # 8-byte Spill
	mulx	rdx, rbx, rax
	mov	qword ptr [rsp - 32], rbx       # 8-byte Spill
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	rbx, rax
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	rax, qword ptr [rsi + 32]
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rdx, qword ptr [r8 + 32]
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mulx	r15, rdx, rax
	mov	qword ptr [rsp + 160], rdx      # 8-byte Spill
	mov	rax, qword ptr [rsi + 24]
	lea	r10, [r10 + rax]
	mov	qword ptr [rsp + 80], r10       # 8-byte Spill
	mov	r13, rax
	mov	qword ptr [rsp + 128], rax      # 8-byte Spill
	lea	rdx, [r11 + r14]
	mov	qword ptr [rsp], r14            # 8-byte Spill
	mulx	rax, rdx, r10
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 72], rax       # 8-byte Spill
	mov	rax, qword ptr [rsi + 16]
	lea	r10, [r9 + rax]
	mov	qword ptr [rsp + 32], r10       # 8-byte Spill
	mov	r9, rax
	mov	qword ptr [rsp + 120], rax      # 8-byte Spill
	mov	r11, qword ptr [rsp - 80]       # 8-byte Reload
	lea	rdx, [rcx + r11]
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mulx	rax, rcx, r10
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rcx, qword ptr [rsi + 8]
	lea	r10, [rbx + r12]
	mov	qword ptr [rsp - 104], r10      # 8-byte Spill
	lea	rdx, [rcx + rbp]
	mov	qword ptr [rsp + 144], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 88], rcx       # 8-byte Spill
	mulx	rax, rdx, r10
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr [rsi]
	mov	r10, qword ptr [r8]
	mov	rdx, qword ptr [rsp - 88]       # 8-byte Reload
	lea	rsi, [rdx + rax]
	mov	qword ptr [rsp + 136], rsi      # 8-byte Spill
	mov	r8, rax
	mov	qword ptr [rsp + 152], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 96]       # 8-byte Reload
	lea	rdx, [rax + r10]
	mov	qword ptr [rsp + 104], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 112], r10      # 8-byte Spill
	mulx	rax, rbx, rsi
	mov	rdx, r14
	mulx	rsi, r14, r13
	mov	rdx, r11
	mulx	r13, rbp, r9
	mov	rdx, rcx
	mulx	r11, rcx, r12
	mov	r9, r12
	mov	qword ptr [rsp + 176], r12      # 8-byte Spill
	mov	rdx, r10
	mulx	rdx, r8, r8
	add	r8, rbp
	adc	rdx, r13
	add	r8, r14
	adc	rdx, rsi
	add	r8, rcx
	adc	rdx, r11
	add	rbx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp + 72]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rax, qword ptr [rsp - 48]       # 8-byte Folded Reload
	sub	rbx, r8
	mov	rsi, rbx
	mov	qword ptr [rsp + 72], rbx       # 8-byte Spill
	sbb	rax, rdx
	mov	rcx, qword ptr [rsp + 160]      # 8-byte Reload
	add	rcx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	rcx, r8
	mov	qword ptr [rsp + 160], rcx      # 8-byte Spill
	adc	r15, rdx
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	mulx	rdx, r8, qword ptr [rsp + 40]   # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], r8        # 8-byte Spill
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 96]       # 8-byte Reload
	mulx	rdx, r8, qword ptr [rsp + 16]   # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], r8        # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mulx	rdx, r8, qword ptr [rsp - 96]   # 8-byte Folded Reload
	mov	qword ptr [rsp - 120], r8       # 8-byte Spill
	mov	qword ptr [rsp - 8], rdx        # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	r13, r8, qword ptr [rsp - 88]   # 8-byte Folded Reload
	mov	r10, r15
	shld	r15, rcx, 8
	mov	rdx, qword ptr [rsp + 80]       # 8-byte Reload
	mulx	rcx, rdx, qword ptr [rsp - 112] # 8-byte Folded Reload
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rcx, rdx, qword ptr [rsp + 32]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 144]      # 8-byte Reload
	mulx	rcx, rdx, qword ptr [rsp + 104] # 8-byte Folded Reload
	mov	qword ptr [rsp - 56], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 40], rcx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rbx, rcx, qword ptr [rsp + 136] # 8-byte Folded Reload
	shr	r10, 56
	mov	qword ptr [rsp - 112], r10      # 8-byte Spill
	mov	r10, rax
	shld	rax, rsi, 8
	mov	rdx, qword ptr [rsp + 128]      # 8-byte Reload
	mulx	r12, r14, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mov	rdx, r9
	mulx	rbp, rsi, qword ptr [rsp + 120] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 88]       # 8-byte Reload
	mulx	rdx, r9, qword ptr [rsp + 112]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 168]      # 8-byte Reload
	mulx	rdx, r11, qword ptr [rsp + 152] # 8-byte Folded Reload
	shr	r10, 56
	add	r11, r14
	adc	rdx, r12
	add	r11, rsi
	adc	rdx, rbp
	add	r11, r9
	adc	rdx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 64]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rbx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	sub	rcx, r11
	sbb	rbx, rdx
	add	rcx, rax
	adc	rbx, r10
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 120]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 8]        # 8-byte Folded Reload
	add	r8, r11
	adc	r13, rdx
	add	r8, r15
	adc	r13, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	rsi, r13
	shld	r13, r8, 8
	mov	al, 56
	bzhi	rax, r8, rax
	mov	dl, 56
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	r14, rbx
	shld	rbx, rcx, 8
	bzhi	rax, rcx, rdx
	mov	qword ptr [rsp - 16], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 96]       # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 24]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 16]       # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp - 96]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 48], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp]       # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 80]       # 8-byte Reload
	mulx	r15, r8, qword ptr [rsp - 88]   # 8-byte Folded Reload
	shr	rsi, 56
	mov	qword ptr [rsp - 112], rsi      # 8-byte Spill
	mov	rdx, qword ptr [rsp - 104]      # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 80]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 32]       # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 104] # 8-byte Folded Reload
	mov	qword ptr [rsp + 56], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 64], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 144]      # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 48]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 40]       # 8-byte Reload
	mulx	r9, rcx, qword ptr [rsp + 136]  # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 176]      # 8-byte Reload
	mulx	rax, r11, qword ptr [rsp + 128] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 120]      # 8-byte Reload
	mulx	r12, rsi, qword ptr [rsp + 112] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 88]       # 8-byte Reload
	mulx	rdx, r10, qword ptr [rsp + 168] # 8-byte Folded Reload
	mov	qword ptr [rsp + 192], rdx      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 184]      # 8-byte Reload
	mulx	rdx, rbp, qword ptr [rsp + 152] # 8-byte Folded Reload
	shr	r14, 56
	add	rbp, rsi
	adc	rdx, r12
	add	rbp, r11
	adc	rdx, rax
	add	rbp, r10
	adc	rdx, qword ptr [rsp + 192]      # 8-byte Folded Reload
	add	rcx, qword ptr [rsp + 56]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 64]        # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 56]        # 8-byte Folded Reload
	sub	rcx, rbp
	sbb	r9, rdx
	add	rcx, rbx
	adc	r9, r14
	add	r8, qword ptr [rsp - 48]        # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 24]        # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	r8, qword ptr [rsp - 32]        # 8-byte Folded Reload
	adc	r15, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r8, rbp
	adc	r15, rdx
	add	r8, r13
	adc	r15, qword ptr [rsp - 112]      # 8-byte Folded Reload
	mov	rsi, r15
	shld	r15, r8, 8
	mov	al, 56
	bzhi	rdx, r8, rax
	mov	qword ptr [rsp - 104], rdx      # 8-byte Spill
	mov	r11, r9
	shld	r9, rcx, 8
	bzhi	rax, rcx, rax
	mov	qword ptr [rsp - 112], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp + 24]       # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp - 96]  # 8-byte Folded Reload
	mov	qword ptr [rsp - 128], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 120], rax      # 8-byte Spill
	mov	rdx, qword ptr [rsp]            # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 16]  # 8-byte Folded Reload
	mov	qword ptr [rsp], rcx            # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 8]        # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp - 80]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 16], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 176]      # 8-byte Reload
	mulx	r10, rbx, qword ptr [rsp - 88]  # 8-byte Folded Reload
	shr	rsi, 56
	mov	qword ptr [rsp - 80], rsi       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 80]       # 8-byte Reload
	mulx	rax, rsi, qword ptr [rsp + 104] # 8-byte Folded Reload
	mov	qword ptr [rsp + 8], rax        # 8-byte Spill
	mov	rdx, qword ptr [rsp + 48]       # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 32]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 32], rcx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 144]      # 8-byte Reload
	mulx	rax, rcx, qword ptr [rsp + 40]  # 8-byte Folded Reload
	mov	qword ptr [rsp + 40], rcx       # 8-byte Spill
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	rdx, qword ptr [rsp + 96]       # 8-byte Reload
	mulx	rcx, r12, qword ptr [rsp + 136] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 128]      # 8-byte Reload
	mulx	r13, rax, qword ptr [rsp + 112] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 120]      # 8-byte Reload
	mulx	r8, rbp, qword ptr [rsp + 168]  # 8-byte Folded Reload
	shr	r11, 56
	add	rbp, rax
	adc	r8, r13
	mov	rdx, qword ptr [rsp + 88]       # 8-byte Reload
	mulx	rax, r13, qword ptr [rsp + 184] # 8-byte Folded Reload
	mov	rdx, qword ptr [rsp + 200]      # 8-byte Reload
	mulx	rdx, r14, qword ptr [rsp + 152] # 8-byte Folded Reload
	add	rbp, r14
	adc	r8, rdx
	add	rbp, r13
	adc	r8, rax
	add	r12, rsi
	adc	rcx, qword ptr [rsp + 8]        # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 32]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp + 48]       # 8-byte Folded Reload
	add	r12, qword ptr [rsp + 40]       # 8-byte Folded Reload
	adc	rcx, qword ptr [rsp - 88]       # 8-byte Folded Reload
	sub	r12, rbp
	sbb	rcx, r8
	add	r12, r9
	adc	rcx, r11
	add	rbx, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 120]      # 8-byte Folded Reload
	add	rbx, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r10, qword ptr [rsp + 24]       # 8-byte Folded Reload
	add	rbx, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	rbx, rbp
	adc	r10, r8
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mov	qword ptr [rdi + 16], rax
	add	rbx, r15
	adc	r10, qword ptr [rsp - 80]       # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	mov	qword ptr [rdi + 48], rax
	mov	rax, r10
	shld	r10, rbx, 8
	mov	r9b, 56
	bzhi	rsi, rbx, r9
	mov	rdx, rcx
	shld	rcx, r12, 8
	mov	qword ptr [rdi + 24], rsi
	bzhi	rsi, r12, r9
	shr	rax, 56
	shr	rdx, 56
	bzhi	r8, qword ptr [rsp + 72], r9    # 8-byte Folded Reload
	add	r8, r10
	adc	rax, 0
	mov	qword ptr [rdi + 56], rsi
	add	r8, rcx
	adc	rax, rdx
	bzhi	rsi, qword ptr [rsp + 160], r9  # 8-byte Folded Reload
	add	rsi, rcx
	adc	rdx, 0
	bzhi	rcx, r8, r9
	mov	qword ptr [rdi + 32], rcx
	bzhi	rcx, rsi, r9
	mov	qword ptr [rdi], rcx
	shld	rax, r8, 8
	shld	rdx, rsi, 8
	add	rax, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	rdx, qword ptr [rsp - 8]        # 8-byte Folded Reload
	mov	qword ptr [rdi + 40], rax
	mov	qword ptr [rdi + 8], rdx
	add	rsp, 208
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
	.size	openssl_p448_mul, .Lfunc_end0-openssl_p448_mul
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 19.1.0 (/home/runner/work/llvm-project/llvm-project/clang a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)"
	.section	".note.GNU-stack","",@progbits

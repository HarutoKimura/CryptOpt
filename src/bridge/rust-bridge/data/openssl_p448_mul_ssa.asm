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
	mov	rcx, rdx
	mov	rdx, qword ptr [rdx + 8]
	mov	qword ptr [rsp + 176], rdx      # 8-byte Spill
	mov	r10, qword ptr [rsi + 48]
	mov	rax, qword ptr [rcx + 16]
	mov	qword ptr [rsp + 184], rax      # 8-byte Spill
	mov	r9, qword ptr [rcx + 48]
	lea	r8, [r9 + rax]
	mov	r11, r9
	mov	rbx, qword ptr [rsi + 56]
	mov	r9, qword ptr [rcx + 40]
	lea	rax, [r9 + rdx]
	mov	r12, r9
	mov	r9, rax
	mov	qword ptr [rsp + 80], rax       # 8-byte Spill
	mul	rbx
	mov	qword ptr [rsp + 40], rbx       # 8-byte Spill
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 24], rax       # 8-byte Spill
	mov	rax, r8
	mov	qword ptr [rsp + 72], r8        # 8-byte Spill
	mul	r10
	mov	rbp, r10
	mov	qword ptr [rsp + 32], r10       # 8-byte Spill
	mov	qword ptr [rsp - 40], rax       # 8-byte Spill
	mov	qword ptr [rsp - 32], rdx       # 8-byte Spill
	mov	r10, qword ptr [rcx + 32]
	mov	qword ptr [rsp - 112], r10      # 8-byte Spill
	mov	rax, qword ptr [rcx]
	mov	qword ptr [rsp + 88], rax       # 8-byte Spill
	mov	rax, qword ptr [rcx + 24]
	mov	qword ptr [rsp + 200], rax      # 8-byte Spill
	mov	rcx, qword ptr [rcx + 56]
	mov	qword ptr [rsp + 120], rcx      # 8-byte Spill
	add	rcx, rax
	mov	r13, qword ptr [rsi + 40]
	mov	rax, r13
	mov	qword ptr [rsp + 8], r13        # 8-byte Spill
	mul	rcx
	mov	r15, rcx
	mov	qword ptr [rsp + 160], rcx      # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	r14, qword ptr [rsi + 32]
	mov	rax, r10
	mul	r14
	mov	qword ptr [rsp + 16], r14       # 8-byte Spill
	mov	qword ptr [rsp + 168], rax      # 8-byte Spill
	mov	r10, rdx
	mov	rax, qword ptr [rsi + 24]
	mov	qword ptr [rsp - 104], rax      # 8-byte Spill
	lea	rcx, [rbx + rax]
	mov	qword ptr [rsp + 64], rcx       # 8-byte Spill
	mov	rbx, r12
	mov	qword ptr [rsp - 8], r12        # 8-byte Spill
	lea	rax, [r9 + r12]
	mul	rcx
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	qword ptr [rsp + 112], rdx      # 8-byte Spill
	mov	rcx, qword ptr [rsi]
	mov	r9, qword ptr [rsi + 8]
	mov	rax, qword ptr [rsi + 16]
	lea	rdx, [rbp + rax]
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	mov	rbp, rax
	mov	qword ptr [rsp + 136], rax      # 8-byte Spill
	mov	qword ptr [rsp], r11            # 8-byte Spill
	lea	rax, [r8 + r11]
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mul	rdx
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	r12, qword ptr [rsp + 120]      # 8-byte Reload
	lea	rdx, [r15 + r12]
	mov	qword ptr [rsp - 120], rdx      # 8-byte Spill
	lea	rax, [r9 + r13]
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	mov	r8, r9
	mov	qword ptr [rsp + 144], r9       # 8-byte Spill
	mul	rdx
	mov	qword ptr [rsp - 96], rax       # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	lea	rdx, [r14 + rcx]
	mov	qword ptr [rsp + 128], rdx      # 8-byte Spill
	mov	qword ptr [rsp + 152], rcx      # 8-byte Spill
	mov	r14, qword ptr [rsp + 88]       # 8-byte Reload
	mov	rax, qword ptr [rsp - 112]      # 8-byte Reload
	add	rax, r14
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mul	rdx
	mov	r9, rdx
	mov	rsi, rax
	mov	rax, rbx
	mul	qword ptr [rsp - 104]           # 8-byte Folded Reload
	mov	rbx, rdx
	mov	r13, rax
	mov	rax, r11
	mul	rbp
	mov	r15, rdx
	mov	rbp, rax
	mov	rax, r8
	mul	r12
	mov	r8, rdx
	mov	r11, rax
	mov	rax, r14
	mul	rcx
	add	rax, rbp
	adc	rdx, r15
	add	rax, r13
	adc	rdx, rbx
	add	rax, r11
	adc	rdx, r8
	add	rsi, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 72]        # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 112]       # 8-byte Folded Reload
	add	rsi, qword ptr [rsp - 96]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp - 80]        # 8-byte Folded Reload
	sub	rsi, rax
	mov	r11, rsi
	mov	qword ptr [rsp + 112], rsi      # 8-byte Spill
	sbb	r9, rdx
	mov	rcx, qword ptr [rsp + 168]      # 8-byte Reload
	add	rcx, qword ptr [rsp - 40]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 32]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 24]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	rcx, rax
	mov	qword ptr [rsp + 168], rcx      # 8-byte Spill
	adc	r10, rdx
	mov	rax, qword ptr [rsp + 40]       # 8-byte Reload
	mul	qword ptr [rsp + 72]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 16], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	mul	qword ptr [rsp + 32]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 24], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 48], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	qword ptr [rsp - 112]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	mul	qword ptr [rsp + 16]            # 8-byte Folded Reload
	mov	r14, rax
	mov	rbp, rdx
	mov	rsi, r10
	shld	r10, rcx, 8
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	qword ptr [rsp - 128]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 72], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	mul	qword ptr [rsp + 56]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 88], rax       # 8-byte Spill
	mov	qword ptr [rsp - 80], rdx       # 8-byte Spill
	shr	rsi, 56
	mov	qword ptr [rsp - 128], rsi      # 8-byte Spill
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	qword ptr [rsp + 24]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp + 80]       # 8-byte Reload
	mul	qword ptr [rsp + 128]           # 8-byte Folded Reload
	mov	r15, rax
	mov	r8, rdx
	mov	rsi, r9
	shld	r9, r11, 8
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp]                 # 8-byte Folded Reload
	mov	qword ptr [rsp + 96], rdx       # 8-byte Spill
	mov	r13, rax
	mov	rax, r12
	mul	qword ptr [rsp + 136]           # 8-byte Folded Reload
	mov	r12, rax
	mov	r11, rdx
	shr	rsi, 56
	mov	rax, qword ptr [rsp + 144]      # 8-byte Reload
	mul	qword ptr [rsp + 88]            # 8-byte Folded Reload
	mov	rbx, rdx
	mov	rcx, rax
	mov	rax, qword ptr [rsp + 176]      # 8-byte Reload
	mul	qword ptr [rsp + 152]           # 8-byte Folded Reload
	add	rax, r13
	adc	rdx, qword ptr [rsp + 96]       # 8-byte Folded Reload
	add	rax, r12
	adc	rdx, r11
	add	rax, rcx
	adc	rdx, rbx
	add	r15, qword ptr [rsp - 72]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 64]        # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 88]       # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 80]        # 8-byte Folded Reload
	add	r15, qword ptr [rsp + 104]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 96]        # 8-byte Folded Reload
	sub	r15, rax
	sbb	r8, rdx
	add	r15, r9
	adc	r8, rsi
	add	r14, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 16]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 48]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	r14, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	rbp, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r14, rax
	adc	rbp, rdx
	add	r14, r10
	adc	rbp, qword ptr [rsp - 128]      # 8-byte Folded Reload
	mov	r9, rbp
	shld	rbp, r14, 8
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	mul	qword ptr [rsp + 40]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 32], rax       # 8-byte Spill
	mov	qword ptr [rsp - 128], rdx      # 8-byte Spill
	movabs	rax, 72057594037927935
	and	r14, rax
	mov	rsi, rax
	mov	qword ptr [rsp - 16], r14       # 8-byte Spill
	mov	rbx, r8
	shld	r8, r15, 8
	mov	rcx, r15
	mov	rax, qword ptr [rsp + 32]       # 8-byte Reload
	mul	qword ptr [rsp - 112]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 48], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 64], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	qword ptr [rsp - 8]             # 8-byte Folded Reload
	mov	qword ptr [rsp - 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 56], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp]            # 8-byte Reload
	mul	qword ptr [rsp + 16]            # 8-byte Folded Reload
	mov	r15, rax
	mov	r10, rdx
	and	rcx, rsi
	mov	qword ptr [rsp - 24], rcx       # 8-byte Spill
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	mul	qword ptr [rsp + 64]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 80], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 56]       # 8-byte Reload
	mul	qword ptr [rsp + 24]            # 8-byte Folded Reload
	mov	qword ptr [rsp - 96], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 96], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	qword ptr [rsp + 80]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 104], rax      # 8-byte Spill
	mov	qword ptr [rsp - 88], rdx       # 8-byte Spill
	shr	r9, 56
	mov	qword ptr [rsp - 120], r9       # 8-byte Spill
	mov	rax, qword ptr [rsp + 72]       # 8-byte Reload
	mul	qword ptr [rsp + 128]           # 8-byte Folded Reload
	mov	r13, rdx
	mov	r9, rax
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	qword ptr [rsp - 104]           # 8-byte Folded Reload
	mov	rcx, rdx
	mov	rsi, rax
	mov	rax, qword ptr [rsp + 136]      # 8-byte Reload
	mul	qword ptr [rsp + 88]            # 8-byte Folded Reload
	mov	r12, rax
	mov	r11, rdx
	shr	rbx, 56
	mov	qword ptr [rsp + 192], rbx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 144]      # 8-byte Reload
	mul	qword ptr [rsp + 176]           # 8-byte Folded Reload
	mov	r14, rdx
	mov	rbx, rax
	mov	rax, qword ptr [rsp + 184]      # 8-byte Reload
	mul	qword ptr [rsp + 152]           # 8-byte Folded Reload
	add	rax, r12
	adc	rdx, r11
	add	rax, rsi
	adc	rdx, rcx
	add	rax, rbx
	adc	rdx, r14
	add	r9, qword ptr [rsp + 96]        # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 96]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp - 80]        # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 72]       # 8-byte Folded Reload
	add	r9, qword ptr [rsp + 104]       # 8-byte Folded Reload
	adc	r13, qword ptr [rsp - 88]       # 8-byte Folded Reload
	sub	r9, rax
	sbb	r13, rdx
	add	r9, r8
	adc	r13, qword ptr [rsp + 192]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 64]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 48]       # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 32]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 128]      # 8-byte Folded Reload
	add	r15, qword ptr [rsp - 56]       # 8-byte Folded Reload
	adc	r10, qword ptr [rsp - 40]       # 8-byte Folded Reload
	add	r15, rax
	adc	r10, rdx
	add	r15, rbp
	adc	r10, qword ptr [rsp - 120]      # 8-byte Folded Reload
	mov	rsi, r10
	shld	r10, r15, 8
	movabs	rcx, 72057594037927935
	and	r15, rcx
	mov	qword ptr [rsp - 120], r15      # 8-byte Spill
	mov	rbx, r13
	shld	r13, r9, 8
	mov	rax, qword ptr [rsp + 40]       # 8-byte Reload
	mul	qword ptr [rsp - 112]           # 8-byte Folded Reload
	mov	qword ptr [rsp - 112], rdx      # 8-byte Spill
	mov	qword ptr [rsp - 128], rax      # 8-byte Spill
	mov	rax, qword ptr [rsp - 8]        # 8-byte Reload
	mul	qword ptr [rsp + 32]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 40], rdx       # 8-byte Spill
	mov	qword ptr [rsp - 8], rax        # 8-byte Spill
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mul	qword ptr [rsp]                 # 8-byte Folded Reload
	mov	qword ptr [rsp], rax            # 8-byte Spill
	mov	qword ptr [rsp + 32], rdx       # 8-byte Spill
	and	r9, rcx
	mov	qword ptr [rsp + 8], r9         # 8-byte Spill
	mov	rax, qword ptr [rsp + 120]      # 8-byte Reload
	mul	qword ptr [rsp + 16]            # 8-byte Folded Reload
	mov	r8, rdx
	mov	r11, rax
	mov	rax, qword ptr [rsp + 64]       # 8-byte Reload
	mul	qword ptr [rsp + 24]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 64], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 24], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 80]       # 8-byte Reload
	mul	qword ptr [rsp + 56]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 16], rax       # 8-byte Spill
	mov	qword ptr [rsp + 56], rdx       # 8-byte Spill
	shr	rsi, 56
	mov	qword ptr [rsp + 80], rsi       # 8-byte Spill
	mov	rax, qword ptr [rsp + 48]       # 8-byte Reload
	mul	qword ptr [rsp + 72]            # 8-byte Folded Reload
	mov	qword ptr [rsp + 72], rdx       # 8-byte Spill
	mov	qword ptr [rsp + 48], rax       # 8-byte Spill
	mov	rax, qword ptr [rsp + 160]      # 8-byte Reload
	mul	qword ptr [rsp + 128]           # 8-byte Folded Reload
	mov	r9, rdx
	mov	r14, rax
	mov	rax, qword ptr [rsp - 104]      # 8-byte Reload
	mul	qword ptr [rsp + 88]            # 8-byte Folded Reload
	mov	rcx, rax
	mov	rsi, rdx
	shr	rbx, 56
	mov	qword ptr [rsp - 104], rbx      # 8-byte Spill
	mov	rax, qword ptr [rsp + 136]      # 8-byte Reload
	mul	qword ptr [rsp + 176]           # 8-byte Folded Reload
	mov	r15, rdx
	mov	rbx, rax
	mov	rax, qword ptr [rsp + 144]      # 8-byte Reload
	mul	qword ptr [rsp + 184]           # 8-byte Folded Reload
	mov	rbp, rdx
	mov	r12, rax
	mov	rax, qword ptr [rsp + 200]      # 8-byte Reload
	mul	qword ptr [rsp + 152]           # 8-byte Folded Reload
	add	rbx, rcx
	adc	r15, rsi
	add	rbx, rax
	adc	r15, rdx
	add	rbx, r12
	adc	r15, rbp
	add	r14, qword ptr [rsp + 24]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 64]        # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 16]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 56]        # 8-byte Folded Reload
	add	r14, qword ptr [rsp + 48]       # 8-byte Folded Reload
	adc	r9, qword ptr [rsp + 72]        # 8-byte Folded Reload
	sub	r14, rbx
	sbb	r9, r15
	add	r14, r13
	adc	r9, qword ptr [rsp - 104]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 128]      # 8-byte Folded Reload
	adc	r8, qword ptr [rsp - 112]       # 8-byte Folded Reload
	add	r11, qword ptr [rsp - 8]        # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 40]        # 8-byte Folded Reload
	mov	rax, qword ptr [rsp - 120]      # 8-byte Reload
	mov	qword ptr [rdi + 16], rax
	add	r11, qword ptr [rsp]            # 8-byte Folded Reload
	adc	r8, qword ptr [rsp + 32]        # 8-byte Folded Reload
	mov	rax, qword ptr [rsp + 8]        # 8-byte Reload
	mov	qword ptr [rdi + 48], rax
	add	r11, rbx
	adc	r8, r15
	add	r11, r10
	adc	r8, qword ptr [rsp + 80]        # 8-byte Folded Reload
	mov	rax, r8
	shld	r8, r11, 8
	movabs	r10, 72057594037927935
	and	r11, r10
	mov	qword ptr [rdi + 24], r11
	mov	rcx, r9
	shld	r9, r14, 8
	and	r14, r10
	shr	rax, 56
	shr	rcx, 56
	mov	rdx, qword ptr [rsp + 112]      # 8-byte Reload
	and	rdx, r10
	add	rdx, r8
	adc	rax, 0
	mov	qword ptr [rdi + 56], r14
	add	rdx, r9
	adc	rax, rcx
	mov	rsi, qword ptr [rsp + 168]      # 8-byte Reload
	and	rsi, r10
	add	rsi, r9
	adc	rcx, 0
	shld	rax, rdx, 8
	and	rdx, r10
	mov	qword ptr [rdi + 32], rdx
	and	r10, rsi
	mov	qword ptr [rdi], r10
	shld	rcx, rsi, 8
	add	rax, qword ptr [rsp - 24]       # 8-byte Folded Reload
	add	rcx, qword ptr [rsp - 16]       # 8-byte Folded Reload
	mov	qword ptr [rdi + 40], rax
	mov	qword ptr [rdi + 8], rcx
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

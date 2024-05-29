	.text
	.file	"field.c"
	.globl	secp256k1_fe_mul_inner          # -- Begin function secp256k1_fe_mul_inner
	.p2align	4, 0x90
	.type	secp256k1_fe_mul_inner,@function
secp256k1_fe_mul_inner:                 # @secp256k1_fe_mul_inner
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$192, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -104(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -112(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -120(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -128(%rbp)
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -136(%rbp)
	movabsq	$4503599627370495, %rsi         # imm = 0xFFFFFFFFFFFFF
	movq	%rsi, -160(%rbp)                # 8-byte Spill
	movq	%rsi, -144(%rbp)
	movabsq	$68719492368, %rcx              # imm = 0x1000003D10
	movq	%rcx, -168(%rbp)                # 8-byte Spill
	movq	%rcx, -152(%rbp)
	movq	-104(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -312(%rbp)                # 8-byte Spill
	movq	24(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rax
	movq	-312(%rbp), %rdx                # 8-byte Reload
	movq	%rax, -320(%rbp)                # 8-byte Spill
	movq	-112(%rbp), %rax
	movq	16(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r9
	movq	-320(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-312(%rbp), %rdx                # 8-byte Reload
	addq	%r9, %r8
	adcq	%rdi, %rax
	movq	%rax, -304(%rbp)                # 8-byte Spill
	movq	-120(%rbp), %rax
	movq	(%rdx), %rdi
	movq	%rdi, -296(%rbp)                # 8-byte Spill
	movq	8(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r9
	movq	-304(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-296(%rbp), %rdx                # 8-byte Reload
	addq	%r9, %r8
	movq	%r8, -280(%rbp)                 # 8-byte Spill
	adcq	%rdi, %rax
	movq	%rax, -288(%rbp)                # 8-byte Spill
	movq	-128(%rbp), %rax
	mulq	%rdx
	movq	%rax, %r8
	movq	-288(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-280(%rbp), %rdx                # 8-byte Reload
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-136(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	32(%rdx), %rdx
	mulq	%rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	mulq	%rcx
	movq	%rax, %rdi
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	addq	%rdi, %rcx
	adcq	%rdx, %rax
	movq	%rcx, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-40(%rbp), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rcx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-64(%rbp), %rax
	andq	%rsi, %rax
	movq	%rax, -72(%rbp)
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rcx
	movq	%rcx, %rax
	shldq	$12, %rdx, %rax
	sarq	$52, %rcx
	movq	%rcx, -56(%rbp)
	movq	%rax, -64(%rbp)
	movq	-104(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	%rcx, -256(%rbp)                # 8-byte Spill
	movq	32(%rcx), %rdx
	mulq	%rdx
	movq	%rax, %rdi
	movq	%rdx, -272(%rbp)                # 8-byte Spill
	movq	-112(%rbp), %rax
	movq	24(%rcx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rax
	movq	-272(%rbp), %rdx                # 8-byte Reload
	addq	%r8, %rdi
	adcq	%rax, %rdx
	movq	%rdx, -264(%rbp)                # 8-byte Spill
	movq	-120(%rbp), %rax
	movq	16(%rcx), %rcx
	mulq	%rcx
	movq	%rax, %r8
	movq	-264(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rcx
	movq	-256(%rbp), %rdx                # 8-byte Reload
	addq	%r8, %rdi
	adcq	%rcx, %rax
	movq	%rax, -248(%rbp)                # 8-byte Spill
	movq	-128(%rbp), %rax
	movq	(%rdx), %rcx
	movq	8(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	-248(%rbp), %rax                # 8-byte Reload
	addq	%r8, %rdi
	adcq	%rdx, %rax
	movq	%rax, -240(%rbp)                # 8-byte Spill
	movq	-136(%rbp), %rax
	mulq	%rcx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movq	-240(%rbp), %rdx                # 8-byte Reload
	addq	%rcx, %rdi
	adcq	%rax, %rdx
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rax
	addq	%rdi, %rcx
	adcq	%rdx, %rax
	movq	%rcx, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	movabsq	$281475040739328, %rcx          # imm = 0x1000003D10000
	mulq	%rcx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	andq	%rsi, %rax
	movq	%rax, -80(%rbp)
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rdi, %rax
	sarq	$52, %rdx
	movq	%rdx, -56(%rbp)
	movq	%rax, -64(%rbp)
	movzwl	-74(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -88(%rbp)
	movw	$0, -74(%rbp)
	movq	-104(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rdx
	mulq	%rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-112(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -232(%rbp)                # 8-byte Spill
	movq	32(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-232(%rbp), %rdx                # 8-byte Reload
	movq	-120(%rbp), %rax
	movq	24(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r9
	movq	%rdx, %rax
	movq	-232(%rbp), %rdx                # 8-byte Reload
	addq	%r9, %r8
	adcq	%rax, %rdi
	movq	-128(%rbp), %rax
	movq	8(%rdx), %r9
	movq	%r9, -224(%rbp)                 # 8-byte Spill
	movq	16(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r9
	movq	%rdx, %rax
	movq	-224(%rbp), %rdx                # 8-byte Reload
	addq	%r9, %r8
	adcq	%rax, %rdi
	movq	-136(%rbp), %rax
	mulq	%rdx
	addq	%rax, %r8
	adcq	%rdx, %rdi
	movq	-64(%rbp), %rdx
	movq	-56(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	andq	%rsi, %rax
	movq	%rax, -96(%rbp)
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rdi, %rax
	sarq	$52, %rdx
	movq	%rdx, -56(%rbp)
	movq	%rax, -64(%rbp)
	movq	-96(%rbp), %rax
	shlq	$4, %rax
	movq	-88(%rbp), %rdx
	orq	%rdx, %rax
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movabsq	$4294968273, %rdx               # imm = 0x1000003D1
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rdx
	andq	%rsi, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rdi, %rax
	sarq	$52, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-104(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	(%rdx), %rdi
	movq	%rdi, -216(%rbp)                # 8-byte Spill
	movq	8(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-216(%rbp), %rdx                # 8-byte Reload
	movq	-112(%rbp), %rax
	mulq	%rdx
	addq	%rax, %r8
	adcq	%rdx, %rdi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-120(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -208(%rbp)                # 8-byte Spill
	movq	32(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	movq	-208(%rbp), %rdx                # 8-byte Reload
	movq	-128(%rbp), %rax
	movq	16(%rdx), %rdi
	movq	%rdi, -200(%rbp)                # 8-byte Spill
	movq	24(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	-200(%rbp), %rdx                # 8-byte Reload
	addq	%rdi, %r9
	adcq	%rax, %r8
	movq	-136(%rbp), %rax
	mulq	%rdx
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	-168(%rbp), %rdx                # 8-byte Reload
	addq	%rdi, %r9
	adcq	%rax, %r8
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rax
	addq	%r9, %rdi
	adcq	%r8, %rax
	movq	%rdi, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	andq	%rsi, %rax
	mulq	%rdx
	movq	%rax, %r8
	movq	-160(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdx
	addq	%r8, %rsi
	adcq	%rdi, %rdx
	movq	%rsi, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-64(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	%rsi, %rdx
	shldq	$12, %rdi, %rdx
	sarq	$52, %rsi
	movq	%rsi, -56(%rbp)
	movq	%rdx, -64(%rbp)
	movq	-48(%rbp), %rdx
	andq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rsi, %rax
	sarq	$52, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-104(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, -192(%rbp)                # 8-byte Spill
	movq	16(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	movq	-192(%rbp), %rdx                # 8-byte Reload
	movq	-112(%rbp), %rax
	movq	(%rdx), %r8
	movq	%r8, -184(%rbp)                 # 8-byte Spill
	movq	8(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rax
	movq	-184(%rbp), %rdx                # 8-byte Reload
	addq	%r8, %rdi
	adcq	%rax, %rsi
	movq	-120(%rbp), %rax
	mulq	%rdx
	addq	%rax, %rdi
	adcq	%rdx, %rsi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%rdi, %rdx
	adcq	%rsi, %rax
	movq	%rdx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-128(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	24(%rdx), %rsi
	movq	%rsi, -176(%rbp)                # 8-byte Spill
	movq	32(%rdx), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-176(%rbp), %rdx                # 8-byte Reload
	movq	-136(%rbp), %rax
	mulq	%rdx
	movq	%rax, %rsi
	movq	%rdx, %rax
	movq	-168(%rbp), %rdx                # 8-byte Reload
	addq	%rsi, %r8
	adcq	%rax, %rdi
	movq	-64(%rbp), %rsi
	movq	-56(%rbp), %rax
	addq	%r8, %rsi
	adcq	%rdi, %rax
	movq	%rsi, -64(%rbp)
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	mulq	%rdx
	movq	%rax, %r8
	movq	-160(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdx
	addq	%r8, %rsi
	adcq	%rdi, %rdx
	movq	%rsi, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-56(%rbp), %rsi
	movq	%rsi, %rdx
	sarq	$63, %rdx
	movq	%rsi, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-48(%rbp), %rdx
	andq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rsi, %rax
	sarq	$52, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-64(%rbp), %rax
	mulq	%rcx
	movq	%rax, %rdi
	movq	-160(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rsi
	movq	-72(%rbp), %rcx
	addq	%rcx, %rdi
	adcq	$0, %rsi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	addq	%rdi, %rdx
	adcq	%rsi, %rcx
	movq	%rdx, -48(%rbp)
	movq	%rcx, -40(%rbp)
	movq	-48(%rbp), %rcx
	andq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, 24(%rax)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rcx, %rax
	shldq	$12, %rdx, %rax
	sarq	$52, %rcx
	movq	%rcx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-80(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	addq	%rdx, %rcx
	adcq	$0, %rax
	movq	%rcx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, 32(%rax)
	addq	$192, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	secp256k1_fe_mul_inner, .Lfunc_end0-secp256k1_fe_mul_inner
	.cfi_endproc
                                        # -- End function
	.globl	secp256k1_fe_sqr_inner          # -- Begin function secp256k1_fe_sqr_inner
	.p2align	4, 0x90
	.type	secp256k1_fe_sqr_inner,@function
secp256k1_fe_sqr_inner:                 # @secp256k1_fe_sqr_inner
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-16(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-16(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -88(%rbp)
	movabsq	$4503599627370495, %rsi         # imm = 0xFFFFFFFFFFFFF
	movq	%rsi, -144(%rbp)                # 8-byte Spill
	movq	%rsi, -128(%rbp)
	movabsq	$68719492368, %rcx              # imm = 0x1000003D10
	movq	%rcx, -152(%rbp)                # 8-byte Spill
	movq	%rcx, -136(%rbp)
	movq	-56(%rbp), %rax
	addq	%rax, %rax
	movq	-80(%rbp), %rdx
	mulq	%rdx
	movq	%rax, -184(%rbp)                # 8-byte Spill
	movq	%rdx, -176(%rbp)                # 8-byte Spill
	movq	-64(%rbp), %rax
	addq	%rax, %rax
	movq	-72(%rbp), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	-184(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-176(%rbp), %rdx                # 8-byte Reload
	addq	%r8, %rax
	adcq	%rdi, %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-88(%rbp), %rdx
	movq	%rdx, %rax
	mulq	%rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	mulq	%rcx
	movq	%rax, %rdi
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	addq	%rdi, %rcx
	adcq	%rdx, %rax
	movq	%rcx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rcx
	movq	%rcx, %rax
	sarq	$63, %rax
	movq	%rcx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rax
	andq	%rsi, %rax
	movq	%rax, -96(%rbp)
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rcx
	movq	%rcx, %rax
	shldq	$12, %rdx, %rax
	sarq	$52, %rcx
	movq	%rcx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-88(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, -88(%rbp)
	movq	-56(%rbp), %rax
	movq	-88(%rbp), %rcx
	mulq	%rcx
	movq	%rax, %rdi
	movq	%rdx, -168(%rbp)                # 8-byte Spill
	movq	-64(%rbp), %rax
	addq	%rax, %rax
	movq	-80(%rbp), %rcx
	mulq	%rcx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movq	-168(%rbp), %rdx                # 8-byte Reload
	addq	%rcx, %rdi
	adcq	%rax, %rdx
	movq	%rdx, -160(%rbp)                # 8-byte Spill
	movq	-72(%rbp), %rcx
	movq	%rcx, %rax
	mulq	%rcx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movq	-160(%rbp), %rdx                # 8-byte Reload
	addq	%rcx, %rdi
	adcq	%rax, %rdx
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rax
	addq	%rdi, %rcx
	adcq	%rdx, %rax
	movq	%rcx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movabsq	$281475040739328, %rcx          # imm = 0x1000003D10000
	mulq	%rcx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	andq	%rsi, %rax
	movq	%rax, -104(%rbp)
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rdi, %rax
	sarq	$52, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movswq	-98(%rbp), %rax
	movq	%rax, -112(%rbp)
	movw	$0, -98(%rbp)
	movq	-56(%rbp), %rdx
	movq	%rdx, %rax
	mulq	%rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-64(%rbp), %rax
	movq	-88(%rbp), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-72(%rbp), %rax
	addq	%rax, %rax
	movq	-80(%rbp), %rdx
	mulq	%rdx
	addq	%rax, %r8
	adcq	%rdx, %rdi
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	andq	%rsi, %rax
	movq	%rax, -120(%rbp)
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rdi, %rax
	sarq	$52, %rdx
	movq	%rdx, -40(%rbp)
	movq	%rax, -48(%rbp)
	movq	-120(%rbp), %rax
	shlq	$4, %rax
	movq	-112(%rbp), %rdx
	orq	%rdx, %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movabsq	$4294968273, %rdx               # imm = 0x1000003D1
	imulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rdx
	andq	%rsi, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-32(%rbp), %rdi
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rdi, %rax
	sarq	$52, %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	-64(%rbp), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%r8, %rdx
	adcq	%rdi, %rax
	movq	%rdx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-72(%rbp), %rax
	movq	-88(%rbp), %rdx
	mulq	%rdx
	movq	%rax, %r9
	movq	%rdx, %r8
	movq	-80(%rbp), %rdx
	movq	%rdx, %rax
	mulq	%rdx
	movq	%rax, %rdi
	movq	%rdx, %rax
	movq	-152(%rbp), %rdx                # 8-byte Reload
	addq	%rdi, %r9
	adcq	%rax, %r8
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rax
	addq	%r9, %rdi
	adcq	%r8, %rax
	movq	%rdi, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	andq	%rsi, %rax
	mulq	%rdx
	movq	%rax, %r8
	movq	-144(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	addq	%r8, %rsi
	adcq	%rdi, %rdx
	movq	%rsi, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movq	%rsi, %rdx
	shldq	$12, %rdi, %rdx
	sarq	$52, %rsi
	movq	%rsi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	-32(%rbp), %rdx
	andq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rsi, %rax
	sarq	$52, %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-56(%rbp), %rax
	movq	-72(%rbp), %rdx
	mulq	%rdx
	movq	%rax, %rdi
	movq	%rdx, %rsi
	movq	-64(%rbp), %rdx
	movq	%rdx, %rax
	mulq	%rdx
	addq	%rax, %rdi
	adcq	%rdx, %rsi
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdi, %rdx
	adcq	%rsi, %rax
	movq	%rdx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-80(%rbp), %rax
	movq	-88(%rbp), %rdx
	mulq	%rdx
	movq	%rax, %r8
	movq	%rdx, %rdi
	movq	-152(%rbp), %rdx                # 8-byte Reload
	movq	-48(%rbp), %rsi
	movq	-40(%rbp), %rax
	addq	%r8, %rsi
	adcq	%rdi, %rax
	movq	%rsi, -48(%rbp)
	movq	%rax, -40(%rbp)
	movq	-48(%rbp), %rax
	mulq	%rdx
	movq	%rax, %r8
	movq	-144(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rdi
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	addq	%r8, %rsi
	adcq	%rdi, %rdx
	movq	%rsi, -32(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-40(%rbp), %rsi
	movq	%rsi, %rdx
	sarq	$63, %rdx
	movq	%rsi, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-32(%rbp), %rdx
	andq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rdx
	movq	%rdx, %rax
	shldq	$12, %rsi, %rax
	sarq	$52, %rdx
	movq	%rdx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-48(%rbp), %rax
	mulq	%rcx
	movq	%rax, %rdi
	movq	-144(%rbp), %rax                # 8-byte Reload
	movq	%rdx, %rsi
	movq	-96(%rbp), %rdx
	movq	%rdx, %rcx
	sarq	$63, %rcx
	addq	%rdx, %rdi
	adcq	%rcx, %rsi
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	addq	%rdi, %rdx
	adcq	%rsi, %rcx
	movq	%rdx, -32(%rbp)
	movq	%rcx, -24(%rbp)
	movq	-32(%rbp), %rcx
	andq	%rax, %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, 24(%rax)
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rcx
	movq	%rcx, %rax
	shldq	$12, %rdx, %rax
	sarq	$52, %rcx
	movq	%rcx, -24(%rbp)
	movq	%rax, -32(%rbp)
	movq	-104(%rbp), %rsi
	movq	%rsi, %rdx
	sarq	$63, %rdx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	addq	%rsi, %rcx
	adcq	%rdx, %rax
	movq	%rcx, -32(%rbp)
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, 32(%rax)
	addq	$64, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	secp256k1_fe_sqr_inner, .Lfunc_end1-secp256k1_fe_sqr_inner
	.cfi_endproc
                                        # -- End function
	.ident	"Debian clang version 14.0.6"
	.section	".note.GNU-stack","",@progbits
	.addrsig

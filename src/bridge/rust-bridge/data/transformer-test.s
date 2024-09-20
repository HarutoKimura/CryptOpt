	.text
	.file	"transformer-test.ll"
	.globl	test_sext                       # -- Begin function test_sext
	.p2align	4, 0x90
	.type	test_sext,@function
test_sext:                              # @test_sext
	.cfi_startproc
# %bb.0:
	movl	%edi, %eax
	movl	%edi, %ecx
	andl	$1, %ecx
	movb	%cl, -1(%rsp)
	andl	$1, %eax
	negq	%rax
	retq
.Lfunc_end0:
	.size	test_sext, .Lfunc_end0-test_sext
	.cfi_endproc
                                        # -- End function
	.globl	test_sext_transformed1          # -- Begin function test_sext_transformed1
	.p2align	4, 0x90
	.type	test_sext_transformed1,@function
test_sext_transformed1:                 # @test_sext_transformed1
	.cfi_startproc
# %bb.0:
	movl	%edi, %eax
	movl	%edi, %ecx
	andl	$1, %ecx
	movb	%cl, -1(%rsp)
	andl	$1, %eax
	negq	%rax
	retq
.Lfunc_end1:
	.size	test_sext_transformed1, .Lfunc_end1-test_sext_transformed1
	.cfi_endproc
                                        # -- End function
	.globl	test_sext_transformed2          # -- Begin function test_sext_transformed2
	.p2align	4, 0x90
	.type	test_sext_transformed2,@function
test_sext_transformed2:                 # @test_sext_transformed2
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	leal	-1(%rdi), %eax
	andl	%edi, %eax
	xorl	%edi, %eax
	movl	%edi, %ecx
	andl	$1, %ecx
	movb	%cl, -1(%rsp)
	orq	$-2, %rax
	retq
.Lfunc_end2:
	.size	test_sext_transformed2, .Lfunc_end2-test_sext_transformed2
	.cfi_endproc
                                        # -- End function
	.globl	test_sext_sensei_formula_ver2   # -- Begin function test_sext_sensei_formula_ver2
	.p2align	4, 0x90
	.type	test_sext_sensei_formula_ver2,@function
test_sext_sensei_formula_ver2:          # @test_sext_sensei_formula_ver2
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	movl	%edi, %eax
	andl	$1, %eax
	movb	%al, -1(%rsp)
	andl	$1, %edi
	leaq	-2(%rdi), %rax
	negq	%rdi
	andq	%rdi, %rax
	retq
.Lfunc_end3:
	.size	test_sext_sensei_formula_ver2, .Lfunc_end3-test_sext_sensei_formula_ver2
	.cfi_endproc
                                        # -- End function
	.globl	test_sext_transformed3          # -- Begin function test_sext_transformed3
	.p2align	4, 0x90
	.type	test_sext_transformed3,@function
test_sext_transformed3:                 # @test_sext_transformed3
	.cfi_startproc
# %bb.0:
	movl	%edi, %eax
	movl	%edi, %ecx
	andl	$1, %ecx
	movb	%cl, -1(%rsp)
	andl	$1, %eax
	negq	%rax
	retq
.Lfunc_end4:
	.size	test_sext_transformed3, .Lfunc_end4-test_sext_transformed3
	.cfi_endproc
                                        # -- End function
	.globl	test_select                     # -- Begin function test_select
	.p2align	4, 0x90
	.type	test_select,@function
test_select:                            # @test_select
	.cfi_startproc
# %bb.0:
	movq	%rsi, %rax
	testb	$1, %dil
	cmoveq	%rdx, %rax
	retq
.Lfunc_end5:
	.size	test_select, .Lfunc_end5-test_select
	.cfi_endproc
                                        # -- End function
	.globl	test_select_sensei              # -- Begin function test_select_sensei
	.p2align	4, 0x90
	.type	test_select_sensei,@function
test_select_sensei:                     # @test_select_sensei
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	andl	$1, %edi
	imulq	%rdi, %rsi
	xorq	$1, %rdi
	imulq	%rdx, %rdi
	leaq	(%rdi,%rsi), %rax
	retq
.Lfunc_end6:
	.size	test_select_sensei, .Lfunc_end6-test_select_sensei
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	xorl	%edi, %edi
	callq	test_sext
	movl	$.L.str, %edi
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%edi, %edi
	callq	test_sext_transformed1
	movl	$.L.str.1, %edi
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%edi, %edi
	callq	test_sext_transformed2
	movl	$.L.str.2, %edi
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%edi, %edi
	callq	test_sext_sensei_formula_ver2
	movl	$.L.str.3, %edi
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %edi
	callq	test_sext
	movl	$.L.str, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %edi
	callq	test_sext_transformed1
	movl	$.L.str.1, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %edi
	callq	test_sext_transformed2
	movl	$.L.str.2, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$1, %edi
	callq	test_sext_sensei_formula_ver2
	movl	$.L.str.3, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$100, %esi
	movl	$200, %edx
	xorl	%edi, %edi
	callq	test_select
	movl	$.L.str.4, %edi
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$100, %esi
	movl	$200, %edx
	xorl	%edi, %edi
	callq	test_select_sensei
	movl	$.L.str.5, %edi
	xorl	%esi, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$100, %esi
	movl	$200, %edx
	movl	$1, %edi
	callq	test_select
	movl	$.L.str.4, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	movl	$100, %esi
	movl	$200, %edx
	movl	$1, %edi
	callq	test_select_sensei
	movl	$.L.str.5, %edi
	movl	$1, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	printf@PLT
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	main, .Lfunc_end7-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"sext(%d) = %lld\n"
	.size	.L.str, 17

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"sext_transformed1(%d) = %lld\n"
	.size	.L.str.1, 30

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"sext_transformed2(%d) = %lld\n"
	.size	.L.str.2, 30

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"test_sext_sensei_formula_ver2(%d) = %lld\n"
	.size	.L.str.3, 42

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"select(%d) = %lld\n"
	.size	.L.str.4, 19

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"select_sensei(%d) = %lld\n"
	.size	.L.str.5, 26

	.section	".note.GNU-stack","",@progbits

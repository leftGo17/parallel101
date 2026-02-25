	.file	"main.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04.2) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata
	.align 8
.LC0:
	.string	"\346\255\243\345\234\250\350\277\220\350\241\214 10 \344\272\277\346\254\241\345\276\252\347\216\257\357\274\214\350\257\267\347\250\215\345\200\231..."
.LC1:
	.string	"\350\256\241\347\256\227\345\256\214\346\210\220\357\274\201"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1731:
	.cfi_startproc
	endbr64	
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 48
# main.cpp:6:     volatile int a = 0;
	movl	$0, 12(%rsp)	#, a
# main.cpp:7:     long long iterations = 1000000000LL;
	movq	$1000000000, 24(%rsp)	#, iterations
# main.cpp:9:     std::cout << "正在运行 10 亿次循环，请稍候..." << std::endl;
	leaq	.LC0(%rip), %rax	#, tmp86
	movq	%rax, %rsi	# tmp86,
	leaq	_ZSt4cout(%rip), %rax	#, tmp87
	movq	%rax, %rdi	# tmp87,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# main.cpp:9:     std::cout << "正在运行 10 亿次循环，请稍候..." << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp89
	movq	%rdx, %rsi	# tmp88,
	movq	%rax, %rdi	# _1,
	call	_ZNSolsEPFRSoS_E@PLT	#
# main.cpp:11:     for (long long i = 0; i < iterations; ++i) {
	movq	$0, 16(%rsp)	#, i
# main.cpp:11:     for (long long i = 0; i < iterations; ++i) {
	jmp	.L2	#
.L3:
# main.cpp:12:         a = 1;
	movl	$1, 12(%rsp)	#, a
# main.cpp:11:     for (long long i = 0; i < iterations; ++i) {
	addq	$1, 16(%rsp)	#, i
.L2:
# main.cpp:11:     for (long long i = 0; i < iterations; ++i) {
	movq	16(%rsp), %rax	# i, tmp90
	cmpq	24(%rsp), %rax	# iterations, tmp90
	jl	.L3	#,
# main.cpp:15:     std::cout << "计算完成！" << std::endl;
	leaq	.LC1(%rip), %rax	#, tmp91
	movq	%rax, %rsi	# tmp91,
	leaq	_ZSt4cout(%rip), %rax	#, tmp92
	movq	%rax, %rdi	# tmp92,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# main.cpp:15:     std::cout << "计算完成！" << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp94
	movq	%rdx, %rsi	# tmp93,
	movq	%rax, %rdi	# _2,
	call	_ZNSolsEPFRSoS_E@PLT	#
# main.cpp:16:     return 0;
	movl	$0, %eax	#, _15
# main.cpp:17: }
	addq	$40, %rsp	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE1731:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB2234:
	.cfi_startproc
	endbr64	
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 32
	movl	%edi, 12(%rsp)	# __initialize_p, __initialize_p
	movl	%esi, 8(%rsp)	# __priority, __priority
# main.cpp:17: }
	cmpl	$1, 12(%rsp)	#, __initialize_p
	jne	.L7	#,
# main.cpp:17: }
	cmpl	$65535, 8(%rsp)	#, __priority
	jne	.L7	#,
# /usr/include/c++/11/iostream:74:   static ios_base::Init __ioinit;
	leaq	_ZStL8__ioinit(%rip), %rax	#, tmp82
	movq	%rax, %rdi	# tmp82,
	call	_ZNSt8ios_base4InitC1Ev@PLT	#
	leaq	__dso_handle(%rip), %rax	#, tmp83
	movq	%rax, %rdx	# tmp83,
	leaq	_ZStL8__ioinit(%rip), %rax	#, tmp84
	movq	%rax, %rsi	# tmp84,
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax	#, tmp86
	movq	%rax, %rdi	# tmp85,
	call	__cxa_atexit@PLT	#
.L7:
# main.cpp:17: }
	nop	
	addq	$24, %rsp	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE2234:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB2235:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# main.cpp:17: }
	movl	$65535, %esi	#,
	movl	$1, %edi	#,
	call	_Z41__static_initialization_and_destruction_0ii	#
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE2235:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.2) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

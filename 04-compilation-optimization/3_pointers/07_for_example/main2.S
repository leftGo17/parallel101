	.file	"main2.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04.2) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O3 -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.globl	_Z10add_arraysPiS_
	.type	_Z10add_arraysPiS_, @function
_Z10add_arraysPiS_:
.LFB0:
	.cfi_startproc
	endbr64	
	movl	(%rsi), %edx	# *c_10(D), c__lsm.2
	leaq	400(%rdi), %rax	#, _4
# main2.cpp:1: void add_arrays(int *__restrict a, int *__restrict c) {
	pxor	%xmm0, %xmm0	# vect_c__lsm.4
	.p2align 4,,10
	.p2align 3
.L2:
# main2.cpp:3:         *c += a[i];
	movdqu	(%rdi), %xmm2	# MEM <vector(4) int> [(int *)_2], tmp107
	addq	$16, %rdi	#, ivtmp.14
	paddd	%xmm2, %xmm0	# tmp107, vect_c__lsm.4
	cmpq	%rdi, %rax	# ivtmp.14, _4
	jne	.L2	#,
	movdqa	%xmm0, %xmm1	# vect_c__lsm.4, tmp98
	psrldq	$8, %xmm1	#, tmp98
	paddd	%xmm1, %xmm0	# tmp98, _17
	movdqa	%xmm0, %xmm1	# _17, tmp100
	psrldq	$4, %xmm1	#, tmp100
	paddd	%xmm1, %xmm0	# tmp100, tmp101
	movd	%xmm0, %eax	# tmp101, stmp__6.9
	addl	%edx, %eax	# c__lsm.2, tmp103
	movl	%eax, (%rsi)	# tmp103, *c_10(D)
# main2.cpp:5: }
	ret	
	.cfi_endproc
.LFE0:
	.size	_Z10add_arraysPiS_, .-_Z10add_arraysPiS_
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

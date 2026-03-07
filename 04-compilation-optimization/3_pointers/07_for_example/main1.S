	.file	"main1.cpp"
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
# main1.cpp:3:         *c += a[i];
	movl	(%rsi), %eax	# *c_10(D), _6
	leaq	400(%rdi), %rdx	#, _8
	.p2align 4,,10
	.p2align 3
.L2:
# main1.cpp:3:         *c += a[i];
	addl	(%rdi), %eax	# MEM[(int *)_15], _6
# main1.cpp:2:     for (int i = 0; i < 100; i++) {
	addq	$4, %rdi	#, ivtmp.9
# main1.cpp:3:         *c += a[i];
	movl	%eax, (%rsi)	# _6, *c_10(D)
# main1.cpp:2:     for (int i = 0; i < 100; i++) {
	cmpq	%rdi, %rdx	# ivtmp.9, _8
	jne	.L2	#,
# main1.cpp:5: }
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

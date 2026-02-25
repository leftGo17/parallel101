	.file	"main.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04.2) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	_Z4funciiiiii
	.type	_Z4funciiiiii, @function
_Z4funciiiiii:
.LFB0:
	.cfi_startproc
	endbr64	
	movl	%edi, -4(%rsp)	# a, a
	movl	%esi, -8(%rsp)	# b, b
	movl	%edx, -12(%rsp)	# c, c
	movl	%ecx, -16(%rsp)	# d, d
	movl	%r8d, -20(%rsp)	# e, e
	movl	%r9d, -24(%rsp)	# f, f
# main.cpp:2:     return a;
	movl	-4(%rsp), %eax	# a, _2
# main.cpp:3: }
	ret	
	.cfi_endproc
.LFE0:
	.size	_Z4funciiiiii, .-_Z4funciiiiii
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

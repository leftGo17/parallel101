	.file	"main2.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04.2) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mavx2 -mtune=generic -march=x86-64 -O3 -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.globl	_Z10add_arraysPiS_
	.type	_Z10add_arraysPiS_, @function
_Z10add_arraysPiS_:
.LFB0:
	.cfi_startproc
	endbr64	
# main2.cpp:3:         *c += a[i];
	vmovdqu	32(%rdi), %ymm3	# MEM <vector(8) int> [(int *)a_11(D) + 32B], tmp157
	vpaddd	(%rdi), %ymm3, %ymm0	# MEM <vector(8) int> [(int *)a_11(D)], tmp157, vect__6.10
	vpaddd	64(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 64B], vect__6.10, vect__6.10
	vpaddd	96(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 96B], vect__6.10, vect__6.10
	vpaddd	128(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 128B], vect__6.10, vect__6.10
	vpaddd	160(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 160B], vect__6.10, vect__6.10
	vpaddd	192(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 192B], vect__6.10, vect__6.10
	vpaddd	224(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 224B], vect__6.10, vect__6.10
	vpaddd	256(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 256B], vect__6.10, vect__6.10
	vpaddd	288(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 288B], vect__6.10, vect__6.10
	vpaddd	320(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 320B], vect__6.10, vect__6.10
	vpaddd	352(%rdi), %ymm0, %ymm0	# MEM <vector(8) int> [(int *)a_11(D) + 352B], vect__6.10, vect__6.10
	vmovdqa	%xmm0, %xmm1	# vect__6.10, tmp136
	vextracti128	$0x1, %ymm0, %xmm0	# vect__6.10, tmp137
	vpaddd	%xmm0, %xmm1, %xmm0	# tmp137, tmp136, _44
	vpsrldq	$8, %xmm0, %xmm1	#, _44, tmp139
	vpaddd	%xmm1, %xmm0, %xmm0	# tmp139, _44, _46
# main2.cpp:3:         *c += a[i];
	vmovdqu	384(%rdi), %xmm1	# MEM <vector(4) int> [(int *)a_11(D) + 384B], MEM <vector(4) int> [(int *)a_11(D) + 384B]
	vpsrldq	$8, %xmm1, %xmm2	#, MEM <vector(4) int> [(int *)a_11(D) + 384B], tmp142
	vpaddd	%xmm2, %xmm1, %xmm1	# tmp142, MEM <vector(4) int> [(int *)a_11(D) + 384B], _61
	vpsrldq	$4, %xmm0, %xmm2	#, _46, tmp144
	vpaddd	%xmm2, %xmm0, %xmm0	# tmp144, _46, tmp145
	vmovd	%xmm0, %eax	# tmp145, stmp__6.11
	vpsrldq	$4, %xmm1, %xmm0	#, _61, tmp150
	vpaddd	%xmm0, %xmm1, %xmm1	# tmp150, _61, tmp151
	vmovd	%xmm1, %edx	# tmp151, stmp__31.17
	addl	%edx, %eax	# stmp__31.17, tmp153
	addl	%eax, (%rsi)	# tmp153, *c_10(D)
	vzeroupper
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

	.file	"main.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04.2) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O3 -ffast-math -fopenmp -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.globl	_Z4funcPfS_S_
	.type	_Z4funcPfS_S_, @function
_Z4funcPfS_S_:
.LFB965:
	.cfi_startproc
	endbr64	
# main.cpp:3: void func(float *a, float *b, float *c) {
	movq	%rdi, %r8	# tmp107, a
	movq	%rsi, %rdi	# tmp108, b
# main.cpp:7:             tmp += a[i] * b[j];
	xorl	%ecx, %ecx	# ivtmp.25
# main.cpp:3: void func(float *a, float *b, float *c) {
	movq	%rdx, %rsi	# tmp109, c
	leaq	4096(%rdi), %rdx	#, _7
.L2:
	movss	(%r8,%rcx), %xmm2	# MEM[(float *)a_24(D) + ivtmp.25_8 * 1], vect_cst__31
	movq	%rdi, %rax	# b, ivtmp.15
# main.cpp:7:             tmp += a[i] * b[j];
	pxor	%xmm1, %xmm1	# vect_tmp_36.3
	shufps	$0, %xmm2, %xmm2	# vect_cst__31
	.p2align 4,,10
	.p2align 3
.L3:
# main.cpp:7:             tmp += a[i] * b[j];
	movups	(%rax), %xmm0	# MEM <vector(4) float> [(float *)_5], vect__9.7
	addq	$16, %rax	#, ivtmp.15
	mulps	%xmm2, %xmm0	# vect_cst__31, vect__9.7
# main.cpp:7:             tmp += a[i] * b[j];
	addps	%xmm0, %xmm1	# vect__9.7, vect_tmp_36.3
	cmpq	%rax, %rdx	# ivtmp.15, _7
	jne	.L3	#,
	movaps	%xmm1, %xmm0	# vect_tmp_36.3, tmp100
	movhlps	%xmm1, %xmm0	# vect_tmp_36.3, tmp100
	addps	%xmm0, %xmm1	# tmp100, tmp101
	movaps	%xmm1, %xmm0	# tmp101, tmp102
	shufps	$85, %xmm1, %xmm0	#, tmp101, tmp102
	addps	%xmm1, %xmm0	# tmp101, tmp99
# main.cpp:9:         c[i] += tmp;
	addss	(%rsi,%rcx), %xmm0	# MEM[(float *)c_21(D) + ivtmp.25_8 * 1], tmp103
	movss	%xmm0, (%rsi,%rcx)	# tmp103, MEM[(float *)c_21(D) + ivtmp.25_8 * 1]
# main.cpp:4:     for (int i = 0; i < 1024; i++) {
	addq	$4, %rcx	#, ivtmp.25
	cmpq	$4096, %rcx	#, ivtmp.25
	jne	.L2	#,
# main.cpp:11: }
	ret	
	.cfi_endproc
.LFE965:
	.size	_Z4funcPfS_S_, .-_Z4funcPfS_S_
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

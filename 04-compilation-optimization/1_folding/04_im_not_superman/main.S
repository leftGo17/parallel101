	.file	"main.cpp"
# GNU C++17 (Ubuntu 11.4.0-1ubuntu1~22.04.2) version 11.4.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O3 -fomit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata._ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_.str1.1,"aMS",@progbits,1
.LC0:
	.string	"vector::_M_realloc_insert"
	.section	.text._ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.type	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, @function
_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_:
.LFB1068:
	.cfi_startproc
	endbr64	
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15	# tmp144, __args#0
# /usr/include/c++/11/bits/stl_vector.h:1758: 	if (max_size() - size() < __n)
	movabsq	$2305843009213693951, %rdx	#, tmp125
# /usr/include/c++/11/bits/vector.tcc:426:       vector<_Tp, _Alloc>::
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp	#,
	.cfi_def_cfa_offset 80
	movq	8(%rdi), %r12	# MEM[(int * *)this_16(D) + 8B], _47
	movq	(%rdi), %r14	# MEM[(int * *)this_16(D)], _46
# /usr/include/c++/11/bits/stl_vector.h:919:       { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }
	movq	%r12, %rax	# _47, tmp123
	subq	%r14, %rax	# _46, tmp123
	sarq	$2, %rax	#, tmp124
# /usr/include/c++/11/bits/stl_vector.h:1758: 	if (max_size() - size() < __n)
	cmpq	%rdx, %rax	# tmp125, tmp124
	je	.L22	#,
	testq	%rax, %rax	# tmp124
	movl	$1, %edx	#, tmp147
	movq	%rdi, %rbp	# tmp142, this
	movq	%rsi, %r13	# tmp143, __position
	cmovne	%rax, %rdx	# tmp124,, tmp127
	xorl	%ecx, %ecx	# _33
	addq	%rdx, %rax	# tmp127, tmp128
# /usr/include/c++/11/bits/stl_iterator.h:1271:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rdx	# __position, _91
	setc	%cl	#, _33
	subq	%r14, %rdx	# _46, _91
# /usr/include/c++/11/bits/stl_vector.h:1762: 	return (__len < size() || __len > max_size()) ? max_size() : __len;
	testq	%rcx, %rcx	# _33
	jne	.L14	#,
# /usr/include/c++/11/bits/stl_vector.h:346: 	return __n != 0 ? _Tr::allocate(_M_impl, __n) : pointer();
	testq	%rax, %rax	# tmp128
	jne	.L6	#,
	xorl	%ebx, %ebx	# prephitmp_80
	xorl	%edi, %edi	# iftmp.5_35
.L12:
# /usr/include/c++/11/ext/new_allocator.h:162: 	{ ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
	movl	(%r15), %eax	# *__args#0_22(D), *__args#0_22(D)
# /usr/include/c++/11/bits/stl_uninitialized.h:1009:       ptrdiff_t __count = __last - __first;
	subq	%r13, %r12	# __position, _88
# /usr/include/c++/11/bits/vector.tcc:464: 	      ++__new_finish;
	leaq	4(%rdi,%rdx), %r15	#, _61
	movq	%rdi, %xmm0	# iftmp.5_35, _39
# /usr/include/c++/11/ext/new_allocator.h:162: 	{ ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
	movl	%eax, (%rdi,%rdx)	# *__args#0_22(D), *_2
# /usr/include/c++/11/bits/stl_uninitialized.h:1012:       return __result + __count;
	leaq	(%r15,%r12), %rax	#, tmp132
	movq	%rax, %xmm1	# tmp132, tmp132
	punpcklqdq	%xmm1, %xmm0	# tmp132, _39
	movaps	%xmm0, (%rsp)	# _39, %sfp
# /usr/include/c++/11/bits/stl_uninitialized.h:1010:       if (__count > 0)
	testq	%rdx, %rdx	# _91
	jg	.L23	#,
	testq	%r12, %r12	# _88
	jg	.L10	#,
# /usr/include/c++/11/bits/stl_vector.h:353: 	if (__p)
	testq	%r14, %r14	# _46
	jne	.L20	#,
.L11:
# /usr/include/c++/11/bits/vector.tcc:502:       this->_M_impl._M_start = __new_start;
	movdqa	(%rsp), %xmm2	# %sfp, _39
# /usr/include/c++/11/bits/vector.tcc:504:       this->_M_impl._M_end_of_storage = __new_start + __len;
	movq	%rbx, 16(%rbp)	# prephitmp_80, this_16(D)->D.21082._M_impl.D.20395._M_end_of_storage
# /usr/include/c++/11/bits/vector.tcc:502:       this->_M_impl._M_start = __new_start;
	movups	%xmm2, 0(%rbp)	# _39, MEM <vector(2) long unsigned int> [(int * *)this_16(D)]
# /usr/include/c++/11/bits/vector.tcc:505:     }
	addq	$24, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
# /usr/include/c++/11/bits/stl_uninitialized.h:1011: 	__builtin_memmove(__result, __first, __count * sizeof(_Tp));
	movq	%r14, %rsi	# _46,
	call	memmove@PLT	#
# /usr/include/c++/11/bits/stl_uninitialized.h:1010:       if (__count > 0)
	testq	%r12, %r12	# _88
	jg	.L10	#,
.L20:
# /usr/include/c++/11/bits/vector.tcc:501: 		    this->_M_impl._M_end_of_storage - __old_start);
	movq	16(%rbp), %rsi	# this_16(D)->D.21082._M_impl.D.20395._M_end_of_storage, _12
# /usr/include/c++/11/ext/new_allocator.h:145: 	::operator delete(__p
	movq	%r14, %rdi	# _46,
# /usr/include/c++/11/bits/vector.tcc:501: 		    this->_M_impl._M_end_of_storage - __old_start);
	subq	%r14, %rsi	# _46, _12
# /usr/include/c++/11/ext/new_allocator.h:145: 	::operator delete(__p
	call	_ZdlPvm@PLT	#
# /usr/include/c++/11/bits/alloc_traits.h:496:       { __a.deallocate(__p, __n); }
	jmp	.L11	#
	.p2align 4,,10
	.p2align 3
.L10:
# /usr/include/c++/11/bits/stl_uninitialized.h:1011: 	__builtin_memmove(__result, __first, __count * sizeof(_Tp));
	movq	%r12, %rdx	# _88,
	movq	%r13, %rsi	# __position,
	movq	%r15, %rdi	# _61,
	call	memcpy@PLT	#
# /usr/include/c++/11/bits/stl_vector.h:353: 	if (__p)
	testq	%r14, %r14	# _46
	je	.L11	#,
	jmp	.L20	#
	.p2align 4,,10
	.p2align 3
.L14:
	movabsq	$9223372036854775804, %rbx	#, prephitmp_55
.L5:
# /usr/include/c++/11/ext/new_allocator.h:127: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movq	%rbx, %rdi	# prephitmp_55,
	movq	%rdx, (%rsp)	# _91, %sfp
	call	_Znwm@PLT	#
	movq	(%rsp), %rdx	# %sfp, _91
	movq	%rax, %rdi	# tmp145, iftmp.5_35
# /usr/include/c++/11/bits/vector.tcc:504:       this->_M_impl._M_end_of_storage = __new_start + __len;
	addq	%rax, %rbx	# iftmp.5_35, prephitmp_80
	jmp	.L12	#
	.p2align 4,,10
	.p2align 3
.L6:
# /usr/include/c++/11/ext/new_allocator.h:127: 	return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
	movabsq	$2305843009213693951, %rcx	#, tmp146
	cmpq	%rcx, %rax	# tmp146, tmp128
	cmova	%rcx, %rax	# tmp128,, tmp146, tmp139
	leaq	0(,%rax,4), %rbx	#, prephitmp_55
	jmp	.L5	#
.L22:
# /usr/include/c++/11/bits/stl_vector.h:1759: 	  __throw_length_error(__N(__s));
	leaq	.LC0(%rip), %rdi	#, tmp126
	call	_ZSt20__throw_length_errorPKc@PLT	#
	.cfi_endproc
.LFE1068:
	.size	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_, .-_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4
	.globl	_Z4funcv
	.type	_Z4funcv, @function
_Z4funcv:
.LFB1023:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1023
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# /usr/include/c++/11/bits/stl_vector.h:98: 	: _M_start(), _M_finish(), _M_end_of_storage()
	pxor	%xmm0, %xmm0	# tmp131
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	xorl	%edi, %edi	# prephitmp_99
	xorl	%esi, %esi	# prephitmp_97
# main.cpp:4: int func() {
	subq	$48, %rsp	#,
	.cfi_def_cfa_offset 64
# main.cpp:4: int func() {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp174
	movq	%rax, 40(%rsp)	# tmp174, D.23214
	xorl	%eax, %eax	# tmp174
# /usr/include/c++/11/bits/stl_vector.h:1198: 	  _M_realloc_insert(end(), __x);
	leaq	12(%rsp), %r12	#, tmp172
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	movl	$1, 12(%rsp)	#, i
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	movl	$1, %eax	#, _2
# /usr/include/c++/11/bits/stl_vector.h:98: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movq	$0, 32(%rsp)	#, MEM[(struct _Vector_impl_data *)&arr]._M_end_of_storage
# /usr/include/c++/11/bits/stl_vector.h:98: 	: _M_start(), _M_finish(), _M_end_of_storage()
	movaps	%xmm0, 16(%rsp)	# tmp131, MEM <vector(2) long unsigned int> [(int * *)&arr]
	jmp	.L27	#
	.p2align 4,,10
	.p2align 3
.L52:
# /usr/include/c++/11/ext/new_allocator.h:162: 	{ ::new((void *)__p) _Up(std::forward<_Args>(__args)...); }
	movl	%eax, (%rsi)	# _2, *prephitmp_97
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	movl	12(%rsp), %eax	# i, tmp177
# /usr/include/c++/11/bits/stl_vector.h:1194: 	    ++this->_M_impl._M_finish;
	addq	$4, %rsi	#, prephitmp_97
	movq	%rsi, 24(%rsp)	# prephitmp_97, arr.D.21082._M_impl.D.20395._M_finish
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	addl	$1, %eax	#, _2
	movl	%eax, 12(%rsp)	# _2, i
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	cmpl	$100, %eax	#, _2
	jg	.L51	#,
.L27:
# /usr/include/c++/11/bits/stl_vector.h:1189: 	if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
	cmpq	%rdi, %rsi	# prephitmp_99, prephitmp_97
	jne	.L52	#,
# /usr/include/c++/11/bits/stl_vector.h:1198: 	  _M_realloc_insert(end(), __x);
	leaq	16(%rsp), %rdi	#, tmp133
	movq	%r12, %rdx	# tmp172,
.LEHB0:
	call	_ZNSt6vectorIiSaIiEE17_M_realloc_insertIJRKiEEEvN9__gnu_cxx17__normal_iteratorIPiS1_EEDpOT_	#
.LEHE0:
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	movl	12(%rsp), %eax	# i, tmp177
# /usr/include/c++/11/bits/stl_vector.h:336: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	32(%rsp), %rdi	# MEM[(struct _Vector_base *)&arr]._M_impl.D.20395._M_end_of_storage, prephitmp_99
# /usr/include/c++/11/bits/stl_iterator.h:1028:       : _M_current(__i) { }
	movq	24(%rsp), %rsi	# MEM[(int * const &)&arr + 8], prephitmp_97
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	addl	$1, %eax	#, _2
	movl	%eax, 12(%rsp)	# _2, i
# main.cpp:6:     for (int i = 1; i <= 100; i++) {
	cmpl	$100, %eax	#, _2
	jle	.L27	#,
	.p2align 4,,10
	.p2align 3
.L51:
# /usr/include/c++/11/bits/stl_iterator.h:1028:       : _M_current(__i) { }
	movq	16(%rsp), %r8	# MEM[(int * const &)&arr], _33
# /usr/include/c++/11/bits/stl_iterator.h:1271:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rax	# prephitmp_97, tmp135
# /usr/include/c++/11/numeric:299: 	  while ((__last - __first) >= 4)
	movl	$0, %r12d	#, <retval>
# /usr/include/c++/11/bits/stl_iterator.h:1271:     { return __lhs.base() - __rhs.base(); }
	subq	%r8, %rax	# _33, tmp135
# /usr/include/c++/11/numeric:299: 	  while ((__last - __first) >= 4)
	cmpq	$12, %rax	#, tmp135
# /usr/include/c++/11/bits/stl_iterator.h:1028:       : _M_current(__i) { }
	movq	%r8, %rax	# _33, tmp.102
# /usr/include/c++/11/numeric:299: 	  while ((__last - __first) >= 4)
	jle	.L28	#,
	.p2align 4,,10
	.p2align 3
.L29:
# /usr/include/c++/11/bits/stl_function.h:252: 	{ return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
	movl	4(%rax), %edx	# MEM[(int &)__first$_M_current_65 + 4], MEM[(int &)__first$_M_current_65 + 4]
	movl	12(%rax), %ecx	# MEM[(int &)__first$_M_current_65 + 12], MEM[(int &)__first$_M_current_65 + 12]
# /usr/include/c++/11/bits/stl_iterator.h:1086:       { _M_current += __n; return *this; }
	addq	$16, %rax	#, tmp.102
# /usr/include/c++/11/bits/stl_function.h:252: 	{ return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
	addl	-16(%rax), %edx	# MEM[(int &)__first$_M_current_65], tmp136
	addl	-8(%rax), %ecx	# MEM[(int &)__first$_M_current_65 + 8], tmp139
	addl	%ecx, %edx	# tmp139, tmp142
	addl	%edx, %r12d	# tmp142, <retval>
# /usr/include/c++/11/bits/stl_iterator.h:1271:     { return __lhs.base() - __rhs.base(); }
	movq	%rsi, %rdx	# prephitmp_97, tmp143
	subq	%rax, %rdx	# tmp.102, tmp143
# /usr/include/c++/11/numeric:299: 	  while ((__last - __first) >= 4)
	cmpq	$12, %rdx	#, tmp143
	jg	.L29	#,
.L28:
# /usr/include/c++/11/numeric:308:       for (; __first != __last; ++__first)
	cmpq	%rsi, %rax	# prephitmp_97, tmp.102
	je	.L30	#,
	leaq	-4(%rsi), %rcx	#, tmp144
	movq	%rax, %rdx	# tmp.102, ivtmp.117
	subq	%rax, %rcx	# tmp.102, _89
	movq	%rcx, %r9	# _89, tmp145
	shrq	$2, %r9	#, tmp145
	addq	$1, %r9	#, niters.99
	cmpq	$8, %rcx	#, _89
	jbe	.L31	#,
	movq	%r9, %rcx	# niters.99, bnd.100
	pxor	%xmm0, %xmm0	# vect___init_71.103
	shrq	$2, %rcx	#, bnd.100
	salq	$4, %rcx	#, tmp147
	addq	%rax, %rcx	# tmp.102, _104
	.p2align 4,,10
	.p2align 3
.L32:
# /usr/include/c++/11/bits/stl_function.h:252: 	{ return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
	movdqu	(%rdx), %xmm2	# MEM <vector(4) int> [(int &)_79], tmp182
	addq	$16, %rdx	#, ivtmp.117
	paddd	%xmm2, %xmm0	# tmp182, vect___init_71.103
	cmpq	%rcx, %rdx	# _104, ivtmp.117
	jne	.L32	#,
	movdqa	%xmm0, %xmm1	# vect___init_71.103, tmp150
	psrldq	$8, %xmm1	#, tmp150
	paddd	%xmm1, %xmm0	# tmp150, _10
	movdqa	%xmm0, %xmm1	# _10, tmp152
	psrldq	$4, %xmm1	#, tmp152
	paddd	%xmm1, %xmm0	# tmp152, tmp153
	movd	%xmm0, %edx	# tmp153, stmp__31.108
	addl	%edx, %r12d	# stmp__31.108, <retval>
	movq	%r9, %rdx	# niters.99, niters_vector_mult_vf.101
	andq	$-4, %rdx	#, niters_vector_mult_vf.101
	leaq	(%rax,%rdx,4), %rax	#, tmp.102
	cmpq	%r9, %rdx	# niters.99, niters_vector_mult_vf.101
	je	.L30	#,
.L31:
# /usr/include/c++/11/bits/stl_iterator.h:1054: 	++_M_current;
	leaq	4(%rax), %rdx	#, tmp159
# /usr/include/c++/11/bits/stl_function.h:252: 	{ return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
	addl	(%rax), %r12d	# *__first$_M_current_77, <retval>
# /usr/include/c++/11/numeric:308:       for (; __first != __last; ++__first)
	cmpq	%rdx, %rsi	# tmp159, prephitmp_97
	je	.L30	#,
# /usr/include/c++/11/bits/stl_iterator.h:1054: 	++_M_current;
	leaq	8(%rax), %rdx	#, tmp163
# /usr/include/c++/11/bits/stl_function.h:252: 	{ return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
	addl	4(%rax), %r12d	# MEM[(int &)__first$_M_current_77 + 4], <retval>
# /usr/include/c++/11/numeric:308:       for (; __first != __last; ++__first)
	cmpq	%rdx, %rsi	# tmp163, prephitmp_97
	je	.L30	#,
# /usr/include/c++/11/bits/stl_function.h:252: 	{ return std::forward<_Tp>(__t) + std::forward<_Up>(__u); }
	addl	8(%rax), %r12d	# MEM[(int &)__first$_M_current_77 + 8], <retval>
.L30:
# /usr/include/c++/11/bits/stl_vector.h:353: 	if (__p)
	testq	%r8, %r8	# _33
	je	.L24	#,
# /usr/include/c++/11/bits/stl_vector.h:336: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	subq	%r8, %rdi	# _33, prephitmp_99
	movq	%rdi, %rsi	# prephitmp_99, tmp167
# /usr/include/c++/11/ext/new_allocator.h:145: 	::operator delete(__p
	movq	%r8, %rdi	# _33,
	call	_ZdlPvm@PLT	#
.L24:
# main.cpp:10: }
	movq	40(%rsp), %rax	# D.23214, tmp175
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp175
	jne	.L53	#,
	addq	$48, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movl	%r12d, %eax	# <retval>,
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
.L53:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
.L40:
	endbr64	
# /usr/include/c++/11/bits/stl_vector.h:680: 	std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
	movq	%rax, %r12	# tmp173, tmp170
	jmp	.L36	#
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA1023:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1023-.LLSDACSB1023
.LLSDACSB1023:
	.uleb128 .LEHB0-.LFB1023
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L40-.LFB1023
	.uleb128 0
.LLSDACSE1023:
	.text
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1023
	.type	_Z4funcv.cold, @function
_Z4funcv.cold:
.LFSB1023:
.L36:
	.cfi_def_cfa_offset 64
	.cfi_offset 12, -16
	movq	16(%rsp), %rdi	# arr.D.21082._M_impl.D.20395._M_start, _35
# /usr/include/c++/11/bits/stl_vector.h:336: 		      _M_impl._M_end_of_storage - _M_impl._M_start);
	movq	32(%rsp), %rsi	# MEM[(struct _Vector_base *)&arr]._M_impl.D.20395._M_end_of_storage, _37
	subq	%rdi, %rsi	# _35, _37
# /usr/include/c++/11/bits/stl_vector.h:353: 	if (__p)
	testq	%rdi, %rdi	# _35
	je	.L37	#,
# /usr/include/c++/11/ext/new_allocator.h:145: 	::operator delete(__p
	call	_ZdlPvm@PLT	#
.L37:
	movq	%r12, %rdi	# tmp170,
.LEHB1:
	call	_Unwind_Resume@PLT	#
.LEHE1:
	.cfi_endproc
.LFE1023:
	.section	.gcc_except_table
.LLSDAC1023:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1023-.LLSDACSBC1023
.LLSDACSBC1023:
	.uleb128 .LEHB1-.LCOLDB1
	.uleb128 .LEHE1-.LEHB1
	.uleb128 0
	.uleb128 0
.LLSDACSEC1023:
	.section	.text.unlikely
	.text
	.size	_Z4funcv, .-_Z4funcv
	.section	.text.unlikely
	.size	_Z4funcv.cold, .-_Z4funcv.cold
.LCOLDE1:
	.text
.LHOTE1:
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
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

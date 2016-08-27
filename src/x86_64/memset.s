.text
.globl	memset_asm

#void* memset(void *buffer, int c, size_t len);

memset_asm:
 	# building stack pattern used by C compilers to avoid future trouble
 	push 	%rbp
	mov 	%rsp, %rbp 
	
	mov 	%rdx, %rcx
	repnz 	stosb
	mov 	%rdi, %rax
	
	mov 	%rbp, %rsp
	pop 	%rbp
	ret

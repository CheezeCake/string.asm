.text
.globl memset_asm

#void* memset(void *buffer, int c, size_t len);

memset_asm:
	movl	4(%esp),%eax
	movl	12(%esp),%edx
	cmpl	$0,%edx
	je	end
	movl	8(%esp),%ecx
set_loop:
	decl	%edx
	movb	%cl,(%eax,%edx)
	cmpl	$0,%edx
	jne	set_loop
end:
	ret

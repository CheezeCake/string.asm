.text
.globl bzero_asm

#void bzero(void *buffer, size_t len);

bzero_asm:
	movl	4(%esp),%edx
	cmpl	$0,%edx
	je	end
	movl	(%esp),%rdi
zfill_loop:
	decl	%edx
	movb	$0,(%rdi,%edx)
	cmpl	$0,%edx
	jne	zfill_loop
end:
	ret

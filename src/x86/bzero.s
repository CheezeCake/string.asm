.text
.globl bzero_asm

#void bzero(void *buffer, size_t len);

bzero_asm:
	movl	8(%esp),%edx
	cmpl	$0,%edx
	je	end
	movl	4(%esp),%edi
zfill_loop:
	decl	%edx
	movb	$0,(%edi,%edx)
	cmpl	$0,%edx
	jne	zfill_loop
end:
	ret

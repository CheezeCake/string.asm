.text
.globl strchr_asm

#char* strchr(const char *str, int c);

strchr_asm:
	movl	4(%esp),%edi
	movl	8(%esp),%ecx
srch_loop:
	cmpb	%cl,(%edi)
	je	return_pos
	cmpb	$0,(%edi)
	je	return_null
	incl	%edi
	jmp	srch_loop

return_null:
	cmpb	$0,%cl
	je	return_pos
	xorl	%eax,%eax
	ret
return_pos:
	movl	%edi,%eax
	ret

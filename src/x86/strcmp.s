.text
.globl strcmp_asm

#int strcmp(const char *lhs, const chat *rhs);

strcmp_asm:
	movl	4(%esp),%edi
	movl	8(%esp),%esi
	#%edi = lhs, %esi = rhs
cmp_loop:
	movb	(%edi),%al
	cmpb	(%esi),%al
	jne	end
	cmpb	$0,%al
	je	equal
	incl	%edi
	incl	%esi
	jmp	cmp_loop

equal:
	movl	$0,%eax
	ret
end:
	xorl	%eax,%eax
	xorl	%edx,%edx
	movb	(%edi),%al
	movb	(%esi),%dl
	subl	%edx,%eax
	ret

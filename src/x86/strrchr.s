.text
.globl strrchr_asm

#char* strrchr(const char *str, int c);

strrchr_asm:
	movl	4(%esp),%edi
	movl	8(%esp),%ecx
	xorl	%eax,%eax
srch_loop:
	cmpb	%cl,(%edi)
	jne	cont
	movl	%edi,%eax
cont:
	cmpb	$0,(%edi)
	je	end
	incl	%edi
	jmp	srch_loop
end:
	ret

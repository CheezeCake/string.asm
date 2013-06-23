.text
.globl strcat_asm

#char* strcat(char *dest, const char *src);

strcat_asm:
	movl	4(%esp),%edi
	movl	8(%esp),%esi
	movl	%edi,%eax
get_to_end:
	cmpb	$0,(%edi)
	je	copy_loop
	incl	%edi
	jmp	get_to_end
copy_loop:
	movsb
	cmpb	$0,(%esi)
	je	end
	jmp	copy_loop
end:
	ret

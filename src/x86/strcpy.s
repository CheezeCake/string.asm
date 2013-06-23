.text
.globl strcpy_asm

#char* strcpy(char *dest, const char *src);

strcpy_asm:
	movl	4(%esp),%edi
	movl	8(%esp),%esi
	movl	%edi,%eax
copy_loop:
	movsb
	cmpb	$0,(%edi)
	je	end
	jmp	copy_loop
end:
	ret

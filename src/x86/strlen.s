.text
.globl strlen_asm

#size_t strlen(const char* str);

strlen_asm:
	movl	4(%esp),%esi
count_loop:
	cmpb	$0,(%esi)
	je	end
	incl	%esi
	jmp	count_loop
	end:
	movl	%esi,%eax
	subl	4(%esp),%eax
	ret

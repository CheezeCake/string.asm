.text
.globl _strlen_asm

#size_t strlen(const char* str);

_strlen_asm:
	movl	4(%esp),%esi
count_loop:
	xorl	%eax,%eax
	movb	(%esi),%al
	cmpl	$0,%eax
	je		end
	incl	%esi
	jmp		count_loop
end:
	movl	%esi,%eax
	subl	4(%esp),%eax
	ret

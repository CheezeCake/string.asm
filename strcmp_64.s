.globl _strcmp_asm

#int strcmp(const char *lhs, const char *rhs);

_strcmp_asm:
	#%rdi = rhs, %rsi = lhs
cmp_loop:
	movb	(%rdi),%al
	cmpb	%al,(%rsi)
	jne     end
	cmpb	$0,%al
	je      equal
	incq	%rdi
	incq	%rsi
	jmp     cmp_loop

equal:
	movq	$0,%rax
	jmp     return
end:
	xorq	%rax,%rax
	xorq	%rdx,%rdx
	movb	(%rdi),%al
	movb	(%rsi),%dl
	subq	%rdx,%rax
return:
	ret

.text
.globl strcmp_asm

#int strcmp(const char *lhs, const char *rhs);

strcmp_asm:
	#%rdi = rhs, %rsi = lhs
cmp_loop:
	movb	(%rdi),%al
	cmpb	(%rsi),%al
	jne	end
	cmpb	$0,%al
	je	equal
	incq	%rdi
	incq	%rsi
	jmp	cmp_loop

equal:
	movq	$0,%rax
	ret
end:
	xorq	%rax,%rax
	xorq	%rdx,%rdx
	movb	(%rdi),%al
	movb	(%rsi),%dl
	subq	%rdx,%rax
	ret

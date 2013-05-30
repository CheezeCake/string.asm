.text
.globl _strlen_asm

#size_t strlen(cont char *str);

_strlen_asm:
	movq	%rdi,%rsi #s = str
count_loop:
	xorq	%rax,%rax
	movb	(%rsi),%al
	cmpq	$0,%rax
	je      end
	incq	%rsi
	jmp     count_loop
end:
	movq	%rsi,%rax
	subq	%rdi,%rax
	ret

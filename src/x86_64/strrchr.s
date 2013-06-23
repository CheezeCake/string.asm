.text
.globl strrchr_asm

#char* strrchr(const char *str, int c);

strrchr_asm:
	movq	%rsi,%rcx
	xorq	%rax,%rax
srch_loop:
	cmpb	%cl,(%rdi)
	jne	cont
	movq	%rdi,%rax
cont:
	cmpb	$0,(%rdi)
	je	end
	incq	%rdi
	jmp	srch_loop
end:
	ret

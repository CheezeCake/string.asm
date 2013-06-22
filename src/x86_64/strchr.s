.text
.globl strchr_asm

#char* strchr(const char*, int);

strchr_asm:
	movq	%rsi,%rcx
srch_loop:
	cmpb	%cl,(%rdi)
	je	return_pos
	cmpb	$0,(%rdi)
	je	return_null
	incq	%rdi
	jmp	srch_loop

return_null:
	cmpb	$0,%cl
	je	return_pos
	xorq	%rax,%rax
	ret
return_pos:
	movq	%rdi,%rax
	ret

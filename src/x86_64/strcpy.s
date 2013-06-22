.text
.globl strcpy_asm

#char* strcpy(char* dest, const char* src);

strcpy_asm:
	movq	%rdi,%rax
copy_loop:
	movsb
	cmpb	$0,(%rsi)
	je	end
	jmp	copy_loop
end:
	ret

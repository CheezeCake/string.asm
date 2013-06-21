.text
.globl strcat_asm

#char* strcat(char* dest, const char* src);

strcat_asm:
	movq	%rdi,%rax
get_to_end:
	cmpb	$0,(%rdi)
	je      copy_loop
	incq	%rdi
	jmp     get_to_end
copy_loop:
	movsb
	cmpb	$0,(%rsi)
	je      end
	jmp     copy_loop
end:
	ret

.text
.globl _strcpy_asm

#char* strcpy(char* dest, const char* src);

_strcpy_asm:
copy_loop:
	movsb
	cmpb	$0,(%rsi)
	je      end
	jmp     copy_loop
end:
	ret

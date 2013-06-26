.text
.globl bzero_asm

#void bzero(void *buffer, size_t len);

bzero_asm:
	cmpq	$0,%rsi
	je	end
zfill_loop:
	decq	%rsi
	movb	$0,(%rdi, %rsi)
	cmpq	$0,%rsi
	jne	zfill_loop
end:
	ret

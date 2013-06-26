.text
.globl	memset_asm

#void* memset(void *buffer, int c, size_t len);

memset_asm:
	movq	%rdi,%rax
	cmpq	$0,%rdx
	je	end
	movq	%rsi,%rcx
set_loop:
	decq	%rdx
	movb	%cl,(%rdi,%rdx)
	cmpq	$0,%rdx
	jne	set_loop
end:
	ret

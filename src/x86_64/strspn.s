.data
	.align 4
	t: .quad 0, 0, 0, 0 #256 bits

.macro GET_BIT c
	xorq	%rax,%rax
	xorq	%rdx,%rdx
	movb	\c,%al
	movb	$64,%cl
	divb	%cl #al = ax/cl, ah = ax%cl
	movb	%ah,%dl #rdx = mod
	xorb	%ah,%ah #rax = quotient
	movb	$1,%cl
	salq	%cl,%rdx #rdx = 1<<rdx (bit)
.endm

.text
.globl _strspn_asm

#size_t strspn(const char *str, const char *charset);

_strspn_asm:
	#rdi = str, rsi = charset
	pushq	%rbp
	movq	%rsp,%rbp
	subq	$8,%rsp
	movq	%rdi,-8(%rbp) #str
	leaq	t(%rip),%rdi #rdi = t
init_t:
	cmpb	$0,(%rsi)
	je	end_init_t
	GET_BIT	(%rsi)
	#rax = c/64, rdx = 1<<(c%64)
	movq	(%rdi,%rax,8),%rcx #rcx = t[rax]
	orq	%rdx,%rcx #t[rax] |= rdx
	movq	%rcx, (%rdi, %rax,8)
	incq	%rsi
	jmp	init_t
end_init_t:
	movq	-8(%rbp),%rsi #rsi = str
check_str:
	cmpb	$0,(%rsi)
	je	end
	GET_BIT	(%rsi)
	movq	(%rdi,%rax,8),%rcx
	andq	%rdx,%rcx #rcx &= rdx
	cmpq	$0,%rcx
	je	end
	incq	%rsi
	jmp	check_str
end:
	movq	%rsi,%rax
	subq	-8(%rbp),%rax
	addq	$8,%rsp
	popq	%rbp
	ret

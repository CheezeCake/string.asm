.macro GET_BIT c
	movzx	\c,%rax
	movb	$64,%dl
	divb	%dl #al = ax/dl, ah = ax%dl
	movb	%ah,%cl #cl = mod
	xorb	%ah,%ah #rax = quotient
	movq	$1,%rdx
	salq	%cl,%rdx #rdx = 1<<cl
.endm

.text
.globl strspn_asm

#size_t strspn(const char *str, const char *charset);

strspn_asm:
	#rdi = str, rsi = charset
	pushq	%rbp
	movq	%rsp,%rbp
	subq	$40,%rsp #char *s, long t[4]
	movq	%rdi,-8(%rbp) #str
	movq	$0,-16(%rbp)
	movq	$0,-24(%rbp)
	movq	$0,-32(%rbp)
	movq	$0,-40(%rbp)
	movq	%rsp,%rdi #rdi = t
init_t:
	cmpb	$0,(%rsi)
	je	end_init_t
	GET_BIT	(%rsi)
	#rax = c/64, rdx = 1<<(c%64)
	movq	(%rdi,%rax,8),%rcx #rcx = t[rax]
	orq	%rdx,%rcx #t[rax] |= rdx
	movq	%rcx,(%rdi,%rax,8)
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
	addq	$40,%rsp
	popq	%rbp
	ret

# TODO: DEBUG !!!

.macro GET_BIT c
	movzx	\c,%eax
	movb	$64,%dl
	divb	%dl #al = ax/dl, ah = ax%dl
	movb	%ah,%cl #cl = mod
	xorb	%ah,%ah #eax = quotient
	movl	$1,%edx
	sall	%cl,%edx #edx = 1<<cl
.endm

.text
.globl strspn_asm

#size_t strspn(const char *str, const char *charset);
strspn_asm:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$32,%esp #long t[8]
	movl	$-4,%ecx
zerofill_t:
	cmpl	$-32,%ecx
	jl	end_zerofill_t
	movl	$0,(%ebp,%ecx)
	subl	$4,%ecx
	jmp	zerofill_t
end_zerofill_t:
	movl	%esp,%edi #edi = t
	movl	12(%ebp),%esi #esi = charset
init_t:
	cmpb	$0,(%esi)
	je	end_init_t
	GET_BIT (%esi)
	#eax = c/32, edx = 1<<(c%32)
	movl	(%edi,%eax,4),%ecx #ecx = t[eax]
	orl	%edx,%ecx #t[rax] |= edx
	movl	%ecx,(%edi,%eax,4)
	incl	%edi
	jmp	init_t
end_init_t:
	movl	8(%ebp),%esi #esi = str
check_str:
	cmpb	$0,(%esi)
	je	end
	GET_BIT (%esi)
	movl	(%esi,%eax,4),%ecx
	andl	%edx,%ecx #ecx &= edx
	cmpl	$0,%ecx
	je	end
	incl	%esi
	jmp	check_str
end:
	movl	%esi,%eax
	subl	8(%ebp),%eax
	addl	$32,%ebp
	popl	%ebp
	ret

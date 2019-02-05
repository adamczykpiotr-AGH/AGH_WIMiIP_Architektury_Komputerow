section .text
global fun
fun:


	mov	r13,	rsi	;adres tab
	xor	r14,	r14	;int i
	xor	r15,	r15	;int j



_petla_i:

	_petla_j:

		
		mov	r12,	[r13+r15]
		add	r12,	2
		mov	[r13+r15],	r12



		inc 	r15
		cmp	r15,	rdi
		jb _petla_j

	
	xor 	r15,	r15

	inc	r14
	cmp	r14,	10000
	jb _petla_i	

	

_koniec:
	mov	rax,	r15
	ret

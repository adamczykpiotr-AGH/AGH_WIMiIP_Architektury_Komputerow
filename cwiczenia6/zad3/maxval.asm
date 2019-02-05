section .text
global maxval
maxval:

	mov	rbx,	rdi	;adres tablicy
	mov	r12,	rsi	;ilosc elementow
	xor	r14,	r14	;maksymalna wartosc

	xor	r13,	r13	;licznik petli

	_petla:

	cmp	[rdi+4*r13+4],	r14
	jb _dalej

	mov	r14,	[rdi+4*r13+4]



	_dalej:

	inc	r13
	cmp	r13,	r12
	jl _petla


	mov	rax,	r14

ret




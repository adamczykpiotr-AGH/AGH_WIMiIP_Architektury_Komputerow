section .text
global litera
litera:

	mov	r12,	rdi	;adres tablicy
	mov	r13,	rsi	;ilosc elementow

	xor	r14,	r14	;licznik petli
	

	_petla:
	cmp	byte [r12+r14],	0	;sprawdzanie konca stringa
	je	_koniec	

	cmp	byte [r12+r14],	65
	jl _else
	cmp	byte [r12+r14],	90
	jg _else

	add	byte [r12+r14],	32
	jmp _dalej


	_else:
	
	cmp	byte [r12+r14],	97
	jl _dalej
	cmp	byte [r12+r14],	122
	jg _dalej

	sub	byte [r12+r14],	32



	_dalej:

	inc	r14
	cmp	r14,	r13
	jl _petla

	_koniec:
	mov	rax,	0
	ret

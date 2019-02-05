section .text
global zamien
zamien:

	mov	r12,	rdi	;adres tablicy
	mov	r13,	rsi	;l.el

	_petla:

	cmp	dword [r12+r13*4],	5
	jne _dalej

	mov	dword[r12+r13*4],	20

	_dalej:

	dec	r13,
	cmp	r13,	0
	ja _petla	



	mov	rax,	r13
	ret

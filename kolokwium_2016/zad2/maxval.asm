extern printf
section .data
	format	dd	"Pozycja to: %d",10,0
	temp	dd	0
section .text
global maxval 
maxval:

	mov	r12,	rdi	;adres tab
	mov	r13,	rsi	;liczba el
	xor	r14,	r14	;najwieksza
	xor	r15,	r15	;najwieksza indeks

	_petla:
	cmp	[r12+4*r13],	r14
	jb _dalej
	
	mov	r14,	[r12+4*r13]
	mov	r15,	r13

	_dalej:

	dec	r13
	cmp	r13,	0
	ja _petla


_koniec:

	mov	[temp],	r15

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	[temp]
	call printf

	mov	rax,	r14
	ret

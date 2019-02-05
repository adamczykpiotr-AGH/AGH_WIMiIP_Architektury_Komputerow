section .text
global sort
sort:


	push	rax	;min
	push 	rbx	;max
	push 	rcx	;srednia

	xor	al,	al
	mov	bl,	127


	mov	r12,	rdi	;adres tab
	mov	r13,	rsi	;rozmiar
	xor	r14,	r14	;licznik petli


_petla1:
	
	cmp	[r12+r14],	al
	jb _dalej1
	mov	al,	[r12+r14]

	_dalej1:
	inc	r14
	cmp	r14,	r13
	jb _petla1

;dziala

	xor	r14,	r14

_petla2:
	cmp	[r12+r14],	bl
	jg _dalej2
	mov	bl,	[r12+r14]


_dalej2:

	inc	r14
	cmp	r14,	r13
	jb _petla2



	cmp	[r12],	al
	je _else1
	cmp	[r12],	bl
	je _else1

	mov	cl,	[r12]
	jmp _koniec

_else1:	


	cmp	[r12+1],	al
	je _else2
	cmp	[r12+1],	bl
	je _else2

	mov	cl,	[r12+1]
	jmp _koniec
	
_else2:	


	cmp	[r12+2],	al
	je _koniec
	cmp	[r12+2],	bl
	je _koniec

	mov	cl,	[r12+2]
	
_koniec:

	mov	[r12],	al
	mov	[r12+1], cl
	mov	[r12+2], bl	

	pop	rcx
	pop	rbx
	pop	rax

	mov	rax,	1
	ret

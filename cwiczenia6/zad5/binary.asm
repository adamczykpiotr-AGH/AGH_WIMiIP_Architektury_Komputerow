section .text
global binary
binary:
	
	mov	r12,	rdi	;liczba podana do funkcji
	xor	r13,	r13	;suma modulo/jedynek


	push	rax
	push	rax
	push 	rcx
	push 	rdx


	mov	rax,	r12	;dzielna
_petla:

	mov	rdx,	0
	mov	rcx,	2	;dzielnik
	div	rcx
	
	add	r13,	rdx

	cmp	rax,	1
	jae _petla

_koniec:
	pop	rax
	pop	rbx
	pop	rcx
	pop	rdx


	mov	rax,	r13
	ret

section .text

global cyfry
cyfry:

	;licznik
	mov	rbx,	0
	;dzielenie
	mov	rdx,	0
	mov	rax,	rdi
	mov	rcx,	10

_petla:
	div	rcx

	inc 	rbx

	cmp	rax,	1
	jge _petla

	mov	rax,	rbx
ret





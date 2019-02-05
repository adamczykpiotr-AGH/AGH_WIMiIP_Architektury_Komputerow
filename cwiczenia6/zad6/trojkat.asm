section .text
global trojkat
trojkat:

	mov	r12,	rdi	;1. bok
	mov	r13,	rsi,	;2. bok
	mov	r14,	rdx,	;3. bok
	xor	r15,	r15	;temp

;dziala
	_1plus2:
	mov	r15,	r12
	add	r15,	r13
	cmp	r15,	r14
	jb _nie


	_1plus3:
	mov	r15,	r12
	add	r15,	r14
	cmp	r15,	r13
	jb _nie


	_2plus3:
	mov	r15,	r13
	add	r15,	r14
	cmp	r15,	r12
	jb _nie


_jest:
	mov	rax,	1
	jmp _koniec


_nie:
	mov	rax,	0


_koniec:
	ret

section .text
global dziel
dziel:

	push	rdx
	push	rax
	push 	rcx

	mov	rdx,	0
	mov	rax,	rdi
	mov	rcx,	rsi
	idiv	rcx,

	mov	rax,	rcx

	pop	rcx
	pop	rax
	pop	rdx

	ret

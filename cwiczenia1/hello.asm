section .data

	text	db	"Hello World",10,0
	text_length	equ $-text

section .text

global _start
_start:

	mov	rax,	4
	mov	rbx,	1
	mov	rcx,	text
	mov	rdx,	text_length
	int 80h

	mov	rax,	1
	mov	rbx,	0
	int 80h

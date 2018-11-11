section .data
	napis	db	"Wprowadz znak: ",0
	napisl	equ	$-napis
	napis2	db	"Wprowadzony znak: "
	napis2l	equ	$-napis2
	znak	db	""

section .text
global _start
_start:

;wyswietl napis
	mov	rax,	4
	mov	rbx,	1
	mov	rcx,	napis
	mov	rdx,	napisl
	int 80h

_petla:
;pobierz znak
	mov	rax,	3
	mov	rbx,	0
	mov	rcx,	znak
	mov	rdx,	1
	int 80h

;wyswietl znak
	mov	rax,	4
	mov	rbx,	1
	mov	rcx,	znak
	mov	rdx,	1
	int 80h

;jump
	jmp _petla

	mov	rax,	1
	mov	rbx,	0
	int 80h

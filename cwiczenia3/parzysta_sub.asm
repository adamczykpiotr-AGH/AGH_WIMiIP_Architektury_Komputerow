extern printf
extern scanf

section .data
	format	db	"%d",0
	napis	db	"Podaj liczbe: ",0
	liczba	dd	0
	wynik	dd	0
	parz	db	"Podana liczba jest parzysta.",10,0
	nparz	db	"Podana liczba jest nieparzysta.",10,0	


section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	liczba
	call scanf

	mov	rax,	[liczba]

_petla:

	cmp	rax,	1
	je	_nparz

	cmp	rax,	0
	sub	rax,	2
	jg _petla
	je _parz


_parz:
	xor	rax,	rax
	mov	rdi,	parz
	call printf
	jmp _koniec


_nparz:
	xor	rax,	rax
	mov	rdi,	nparz
	call printf


_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h

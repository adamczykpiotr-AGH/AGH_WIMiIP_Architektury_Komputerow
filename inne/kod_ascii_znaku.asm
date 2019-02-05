extern scanf
extern printf

section .data
	znak	db	""
	
	napis1	db	"Wpisz znak: ",0

	format 	db	"%c",0
	format2	db	"Kod ASCII wprowadzonego znaku to %d",10,0
	
	liczba	dd	0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis1
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	znak
	call scanf

	xor	ebx,	ebx
	mov	bl,	[znak]

	mov	[liczba],	ebx

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[liczba]
	call printf

_koniec:

	mov	rax,	1
	mov	rbx,	0
	int 80h

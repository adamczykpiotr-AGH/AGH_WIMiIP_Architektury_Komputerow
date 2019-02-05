extern scanf
extern printf


section .data

	format	db	"%s",0
	napis	db	"Wprowadz ciag znakow (bez spacji): ",0

	licznik	dd	0

	format2	db	"Ciag znakow zawiera %d liter 'a'.",10,0

section .bss
	tekst	resb  	500
section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	tekst
	call scanf

	mov	ebx,	0
	mov	r8d,	0


_petla:
	cmp byte [tekst+ebx-1], "a"
	jne _dalej

	inc	r8d

_dalej:
	inc	ebx
	
	cmp 	ebx,	500
	jb _petla


_koniec:

	mov	[licznik],	r8d
	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[licznik]
	call printf

	mov	rax,	1
	mov	rbx,	0
	int 80h

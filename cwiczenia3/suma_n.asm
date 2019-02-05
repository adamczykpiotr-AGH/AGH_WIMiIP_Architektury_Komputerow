extern scanf
extern printf

section .data
	poczatek	dd	0
	przesuniecie	dd	0
	suma		dd	0
	format		db	"%d",0
	napis1		db	"Podaj poczatek przedzialu: ",0
	napis2		db	"Podaj ilość wyrazow: ",0
	format2		db	"Suma: %d",10,0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis1
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	poczatek
	call scanf

	xor	rax,	rax
	mov	rdi,	napis2
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	przesuniecie
	call scanf


	mov	eax,	[poczatek]
	mov	ebx,	[przesuniecie]
	mov	ecx,	0
	inc	ebx


_dodawanie:

	add	ecx,	eax
	inc	eax
	dec	ebx
	cmp	ebx,	0
	ja _dodawanie

	mov	dword [suma], ecx


	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[suma]
	call printf


	mov	rax,	1
	mov	rbx,	0
	int 80h

extern printf

section .data

	licznik	dd	127
	format	db	"%c",10,0

section .text
global main
main:

;petla inkrementowana
_petla:
	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	127
	sub	rsi,	[licznik]
	call printf

	dec	dword [licznik]
	cmp	dword [licznik],	0
	ja _petla

	mov	rax,	1
	mov	rbx,	0
	int 80h

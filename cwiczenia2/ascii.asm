extern printf

section .data

	licznik	dd	0
	format	db	"%c",10,0

section .text
global main
main:

;petla inkrementowana
_petla:
	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	[licznik]
	call printf

	inc	dword [licznik]
	cmp	dword [licznik],	128
	jb _petla

	mov	rax,	1
	mov	rbx,	0
	int 80h

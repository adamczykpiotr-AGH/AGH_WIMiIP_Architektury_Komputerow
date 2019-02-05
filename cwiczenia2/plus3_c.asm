extern printf

section .data
	liczba	dd	2
	format 	db 	"%d",10,0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	[liczba]
	call printf


	add dword [liczba], 3
	cmp dword [liczba], 14
	jbe main


	mov	rax,	1
	mov	rbx,	0
	int 80h
	



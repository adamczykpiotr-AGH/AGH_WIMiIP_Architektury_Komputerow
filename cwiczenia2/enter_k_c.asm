extern scanf

section .data
	znak	db	"",0
	format	db	"%c",0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	znak
	call scanf

	cmp byte [znak], "k"
	jne main

	mov	rax,	1
	mov	rbx,	0
	int 80h

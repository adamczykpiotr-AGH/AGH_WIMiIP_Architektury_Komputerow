extern scanf
extern printf

section .data
	napis	db	"Wprowadz znak: ",0
	format	db	"%c",0
	znak	db	"",0


section .text
global main
main:


	xor	rax,	rax
	mov	rdi,	napis
	call printf

_petla:

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	znak
	call scanf

	xor	rax,	rax
	mov	rdi,	znak
	call printf


jmp _petla

	mov	rax,	1
	mov	rbx,	0
	int 80h

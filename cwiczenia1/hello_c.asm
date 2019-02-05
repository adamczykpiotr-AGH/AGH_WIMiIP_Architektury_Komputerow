extern printf

section .data
	text	db	"Hello World!",10,0

section .text

global main
main:

	xor	rax,	rax
	mov	rdi,	text
	call printf

	mov	rax,	1
	mov	rbx,	0
	int 80h

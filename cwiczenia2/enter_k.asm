section .data
	znak 	db	"",0

section .text
global _start:

_start:

	mov	rax,	3
	mov	rbx,	0
	mov	rcx,	znak
	mov	rdx,	1
	int 80h

	cmp byte [znak], "k"
	jne _start

	mov	rax,	1
	mov	rbx,	0
	int 80h

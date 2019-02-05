extern scanf
extern printf

section .data
	licznik	dd	0
	silnia	dd	1
	format	db	"%d",0
	napis	db	"Wprowadz liczbe: ",0
	format2	db	"Silnia wynosi %d.",10,0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	licznik
	call scanf


_petla:
	mov     ecx,	[silnia] 
	imul	ecx,	[licznik]

	mov	[silnia], ecx

	dec dword [licznik]

	cmp	dword [licznik],	0
	ja _petla

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi, 	[silnia]
	call printf


	mov	rax,	1
	mov	rbx,	0
	int 80h

extern scanf
extern printf

section .data
	format	db	"%u",0
	poziom	dd	0
	pion	dd	0
	znak	db	"* ",0
	endl	db	10,0
	napis	db	"Podaj rozmiar trojkata rownobocznego: ",0

section .text

global main
main:

	xor	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	poziom
	call scanf

	mov	ebx, [poziom]
	mov	[pion],	ebx

_petla_pozioma:

	xor	rax,	rax
	mov	rdi,	znak
	call printf

	dec	dword [poziom]
	cmp	dword [poziom],	0
	ja _petla_pozioma

	xor	rax,	rax
	mov	rdi,	endl
	call printf

	dec	dword [pion]

	mov	ebx,	[pion]
	mov	[poziom],	ebx

	cmp	dword [pion], 0
	ja _petla_pozioma

	

	mov	rax,	1
	mov	rbx,	0
	int 80h

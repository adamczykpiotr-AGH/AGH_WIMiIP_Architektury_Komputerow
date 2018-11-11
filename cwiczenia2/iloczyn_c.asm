extern scanf
extern printf

section .data
	format	db	"%d",0
	napis	db	"Wprowadz pierwsza liczbe: ",0
	napis2	db	"Wprowadz druga liczbe: ",0

	liczba	dd	0
	liczba2	dd	0

	iloczyn dd	1


	format2	db	"Iloczyn  przedzialu wynosi %d.",10,0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	liczba
	call scanf

	xor	rax,	rax
	mov	rdi,	napis2
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	liczba2
	call scanf



	mov	edx,	[liczba2]
	mov	ecx,	1

_petla:

	imul	ecx,	[liczba]
	inc dword [liczba]

	cmp	dword [liczba],	edx
	jbe _petla

	mov	[iloczyn], ecx
	
	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi, 	[iloczyn]
	call printf


	mov	rax,	1
	mov	rbx,	0
	int 80h

extern scanf
extern printf


section .data

	liczba	dd	0
	format	db	"%d",0
	napis	db	"Wprowadz liczbe: ",0
	minus	db	"Liczba jest mniejsza od zera.",10,0
	rowna	db	"Liczba jest rowna zero.",10,0
	plus	db	"Liczba jest wieksza od zera.",10,0

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


	cmp dword [liczba], 0
	;jl _mniejsza
	je _rowna
	jg _wieksza

_mniejsza:
	xor	rax,	rax
	mov	rdi,	minus
	call printf
	jmp _koniec
	
_rowna:
	xor	rax,	rax
	mov	rdi,	rowna
	call printf
	jmp _koniec

_wieksza:
	xor	rax,	rax
	mov	rdi,	plus
	call printf

_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h

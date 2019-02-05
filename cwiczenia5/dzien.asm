extern scanf
extern printf


section .data
	napis	db	"Podaj liczbe: ",0
	format	db	"%d",0
	napis2	db	"Nie mogę przypisać dnia",10,0

	liczba	dd	0

	case	dq	_case1, _case2, _case3, _case4, _case5, _case6, _case7

	d1	db	"Poniedziałek",10,0
	d2	db	"Wtorek",10,0
	d3	db	"Środa",10,0
	d4	db	"Czwartek",10,0
	d5	db	"Piatek",10,0
	d6	db	"Sobota",10,0
	d7	db	"Niedziela",10,0




section .text
global main
main:


	xor 	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	liczba
	call scanf

	xor	ebx,	ebx

	cmp 	dword [liczba],	1
	jl _default

	cmp	dword [liczba],	7
	jg _default
	
	mov	ebx,	[liczba]


	jmp	[case+ebx*8-8]

_case1:

	xor	rax,	rax
	mov	rdi,	d1
	call printf
	jmp _koniec

_case2:

	xor	rax,	rax
	mov	rdi,	d2
	call printf
	jmp _koniec


_case3:

	xor	rax,	rax
	mov	rdi,	d3
	call printf
	jmp _koniec

_case4:

	xor	rax,	rax
	mov	rdi,	d4
	call printf
	jmp _koniec

_case5:

	xor	rax,	rax
	mov	rdi,	d5
	call printf
	jmp _koniec

_case6:

	xor	rax,	rax
	mov	rdi,	d6
	call printf
	jmp _koniec

_case7:

	xor	rax,	rax
	mov	rdi,	d7
	call printf
	jmp _koniec


_default:
	xor	rax,	rax
	mov	rdi,	napis2
	call printf



_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h

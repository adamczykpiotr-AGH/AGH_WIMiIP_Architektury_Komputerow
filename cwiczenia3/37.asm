extern printf
extern scanf

section .data
	format	db	"%d",0
	napis	db	"Podaj liczbe: ",0
	liczba	dd	0
	tak	db	"Podana liczba jest podzielna przez 3 lub reszta z dzielenia tej liczby przez 7 wynosi 2.",10,0
	nie	db	"Podana liczba nie jest podzielna przez 3 lub reszta z dzielenia tej liczby przez 7 nie wynosi 2.",10,0

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

	mov	edx,	0
	mov	eax,	dword [liczba]
	mov	ecx,	3
	idiv 	ecx

	cmp	edx,	0
	je _jest

	mov	edx,	0
	mov	eax,	dword [liczba]
	mov	ecx,	7
	div 	ecx
	
	cmp 	edx,	2
	je _jest
	jne _niejest	

_jest:
	xor	rax,	rax
	mov	rdi,	tak
	call printf
	jmp _koniec


_niejest:
	xor	rax,	rax
	mov	rdi,	nie
	call printf

_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h
	

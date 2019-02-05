extern scanf
extern printf


section .data
	napis	db	"Podaj dzialanie (+ lub -): ",0
	napis2	db 	"Podaj pierwsza liczbe: ",0
	napis3	db	"Podaj druga liczbe: ",0

	format	db	"%c",0
	format2	db	"%d",0
	format3 db 	"Wynik to: %d",10,0

	liczba	dd	0
	liczba2	dd	0

	znak	db	"",0


section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	znak
	call scanf

	xor	rax,	rax
	mov	rdi,	napis2
	call printf

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	liczba
	call scanf

	xor	rax,	rax
	mov	rdi,	napis3
	call printf

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	liczba2
	call scanf

	cmp byte [znak], "+"
	je _dodawanie

	cmp byte [znak], "-"
	je _odejmowanie

	jmp _koniec


_dodawanie:
	mov	eax,	[liczba2]
	add [liczba],	eax

	xor	rax,	rax
	mov	rdi,	format3
	mov	rsi,	[liczba]
	call printf

	jmp _koniec


_odejmowanie:

	mov	eax,	[liczba2]
	sub [liczba],	eax

	xor	rax,	rax
	mov	rdi,	format3
	mov	rsi,	[liczba]
	call printf

_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h




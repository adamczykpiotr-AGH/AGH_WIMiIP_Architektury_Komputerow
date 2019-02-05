extern scanf
extern printf


section .data
	format	db	"%d",0
	napis1	db	"Podaj ilosc wyrazow ciagu: ",0
	napis2	db	"Podaj liczbe: ",0
	napis3	db	"Parzyste liczby sposrod wprowadzonych, to:",0
	licznik	dd	0
	temp	dd	0
	tab TIMES 500	dd	0
	format2	db	" %d,",0
	endl	db	10,0

section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis1
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	licznik
	call scanf

	mov	ebx,	0

_petla_wpisywanie:
	
	xor	rax,	rax
	mov	rdi,	napis2
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	temp
	call scanf

	mov	r8d,	[temp]
	mov	[tab+4*ebx+4],	r8d

	inc	ebx
	cmp	ebx,	[licznik]
	jb _petla_wpisywanie


	mov	ebx,	0


	xor	rax,	rax
	mov	rdi,	napis3
	call printf
;dziala dotad


_sprawdzanie:	

	mov	edx,	0
	mov	eax,	[tab+4*ebx+4]
	mov	ecx,	2
	idiv	ecx

	cmp	edx,	0
	jne _dalej

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[tab+4*ebx+4]
	call printf	

_dalej:
	inc	ebx
	cmp	ebx,	[licznik]
	jb _sprawdzanie


_koniec:

	xor	rax,	rax
	mov	rdi,	endl
	call printf

	mov	rax,	1
	mov	rbx,	0
	int 80h




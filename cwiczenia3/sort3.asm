extern scanf
extern printf

section .data
	napis1	db	"Podaj pierwsza liczbe: ",0
	napis2	db	"Podaj druga liczbe: ",0
	napis3	db	"Podaj trzecia liczbe: ",0 

	liczba1	dd	0
	liczba2	dd	0
	liczba3	dd	0

	format	db	"%d",0
	format2	db	"Posortowane liczby to:	%d, %d, %d",10,0

section .text
global main
main:

	xor	rax,	rax
	mov 	rdi,	napis1
	call printf
	
	xor 	rax,	rax
	mov 	rdi,	format
	mov	rsi,	liczba1
	call scanf

	xor	rax,	rax
	mov 	rdi,	napis2
	call printf
	
	xor 	rax,	rax
	mov 	rdi,	format
	mov	rsi,	liczba2
	call scanf

	xor	rax,	rax
	mov 	rdi,	napis3
	call printf
	
	xor 	rax,	rax
	mov 	rdi,	format
	mov	rsi,	liczba3
	call scanf


	mov	eax,	[liczba1]
	mov	ebx,	[liczba2]
	mov	ecx,	[liczba3]

_czy_nie_rowne:

	cmp	eax,	ebx
	jne _szukaj_najwiekszej_1
	cmp 	eax,	ecx
	je _koniec
	;wszystkie liczby sa rowne


_szukaj_najwiekszej_1:
	cmp	eax,	ebx
	jl	_szukaj_najwiekszej_2
	cmp	eax,	ecx
	jl	_szukaj_najwiekszej_3
	mov 	[liczba3],	eax
	jmp _szukaj_dalej
	;liczba 1 jest najwieksza


_szukaj_najwiekszej_2:
	cmp	ebx,	eax
	jl	_szukaj_najwiekszej_3
	cmp	ebx,	ecx
	jl	_szukaj_najwiekszej_3
	mov 	[liczba3],	ebx
	jmp 	_szukaj_dalej
	;liczba 2 jest najwieksza

_szukaj_najwiekszej_3:
	cmp	ecx,	eax
	jl	_szukaj_dalej
	cmp	ecx,	ebx
	jl	_szukaj_dalej
	mov 	[liczba3],	ecx
	jmp 	_szukaj_dalej
	;liczba 3 jest najwieksza

_szukaj_dalej:


_szukaj_najmniejszej_1:
	cmp	eax,	ebx
	jg	_szukaj_najmniejszej_2	
	cmp	eax,	ecx
	jg	_szukaj_najmniejszej_2	
	mov 	[liczba1],	eax
	jmp	_szukaj_jeszcze_dalej
	;liczba 1 jest najmniejsza

_szukaj_najmniejszej_2:
	cmp	ebx,	eax
	jg	_szukaj_najmniejszej_3	
	cmp	ebx,	ecx
	jg	_szukaj_najmniejszej_3	
	mov 	[liczba1],	ebx
	jmp	_szukaj_jeszcze_dalej
	;liczba 2 jest najmniejsza


_szukaj_najmniejszej_3:
	cmp	ecx,	eax
	jg	_szukaj_jeszcze_dalej
	cmp	ecx,	ebx
	jg	_szukaj_jeszcze_dalej
	mov 	[liczba1],	ecx
	jmp	_szukaj_jeszcze_dalej
	;liczba 3 jest najmniejsza


_szukaj_jeszcze_dalej:

	
_szukaj_sredniej_1:
	cmp	eax,	[liczba1]
	je _szukaj_sredniej_2
	cmp	eax,	[liczba3]
	je _szukaj_sredniej_2
	mov	[liczba2],	eax
	jmp _koniec
	;liczba 1 jest srednia

_szukaj_sredniej_2:
	cmp	ebx,	[liczba1]
	je _szukaj_sredniej_3
	cmp	ebx,	[liczba3]
	je _szukaj_sredniej_3
	mov	[liczba2],	ebx
	jmp _koniec
	;liczba 2 jest srednia

_szukaj_sredniej_3:
	cmp	ecx,	[liczba1]
	je _koniec
	cmp	ecx,	[liczba3]
	je _koniec
	mov	[liczba2],	ecx
	jmp _koniec
	;liczba 3 jest srednia


_koniec:
	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[liczba1]
	mov	rdx,	[liczba2]
	mov	rcx,	[liczba3]
	call printf

	mov	rax,	1
	mov	rbx,	0
	int 80h

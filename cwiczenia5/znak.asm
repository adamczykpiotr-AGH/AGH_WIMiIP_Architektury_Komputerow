extern scanf
extern printf


section .data
	
	napis1	db	"Podaj pierwsza liczbe: ",0
	napis2	db	"Podaj druga liczbe: ",0
	napis3	db	"Podaj znak operacji (+ - * /): ",0
	napis4	db	10,"Podano zły znak dzialania.",10,0

	format	db	"%d",0
	format2	db	"%c",0
	format3	db	10,"Suma wynosi: %d",10,0
	format4	db	10,"Różnica wynosi: %d",10,0
	format5	db	10,"Iloraz wynosi: %d reszta %d",10,0
	format6	db	10,"Iloczyn wynosi: %d",10,0

	liczba1	dd	0
	liczba2	dd	0
	wynik1	dd	0
	wynik2	dd	0

	znak	db	""

	case	dq	_default, _mnozenie, _dodawanie, _default, _odejmowanie, _default, _dzielenie


section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis3
	call printf

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	znak
	call scanf
	
	xor	rax,	rax
	mov	rdi,	napis1
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	liczba1
	call scanf

	xor	rax,	rax
	mov	rdi,	napis2
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	liczba2
	call scanf

	xor	rbx,	rbx

	mov	bl,	[znak]
	cmp	bl,	42
	jl _default
	
	cmp	bl,	47
	jg _default

	sub	bl,	41
	jmp [case+ebx*8]
	
_dodawanie:

	mov	ebx,	[liczba1]
	mov	r8d,	[liczba2]
	add	r8d,	ebx
	mov	[wynik1],	r8d

	xor	rax,	rax
	mov	rdi,	format3
	mov	rsi,	[wynik1]
	call printf
	jmp _koniec
	
_odejmowanie:

	mov	r8d,	[liczba1]
	mov	ebx,	[liczba2]
	sub	r8d,	ebx
	mov	[wynik1],	r8d

	xor	rax,	rax
	mov	rdi,	format4
	mov	rsi,	[wynik1]
	call printf
	jmp _koniec

_dzielenie:

	mov	edx,	0
	mov	eax,	[liczba1]
	mov	ecx,	[liczba2]
	idiv ecx

	mov	[wynik1],	eax
	mov 	[wynik2],	edx

	xor	rax,	rax
	mov	rdi,	format5
	mov	rsi,	[wynik1]
	mov	rdx,	[wynik2]
	call printf
	jmp _koniec

_mnozenie:

	mov	ebx,	[liczba1]
	mov	r8d,	[liczba2]
	imul	r8d,	ebx

	mov	[wynik1],	r8d

	xor	rax,	rax
	mov	rdi,	format6
	mov	rsi,	[wynik1]
	call printf
	jmp _koniec

_default:

	xor	rax,	rax
	mov	rdi,	napis4
	call printf

_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h

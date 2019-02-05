extern scanf
extern printf

section .data
	napis1	db	"Podaj dlugosc ciagu: ",0
	napis2	db	"Podaj wartosc: ",0
	napis3	db	"Liczby, ktorych wartosc jest kwadratem indeksu:",0
	format	db	"%d",0
	format2	db	" %d,",0
	endl	db	10,0
	dlugosc	dd	0
	temp	dd	0
	temp2	dd	0
	ciag	TIMES 500 dd	0


section .text
global main
main:

	xor	rax,	rax
	mov	rdi,	napis1
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	dlugosc
	call scanf


	mov	rbx,	0

_petla_wpisywanie:

	xor	rax,	rax
	mov	rdi,	napis2
	call printf
	
	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	temp
	call scanf
	
	mov	r8d,	[temp]
	mov	[ciag+ebx*4],	r8d

	inc 	ebx
	cmp	ebx,	[dlugosc]
	jl _petla_wpisywanie	
	

	mov	ebx,	0

	xor	rax,	rax
	mov	rdi,	napis3
	call printf

_sprawdzanie:
	inc 	ebx
	mov	r8d,	ebx
	imul	r8d,	r8d
	
	cmp	r8d, [ciag+ebx*4-4]	

	jne _dalej
	

_jest:
	mov	[temp],	ebx

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[temp]
	call printf


_dalej:

	cmp	ebx,	[dlugosc]
	jl _sprawdzanie	


	xor	rax,	rax
	mov	rdi,	endl	
	call printf

_koniec:

	mov	rax,	1
	mov	rbx,	0
	int 80h

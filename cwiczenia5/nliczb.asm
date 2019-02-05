extern scanf
extern printf


section .data
	format	db	"%d",0
	licznik	dd	0
	licznik2	dd	0
	minimum	dd	0
	tablica	TIMES	500	dd	0
	napis1	db	"Wprowadz ilosc liczb: ",0
	napis2	db	"Wprowadz liczbe: ",0
	temp	dd	0
	format2	db	"Najmniejsza licznik to: %d",10,0


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

;skopiuj liczbe
	mov	ebx,	[licznik]
	mov	[licznik2],	ebx

	mov	ebx,	0


_petla:
	xor	rax,	rax
	mov	rdi,	napis2
	call printf

	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	temp
	call scanf

	mov	r8d,	[temp]
	mov	dword [tablica+4*ebx+4], r8d

	inc 	ebx
	cmp 	ebx,	[licznik]
	jb _petla




	mov	ebx,	0
	mov	r8d,	2147483647

_sprawdzanie_petla:
	
	inc	ebx 		;=(4*ebx+1)

	cmp [tablica+4*ebx],	r8d
	jge _dalej

_kopiuj:
	mov	r8d,	[tablica+4*ebx]

_dalej:

	cmp 	ebx,	[licznik2]
	jb _sprawdzanie_petla

	mov	[minimum],	r8d


	

;wpisywanie najmniejszej

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[minimum]
	call printf



	mov	rax,	1
	mov	rbx,	0
	int 80h

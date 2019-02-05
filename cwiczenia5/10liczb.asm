extern scanf
extern printf

section .data
	tablica TIMES 20 	dd	0
	napis	db	"Podaj liczbę: ",0
	format	db	"%d",0
	temp	dd	0
	licznik	dd	10
	napis2	db	"Wprowadzone liczby to:",0
	format2	db	" %d,",0
	endl	db	10,0


section .text
global main
main:

	mov	ebx,	0

_petla:
	xor	rax,	rax
	mov	rdi,	napis
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


	mov	rbx,	0

	xor	rax,	rax
	mov	rdi,	napis2
	call printf
	

_wyswietlanie:	

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[tablica+4*ebx+4]
	call printf	

	inc	ebx

	cmp	ebx,	[licznik]
	jb _wyswietlanie




_ostatnia:

	xor	rax,	rax
	mov	rdi,	endl
	call printf	


	mov	rax,	1
	mov	rbx,	0
	int 80h

	

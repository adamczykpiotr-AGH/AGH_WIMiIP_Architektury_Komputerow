extern printf
extern scanf

section .data
	format	db	"%d",0
	napis	db	"Podaj liczbe: ",0
	liczba	dd	0
	wynik	dd	0
	parz	db	"Podana liczba jest parzysta.",10,0
	nparz	db	"Podana liczba jest nieparzysta.",10,0	


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


	mov edx, 0     
	mov eax, dword [liczba]
	mov ecx, 2   
	div ecx     

	cmp	edx,	1
	je _nparz
	cmp	edx,	0
	je _parz

_parz:
	xor	rax,	rax
	mov	rdi,	parz
	call printf
	jmp _koniec


_nparz:
	xor	rax,	rax
	mov	rdi,	nparz
	call printf


_koniec:
	mov	rax,	1
	mov	rbx,	0
	int 80h

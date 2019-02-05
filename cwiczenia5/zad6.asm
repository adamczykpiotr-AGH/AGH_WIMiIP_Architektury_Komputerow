extern scanf
extern printf

section .data
	napis	db	"Wpisz liczbe: ",0
	format	db	"%d",0
	format2	db	10,"Srednia arytmetyczna wynosi %d reszty %d.",10,"Suma wynosi: %d",10,"Suma kwadratow wynosi: %d.",10,0

	temp	dd	0
	ilosc	dd	0
	suma	dd	0
	avgint	dd	0
	avgmod	dd	0
	kwadrat	dd	0

	tab	TIMES 20	dd	0

section .text
global main
main:

	xor	ebx,	ebx

_petla:
	xor	rax,	rax
	mov	rdi, 	napis
	call printf
	
	xor	rax,	rax
	mov	rdi,	format
	mov	rsi,	temp
	call scanf

	mov	r8d,	[temp]
	mov	[tab+4*ebx],	r8d
	
	inc	ebx
	
	cmp	dword [temp],	0
	je _dalej

	cmp	ebx,	10
	jb _petla	


_dalej:

	mov	[ilosc],	ebx

	xor	ebx,	ebx
	xor	r8d,	r8d

	
_dodaj:
	
	add	r8d,	[tab+4*ebx]

	inc	ebx
	cmp	ebx,	[ilosc]
	jb _dodaj
	
	mov	[suma],	r8d

_srednia:
	
	mov	edx,	0
	mov	eax,	[suma]
	mov	ecx,	[ilosc]
	idiv	ecx,

	mov	[avgint],	eax
	mov	[avgmod],	edx

;liczenie sumy kwadratow

	xor	ebx,	ebx
	xor	r8d,	r8d

	
_kwadrat:
	mov	r9d,	[tab+4*ebx]
	imul	r9d,	r9d
	add	r8d,	r9d

	inc	ebx
	cmp	ebx,	[ilosc]
	jb _kwadrat
	
	mov	[kwadrat],	r8d

_koniec:

	xor	rax,	rax
	mov	rdi,	format2
	mov	rsi,	[avgint]
	mov	rdx,	[avgmod]	
	mov	rcx,	[suma]
	mov	r8,	[kwadrat]
	call printf


	mov	rax,	1
	mov	rbx,	0
	int 80h

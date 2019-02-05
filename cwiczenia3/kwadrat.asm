extern printf
extern scanf
 
section .data
    wiersz  dd  0
    kolumna dd  0
    format  db  "%d",0
    napis   db  "Podaj rozmiar kwadratu: ",0
    znak    db  "* ",0
    endl    db  10,0
 
section .text
global main
main:
   
    xor     rax,    rax
    mov rdi,    napis
    call printf
 
    xor rax,    rax
    mov rdi,    format
    mov rsi,    wiersz
    call scanf
 
    mov ebx,    [wiersz]
    mov [kolumna],  ebx
 
_petla_pozioma:
    xor rax,    rax
    mov rdi,    znak
    call printf
 
    dec dword [wiersz]
    cmp dword [wiersz], 0
    ja _petla_pozioma
 
    xor rax,    rax
    mov rdi,    endl
    call printf
 
;petla pionowa
    mov [wiersz], ebx
    dec     dword [kolumna]
    cmp dword [kolumna] ,0
    ja _petla_pozioma
 
 
_koniec:
 
    xor rax,    rax
    mov rdi,    endl
    call printf
 
    mov rax,    1
    mov rbx,    0
    int 80h
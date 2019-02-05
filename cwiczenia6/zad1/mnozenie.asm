section .text
global mnozenie

mnozenie:

mov	rax,	rdi
mov	rbx, 	rsi
imul	rbx

mov	rbx,	rax


_koniec:
ret


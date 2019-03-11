section .text
	global _ft_strcat

_ft_strcat:
	push rdi
	mov rax, rdi
	dec rdi

while_len:
	inc rdi
	cmp byte[rdi], 0
	jne while_len

while:
	cmp byte[rsi], 0
	je end
	mov r8b, byte[rsi]
	mov byte[rdi], r8b
	inc rdi
	inc rsi
	jmp while

end:
	mov byte[rdi], 0
	pop rdi
	ret

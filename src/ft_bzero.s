section .text
	global _ft_bzero

_ft_bzero:
	push rsi
	push rdi
	cmp rsi, 0
	jle end_ft_bzero
	mov byte[rdi], 0
	dec rsi
	inc rdi
	call _ft_bzero

end_ft_bzero:
	pop rdi
	pop rsi
	ret

section .text
	global _ft_memcpy

_ft_memcpy:
	mov rax, rdi
	cmp rdx, 0
	je end
	push r8

while:
	mov r8b, byte[rsi]
	mov byte[rdi], r8b
	dec rdx
	inc rdi
	inc rsi
	cmp rdx, 0
	jne while
	pop r8

end:
  ret

section .text
	global _ft_isalnum
	extern _ft_isalpha
	extern _ft_isdigit

_ft_isalnum:
	push r8
	call _ft_isalpha
	mov r8, rax
	call _ft_isdigit
	or rax, r8
	pop r8
	ret

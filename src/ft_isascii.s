section .text
	global _ft_isascii

_ft_isascii:
	cmp rdi, 0
	jl fail
	cmp rdi, 127
	jg fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret

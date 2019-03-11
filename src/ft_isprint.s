section .text
	global _ft_isprint

_ft_isprint:
	cmp rdi, 32
	jl fail
	cmp rdi, 126
	jg fail
	mov rax, 1
	ret

fail:
	xor rax, rax
	ret

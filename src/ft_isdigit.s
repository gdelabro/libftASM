section .text
	global _ft_isdigit

_ft_isdigit:
	cmp rdi, 48
	jl ret_0
	cmp rdi, 57
	jg ret_0
	jmp ret_1

ret_0:
	mov rax, 0
	ret

ret_1:
	mov rax, 1
	ret

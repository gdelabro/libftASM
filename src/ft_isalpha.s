section .text
	global _ft_isalpha

_ft_isalpha:
	cmp rdi, 65
	jl ret_0
	cmp rdi, 122
	jg ret_0
	cmp rdi, 90
	jle ret_1
	cmp rdi, 97
	jge ret_1
	jmp ret_0

ret_0:
	mov rax, 0
	ret

ret_1:
	mov rax, 1
	ret

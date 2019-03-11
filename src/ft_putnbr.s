section .text
	global _ft_putnbr

_ft_putnbr:
	cmp edi, -2147483648
	je special_ret
	cmp edi, 0
	jl neg_number
	cmp edi, 10
	jl under_10

greater_10:
	mov rcx, 10
	mov rax, rdi
	mov rdx, 0
	div rcx
	mov rdi, rax
	push rdx
	call _ft_putnbr
	pop rdx
	mov rax, 0x2000004
	mov rdi, 1
	add edx, 48
	push rdx
	mov rsi, rsp
	pop rdx
	mov rdx, 1
	syscall
	ret

under_10:
	mov rax, 0x2000004
	add rdi, 48
	push rdi
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 1
	syscall
	pop rdi
	ret

neg_number:
	push rdi
	mov rax, 0x2000004
	mov rdi, 1
	lea rsi, [rel neg_sign]
	mov rdx, 1
	syscall
	pop rdi
	imul edi, -1
	call _ft_putnbr
	ret

special_ret:
	mov rax, 0x2000004
	mov rdi, 1
	lea rsi, [rel special_number]
	mov rdx, len_spec
	syscall
	ret

section .data
	neg_sign: db "-"
	special_number: db "-2147483648"
	len_spec: equ $ - special_number

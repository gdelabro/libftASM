section .text
  global _ft_cat
  extern _breh

_ft_cat:
	enter 0, 0
	cmp edi, 0
	jl end

while:
	mov rax, 0x2000003
	lea rsi, [rel buf]
	mov rdx, 256
	syscall
	jc end
	cmp rax, 0
	jle end
	push rdi
	mov rdi, 1
	lea rsi, [rel buf]
	mov rdx, rax
	mov rax, 0x2000004
	syscall
	jc end
	pop rdi
	jmp while

end:
	leave
	ret

section .bss
	buf resb 256

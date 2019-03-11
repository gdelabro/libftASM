section .text
	global _ft_memset

_ft_memset:
	mov rax, rdi
	cmp rdx, 0
	je end
	push rdx
	push rdi

while:
	mov byte[rdi], sil
	dec rdx
	inc rdi
	cmp rdx, 0
	jne while
	pop rdi
	pop rdx

end:
	ret

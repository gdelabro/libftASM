section .text
	global _ft_abs

_ft_abs:
	mov eax, edi
	cmp edi, 0
	jge end
	imul eax, -1

end:
	ret

section .text
  global _ft_toupper

_ft_toupper:
  mov rax, rdi
  cmp rax, 97
  jl not_low
  cmp rax, 122
  jg not_low
  sub rax, 32
  ret

not_low:
  ret

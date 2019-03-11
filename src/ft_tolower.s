section .text
  global _ft_tolower

_ft_tolower:
  mov rax, rdi
  cmp rax, 65
  jl not_upp
  cmp rax, 90
  jg not_upp
  add rax, 32
  ret

not_upp:
  ret

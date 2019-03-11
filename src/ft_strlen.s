section .text
  global _ft_strlen

_ft_strlen:
  push rdi
  push rcx
  xor rcx, rcx
  dec rcx
  dec rdi

while:
  inc rcx
  inc rdi
  cmp byte[rdi], 0
  jne while
  mov rax, rcx
  pop rcx
  pop rdi
  ret

section .text
  global _ft_strdup
  extern _malloc
  extern _ft_strlen
  extern _ft_strcat

_ft_strdup:
  cmp rdi, 0
  je ret_null
  call _ft_strlen
  push rdi
  mov rdi, rax
  inc rdi
  call _malloc
  pop rsi
  mov rdi, rax
  mov byte[rdi], 0
  push rdi
  call _ft_strcat
  pop rax
  ret

ret_null:
  xor rax, rax
  ret

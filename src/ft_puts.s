section .text
  global _ft_puts
  extern _ft_strlen

_ft_puts:
  cmp rdi, 0
  je null
  call _ft_strlen
  mov rsi, rdi
  mov rdi, 1
  mov rdx, rax
  mov rax, 0x2000004
  syscall
  mov rax, 0x2000004
  lea rsi, [rel endl]
  mov rdx, 1
  syscall
  mov rax, 10
  ret

null:
  mov rax, 0x2000004
  mov rdi, 1
  lea rsi, [rel null_line]
  mov rdx, 7
  syscall
  mov rax, 10
  ret

section .data
  endl: db 10, 0
  null_line: db "(null)", 10, 0

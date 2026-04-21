  .cdecls "msp430.h"
  .global main
  
  .text

main:
  mov.w    #(WDTPW|WDTHOLD), &WDTCTL  ; Desativa o watchdog

  call     #fib16

  jmp      end_main
  nop

fib16:
  mov.w    #24, R12

  call     #fib

  ret

fib:
  push     R4
  push     R5
  push     R6

  mov.w    R12, R4

  cmp.w    #3, R12
  jl       base_case

  ; Calcula fib(n-1)
  sub.w    #1, R12
  call     #fib
  mov.w    R12, R5

  ; Calcula fib(n-2)
  mov.w    R4, R12
  sub.w    #2, R12
  call     #fib
  mov.w    R12, R6

  add.w    R5, R6
  mov.w    R6, R12
  jmp      end_fib
base_case:
  mov.w    #1, R12
end_fib:
  pop      R6
  pop      R5
  pop      R4
  ret

end_main:
  jmp      $
  nop

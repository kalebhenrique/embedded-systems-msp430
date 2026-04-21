  .cdecls "msp430.h"
  .global main
  
  .data

vetor:  .byte   1, 2, 3, 4

main:
  mov.w    #(WDTPW|WDTHOLD), &WDTCTL         ; Desativa o watchdog

  mov.w    #vetor, R12
  mov.b    #4, R13
  mov.w    #0, R6

  call     #reduceSum8

end:
  mov.w    R6, R12
  jmp      $
  nop

reduceSum8:
  cmp     #0, R13
  jz      end

  add.b   @R12+, R6
  dec     R13
  jmp     reduceSum8
  ret

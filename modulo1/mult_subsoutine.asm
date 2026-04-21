  .cdecls "msp430.h"
  .global main
  
  .data

main:
  mov.w    #(WDTPW|WDTHOLD), &WDTCTL         ; Desativa o watchdog

  mov.b    #2, R12
  mov.b    #5, R13

  call     #mult8

  jmp      $
  nop

mult8:
  push    R4
  push    R5
  push    R6

  clr.w   R6

  mov.b   R12, R4
  mov.b   R13, R5

  call    #loop

  mov.w   R6, R12
  
  pop     R4
  pop     R5
  pop     R6
  ret

loop:
  tst.w   R5
  jz      end

  add.w   R4, R6
  dec.b   R5
  jmp     loop
  nop

end:
  ret

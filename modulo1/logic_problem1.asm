  .cdecls "msp430.h"
  .global main
  
  .data

main:
  mov.w    #(WDTPW|WDTHOLD), &WDTCTL         ; Desativa o watchdog

  mov.w    #2, R4
  mov.w    #-5, R5

  mov.w    R4, R6
  add.w    R5, R6

  tst      R6
  jz       do_nothing
  jn       dec1
  
  jmp      inc1

dec1:
  dec     R6
  jmp     end

inc1:
  inc      R6
  jmp      end

do_nothing:
  jmp     end

end:
  jmp      $
  nop

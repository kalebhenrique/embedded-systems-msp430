  .cdecls "msp430.h"
  .global main
  
  .data

main:
  mov.w    #(WDTPW|WDTHOLD), &WDTCTL         ; Desativa o watchdog

  mov.w    #7, R12
  mov.w    #3, R13

umult16:
  push     R4
  push     R5
  push     R6
  
  mov.w    R12, R4
  mov.w    R13, R5
  mov.w    #16, R6

  clr      R12
  clr      R13
umult16_loop:
  rla      R12
  rlc      R13

  rla      R5
  jnc      umult16_next
umult16_incr:
  add      R4, R12
  adc          R13
umult16_next:
  dec      R6
  jnz      umult16_loop
umult16_ret:
  pop      R6
  pop      R5
  pop      R4

  ret

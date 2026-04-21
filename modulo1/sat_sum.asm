  .cdecls "msp430.h"
  .global main
  
  .data

main:
  mov.w   #(WDTPW|WDTHOLD), &WDTCTL         ; Desativa o watchdog

  mov.w   #0x1000, R4
  mov.w   #0x3000, R5

  add     R4, R5
  jnc     pular_sat
  mov.w   #0xFFFF, R5

  jmp $
  nop

pular_sat:
  nop

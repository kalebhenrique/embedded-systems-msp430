  .cdecls "msp430.h"
  .global main
  
  .data

vetor:  .byte   0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 16

; R12 - vetor
; R13 - size vetor
; R4 - qtd multiplos de 2
; R5 - qtd multiplos de 4
; R6 - count
; R7 - valor de comparacao
main:
  mov.w    #(WDTPW|WDTHOLD), &WDTCTL         ; Desativa o watchdog

  mov.w    #vetor, R12
  mov.b    #11, R13

  call     #m2m4

  jmp      $
  nop

m2m4:
  push    R4
  push    R5
  push    R6

  clr     R4
  clr     R5
  
  mov.b   R13, R6
  mov.b   @R12+, R7
m2m4_loop:
  tst     R7
  jeq     m2m4_next

  bit     #1, R7
  jc      m2m4_next

  bit     #2, R7
  jc     m2m4_addm2
m2m4_addm4:
  bit     #2, R7
  jc      m2m4_addm2

  inc     R5
m2m4_addm2:
  inc     R4
m2m4_next:
  dec     R6
  tst     R6
  jeq     m2m4_end

  mov.b   @R12+, R7
  jmp     m2m4_loop
m2m4_end:
  mov.b   R4, R12
  mov.b   R5, R13

  pop     R6
  pop     R5
  pop     R4
  ret

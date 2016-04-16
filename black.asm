!cpu 6502
!source "basic-loader.asm"

* = $0900

; Set background and border to black, then loop forever
ldx #$00
stx $d021
stx $d020
jmp *

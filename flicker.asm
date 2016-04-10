!cpu 6502
!source "basic-loader.asm"

* = $c000
ldx #$00
.loop
stx $d021
stx $d020
inx
jmp .loop

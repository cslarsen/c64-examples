!source "basic-loader.asm"

; Some constant memory addresses
background = $d020
border = $d021

; Start address of program
; (which the basic loader will jump to)
* = $0900

; Set background and border to black
ldx #$00
stx background
stx border

; Flicker border and backround
.loop
  inc background
  inc border
  jmp .loop

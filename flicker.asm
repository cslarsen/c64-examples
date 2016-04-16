!source "basic-boot.asm"

; Some constant memory addresses
background = $d020
border = $d021

; Start address of main program
start = $0900

; Basic booter
+boot start

; Set background and border to black
ldx #$00
stx background
stx border

; Flicker border and backround
.loop
  inc background
  inc border
  jmp .loop

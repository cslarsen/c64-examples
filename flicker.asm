!source "basic-boot.asm"

+start_at $0900

; Set background and border to black
ldx #$00
stx bgcol
stx bocol

; Flicker border and background
.loop
  inc bgcol
  inc bocol
  jmp .loop

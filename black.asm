;; Sets background and border to black, then loops forever

!source "basic-boot.asm"

+start_at $0900

ldx #$00
stx bocol
stx bgcol
jmp *

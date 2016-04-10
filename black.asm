!cpu 6502

; BASIC loader below taken from
; https://github.com/actraiser/dust-tutorial-c64-first-intro/blob/master/index.asm

* = $0801                               ; BASIC start address (#2049)
!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000...
!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152
* = $c000

; Set background and border to black, then loop forever
ldx #$00
stx $d021
stx $d020
jmp *

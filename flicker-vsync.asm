!source "basic-loader.asm"

* = $0900
sei
ldx #$00

ldy #$7f
sty $dc0d
sty $dd0d
lda $dc0d
lda $dd0d

lda #$01
sta $d01a

lda #<.flicker
ldx #>.flicker
sta $314
stx $315

; Line number, would be better ot do this on retrace
lda #$00
sta $d012

lda $d011
and #$7f
sta $d011

cli
jmp *

.flicker
  dec $d019

  ldx .color
  stx $d021
  stx $d020
  inx
  stx .color

  jmp $ea81

.color
  !byte $00

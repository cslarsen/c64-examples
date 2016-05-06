!source "basic-boot.asm"

+start_at $0900

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
lda .ypos
sta $d012

lda $d011
and #$7f
sta $d011

ldx #00
stx bocol

cli
jmp * ; loop here

.flicker
  dec $d019

  nop
  nop
  nop
  nop

  ldx #01
  stx bgcol
  stx bocol

  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop
  nop

  ldx #00
  stx bgcol
  stx bocol

  jmp $ea81

.ypos !byte 210

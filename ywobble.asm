; "wobbles" (more like staccatos) screen's yscroll

!source "basic-boot.asm"

+start_at $0900

  lda #$00
.loop
  ; Wait for vsync
  cmp $d012
  bne .loop

  ; Only alter yscroll on every nth frame
  dec .framecount
  cmp .framecount
  bne .loop

  ; Reset counter
  lda #$2a ; number of frames to skip
  ; I've tried restarting every second, but without using IRQs, it's hard to get this
  ; entirely correct
  sta .framecount

  ; Increment ypos
  inc .ypos
  lda .ypos
  and #$07
  sta .ypos

  ; Only set last three bits of $d011 (control register 1)
  lda $d011
  and #$f8
  ora .ypos
  sta $d011

  lda #$00
  jmp .loop

.ypos !byte $03
.framecount !byte $00

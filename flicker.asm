!source "basic-loader.asm"

* = $c000
.loop
inc $d020
inc $d021
jmp .loop

VMADDL      = $2116
VMADDH      = $2117
VMDATAL     = $2118
VMDATAH     = $2119
CGADDR      = $2121
CGDATA      = $2122

.p816 

.segment "SPRITEDATA"
SpriteTiles: .incbin "square.chr"
SpriteColors: .incbin "square.pal"

.segment "CODE"
.proc ResetHandler
    clc
    xce  
     
    ldx #$00    
    stz VMADDL 
    stz VMADDH

    lda #$11
    sta CGADDR

CGRAMLoop:
    lda SpriteColors, X
    sta CGDATA
    inx

    cpx #$08        ; 4 colors, 2 bytes per color
    bcc CGRAMLoop
    ldx #$00

VRAMLoop:
    lda SpriteTiles, X
    sta VMDATAL
    inx

    lda SpriteTiles, X
    sta VMDATAH
    inx

    cpx #$80        ; 4 tiles, 8 rows per tile, 4 bitplanes per row, 1 byte per bitplane
    bcc VRAMLoop
    ldx #$00
.endproc

.segment "VECTOR"
.addr ResetHandler
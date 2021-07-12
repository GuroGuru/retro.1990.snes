VMDATAL = $2118
VMDATAH = $2119

.p816 

.segment "SPRITEDATA"
SpriteData: .incbin "Sprites.vra"

.segment "CODE"
.proc ResetHandler
    clc
    xce
VRAMLoop:
    lda SpriteData, X
    sta VMDATAL
    inx

    lda SpriteData, X
    sta VMDATAH
    inx

    cpx #$80
    bcc VRAMLoop
.endproc

.segment "VECTOR"
.addr ResetHandler
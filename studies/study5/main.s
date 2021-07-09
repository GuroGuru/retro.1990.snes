.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$03
    ldx #$05
    ldy #$04

    sta $0100,X
    sta $0100,Y

    dex
    sbc #$01
    sta $0100,X

    dey
    sbc #$01
    sta $0100,Y

    dex
    sbc #$01
    sta $0100,X

    dey
    sbc #$01
    sta $0100,Y
.endproc

.segment "VECTORS"
.addr ResetHandler
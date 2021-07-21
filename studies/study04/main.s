.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$10
    sta $00
    inx

    iny
    sty $00,X
    inx

    clc
    adc #$01
    sta $00,X
.endproc

.segment "VECTORS"
.addr ResetHandler
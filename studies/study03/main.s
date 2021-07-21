.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$00
    ldx #$00
    ldy #$00

    txa
    sta $0010

    tya
    sta $0011

    tax
    stx $0012

    tay
    sty $0013
.endproc

.segment "VECTORS"
.addr ResetHandler
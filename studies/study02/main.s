.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$01
    sta $0010

    ldx #$02
    stx $0011

    ldy #$03
    sty $0012

    stz $0010
    stz $0011
    stz $0012
.endproc

.segment "VECTORS"
.addr ResetHandler
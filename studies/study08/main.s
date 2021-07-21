.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$10
    pha

    lda #$20
    pha

    lda #$30
    pha

    lda #$40
    pha

    pla
    pla
    pla
    pla

    lda #$50
    pha
.endproc

.segment "VECTORS"
.addr ResetHandler
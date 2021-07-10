.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$10

    jsr IncrementAccumulator

    lda #$50

    jsr End

IncrementAccumulator:
    lda #$20
    lda #$30
    lda #$40
    rts

End:
    brk
.endproc

.segment "VECTORS"
.addr ResetHandler
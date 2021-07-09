CGADDR = $2121
CGDATA = $2122

.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce 
    
    lda #$00
    sta CGADDR

    lda #$ff
    sta CGDATA

    lda #$ee
    sta CGDATA
.endproc

.segment "VECTOR"
.addr ResetHandler

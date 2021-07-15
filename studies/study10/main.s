CGADDR  = $2121
CGDATA  = $2122

.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce 
    
    stz CGADDR

    ; add pink ($6eff) to palette
    lda #$ff
    sta CGDATA
    
    lda #$6e
    sta CGDATA
.endproc

.segment "VECTOR"
.addr ResetHandler

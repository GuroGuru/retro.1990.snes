.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    ; storing values in addresses $07ab, $07cd and $07ef
    lda #$12
    sta $07ab
    lda #$34
    sta $07cd
    lda #$56
    sta $07ef

    ; dereferencing $07ab from ($d0)
    lda #$ab
    sta $d0
    lda #$07
    sta $d1

    ; dereferencing $07cd from ($e0)
    lda #$cd
    sta $e0
    lda #$07
    sta $e1

    ; dereferencing $07ec from ($f0)
    lda #$ec
    sta $f0    
    lda #$07 
    sta $f1

    ; retrieving values
    ldx #$02
    ldy #$03
    lda ($00d0)
    lda ($de,X)
    lda ($f0),Y
.endproc

.segment "VECTORS"
.addr ResetHandler
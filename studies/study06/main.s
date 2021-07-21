.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    ldx #$10
    cpx #$10
    beq Equal

CarryCleared:
    jmp ProcessDone

CarrySet:
    clc
    bcc CarryCleared

NotEqual:
    lda #$ff
    adc #$01
    bcs CarrySet

Equal:
    ldy #$11
    cpy #$12
    bne NotEqual

ProcessDone:
    lda #$00
    ldx #$00
    ldy #$00
.endproc

.segment "VECTORS"
.addr ResetHandler
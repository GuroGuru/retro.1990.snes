VMADDL      = $2116
VMADDH      = $2117
VMDATAL     = $2118
VMDATAH     = $2119

.p816 

.segment "CODE"
.proc ResetHandler
    clc
    xce

    stz VMADDL              ; set the VRAM address to $0000
    stz VMADDH

    ; Row 1, bitplane 0 & 1
    lda #$ff
    sta VMDATAL

    lda #$ff
    sta VMDATAH

    ; Row 2, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 3, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 4, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 5, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 6, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 7, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 8, bitplane 0 & 1
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 1, bitplane 2 & 3
    lda #$ff
    sta VMDATAL

    lda #$ff
    sta VMDATAH

    ; Row 2, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 3, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 4, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 5, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 6, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 7, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH

    ; Row 8, bitplane 2 & 3
    lda #$00
    sta VMDATAL

    lda #$00
    sta VMDATAH
.endproc

.segment "VECTOR"
.addr ResetHandler
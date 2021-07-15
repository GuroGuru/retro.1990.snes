CGADDR  = $2121
CGDATA  = $2122
VMDATAL = $2118
VMDATAH = $2119
OAMADDL = $2102     ; address for accessing OAM
OAMADDH = $2103
OAMDATA = $2104     ; data for OAM write

.p816 

.segment "SPRITEDATA"
SpriteData: .incbin "Sprites.vra"
ColorData:  .incbin "SpriteColors.pal"

.segment "CODE"
.proc ResetHandler
    clc
    xce   

    lda #$11
    sta CGADDR
    ldx #$00     

CGRAMLoop:
    lda ColorData, X
    sta CGDATA
    inx

    cpx #$08        ; 4 colors, 2 bytes per color
    bcc CGRAMLoop
    ldx #$00

VRAMLoop:
    lda SpriteData, X
    sta VMDATAL
    inx

    lda SpriteData, X
    sta VMDATAH
    inx

    cpx #$80        ; 4 tiles, 8 rows per tile, 4 bitplanes per row, 1 byte per bitplane
    bcc VRAMLoop
    ldx #$00

OAMRAMData:    
    ; set up OAM data              
    stz OAMADDL             ; set the OAM address to ...
    stz OAMADDH             ; ...at $0000

    ; OAM data for first sprite
    lda # (256/2 - 8)       ; horizontal position of first sprite
    sta OAMDATA
    lda # (224/2 - 8)       ; vertical position of first sprite
    sta OAMDATA
    lda #$00                ; name of first sprite
    sta OAMDATA
    lda #$00                ; no flip, prio 0, palette 0
    sta OAMDATA

    ; OAM data for second sprite
    lda # (256/2)           ; horizontal position of second sprite
    sta OAMDATA
    lda # (224/2 - 8)       ; vertical position of second sprite
    sta OAMDATA
    lda #$01                ; name of second sprite
    sta OAMDATA
    lda #$00                ; no flip, prio 0, palette 0
    sta OAMDATA

    ; OAM data for third sprite
    lda # (256/2 - 8)       ; horizontal position of third sprite
    sta OAMDATA
    lda # (224/2)           ; vertical position of third sprite
    sta OAMDATA
    lda #$02                ; name of third sprite
    sta OAMDATA
    lda #$00                ; no flip, prio 0, palette 0
    sta OAMDATA

    ; OAM data for fourth sprite
    lda # (256/2)           ; horizontal position of fourth sprite
    sta OAMDATA
    lda # (224/2)           ; vertical position of fourth sprite
    sta OAMDATA
    lda #$03                ; name of fourth sprite
    sta OAMDATA
    lda #$00                ; no flip, prio 0, palette 0
    sta OAMDATA
.endproc

.segment "VECTOR"
.addr ResetHandler
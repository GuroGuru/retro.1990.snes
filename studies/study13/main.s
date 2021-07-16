INIDISP     = $2100
VMADDL      = $2116
VMADDH      = $2117
VMDATAL     = $2118
VMDATAH     = $2119
CGADDR      = $2121
CGDATA      = $2122
TM          = $212c
NMITIMEN    = $4200
RDNMI       = $4210

.p816 

.segment "SPRITEDATA"
SpriteData: .incbin "Sprites.vra"
ColorData:  .incbin "SpriteColors.pal"

.segment "CODE"
.proc ResetHandler
    clc
    xce  
     
    ldx #$00    
    stz VMADDL 
    stz VMADDH

    lda #$81
    sta CGADDR

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

DisplayObjects:
    ; make Objects visible
    lda #$10
    sta TM
    
    ; release forced blanking, set screen to full brightness
    lda #$0f
    sta INIDISP
    
    ; enable NMI, turn on automatic joypad polling
    lda #$81
    sta NMITIMEN     

.endproc

.proc GameLoop
    wai
    jmp GameLoop  
.endproc

.proc NMIHandler
    lda RDNMI
    rti
.endproc

.segment "VECTOR"
.addr           $0000,      $0000,          $0000
.addr           NMIHandler, $0000,          $0000
.word           $0000,      $0000
.addr           $0000,      $0000,          $0000
.addr           $0000,      ResetHandler,   $0000
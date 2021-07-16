INIDISP     = $2100

OAMADDL     = $2102
OAMADDH     = $2103
OAMDATA     = $2104

VMADDL      = $2116
VMADDH      = $2117
VMDATAL     = $2118
VMDATAH     = $2119

CGADDR      = $2121
CGDATA      = $2122

TM          = $212c
NMITIMEN    = $4200
RDNMI       = $4210

DMASTART    = $420b
DMAMODE     = $4300
DMADEST     = $4301
DMASOURCEL  = $4302
DMASOURCEH  = $4303
DMABANK     = $4304
DMALENGTHL  = $4305
DMALENGTHH  = $4306

; $2104, $2118, and $2122 (OAM data, VRAM data, and CG data)

.p816
.i16

.segment "SPRITEDATA"
SpriteData: .incbin "Sprites.vra"
ColorData:  .incbin "SpriteColors.pal"

.segment "CODE"
.proc ResetHandler
    sei                     ; disable interrupts
    clc                     ; clear the carry flag
    xce                     ; switch the 65816 to native (16-bit mode)

    rep #$10

    lda #$8f                ; force v-blanking
    sta INIDISP
    stz NMITIMEN            ; disable NMI

    jsr DMACGRAM
    jsr LoadVRAM
    jsr LoadOAMRAM
    
    ; make Objects visible
    lda #$10
    sta TM
    
    ; release forced blanking, set screen to full brightness
    lda #$0f
    sta INIDISP
    
    ; enable NMI, turn on automatic joypad polling
    lda #$81
    sta NMITIMEN    

    jmp GameLoop
.endproc

; $2104, $2118, and $2122 (OAM data, VRAM data, and CG data)

.proc DMACGRAM
    stz CGADDR
    stz DMAMODE

    lda #$22
    sta DMADEST
    
    ldx #.loword(ColorData)
    stx DMASOURCEL
    
    lda #^ColorData
    sta DMABANK

    ldx #512
    stx DMALENGTHL

    lda #1
    sta DMASTART

    rts
.endproc

.proc LoadVRAM
    stz VMADDL              ; set the VRAM address to $0000
    stz VMADDH   
    ldx #$00                ; set register X to zero, we will use X as a loop counter and offset

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
    
    rts
.endproc

.proc LoadOAMRAM
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
    
    rts
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
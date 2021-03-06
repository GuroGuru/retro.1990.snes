; Variables -------------------------------------------------------------------

INIDISP         = $2100
OAMADDL         = $2102
OAMADDH         = $2103
OAMDATA         = $2104
VMADDL          = $2116
VMADDH          = $2117
VMDATAL         = $2118
VMDATAH         = $2119
CGADDR          = $2121
CGDATA          = $2122
TM              = $212c
NMITIMEN        = $4200
RDNMI           = $4210
DMASTART        = $420b
DMAMODE         = $4300
DMADEST         = $4301 ; $2104, $2118, and $2122 (OAM data, VRAM data, and CG data)
DMASOURCEL      = $4302
DMASOURCEH      = $4303
DMABANK         = $4304
DMALENGTHL      = $4305
DMALENGTHH      = $4306
OAMMIRROR       = $0400 ; location of OAMRAM mirror in WRAM
OAMMIRROR_SIZE  = $0220 ; OAMRAM can hold data for 128 sprites, 4 bytes each

; Binaries includes -----------------------------------------------------------

.segment "SPRITEDATA"
SpriteTiles: .incbin "square.chr"
SpriteColors: .incbin "square.pal"

; -----------------------------------------------------------------------------

.p816
.i16

.segment "CODE"

; Buffering OAM data ----------------------------------------------------------

.proc SetOAMBuffer
    ; set up initial data in the OAMRAM mirror, use X as index
    ldx #$00

    ; upper-left sprite
    lda #(256/2 - 8) ; sprite 1, horizontal position
    sta OAMMIRROR, X 
    inx                                 ; increment index
    lda #(224/2 - 8); sprite 1, vertical position 
    sta OAMMIRROR, X 
    inx 
    lda #$00                            ; sprite 1, name 
    sta OAMMIRROR, X 
    inx 
    lda #$00                            ; no flip, palette 0 
    sta OAMMIRROR, X 
    inx 

    ; upper-right sprite 
    lda #(256/2)               ; sprite 2, horizontal position
    sta OAMMIRROR, X 
    inx                                 ; increment index
    lda #(224/2 - 8); sprite 2, vertical position 
    sta OAMMIRROR, X 
    inx 
    lda #$01                            ; sprite 2, name 
    sta OAMMIRROR, X 
    inx 
    lda #$00                            ; no flip, palette 0 
    sta OAMMIRROR, X 
    inx 
    
    ; lower-left sprite 
    lda #(256/2 - 8) ; sprite 3, horizontal position
    sta OAMMIRROR, X 
    inx                                 ; increment index
    lda #(224/2)              ; sprite 3, vertical position 
    sta OAMMIRROR, X 
    inx 
    lda #$02                            ; sprite 3, name 
    sta OAMMIRROR, X 
    inx 
    lda #$00                            ; no flip, palette 0 
    sta OAMMIRROR, X 
    inx

    ; lower-right sprite 
    lda #(256/2)                ; sprite 4, horizontal position
    sta OAMMIRROR, X 
    inx                                 ; increment index
    lda #(224/2)              ; sprite 4, vertical position 
    sta OAMMIRROR, X 
    inx 
    lda #$03                            ; sprite 4, name 
    sta OAMMIRROR, X 
    inx 
    lda #$00                            ; no flip, palette 0 
    sta OAMMIRROR, X 
    inx

    ; move the other sprites off screen (set the coordinates to [255, 255], which is off screen)
    lda #$ff                          
    OAMLoop:
        sta OAMMIRROR, X
        inx 
        cpx #OAMMIRROR_SIZE
        bne OAMLoop

    ; correct extra OAM byte for first four sprites 
    ldx #$0200
    lda #$00
    sta OAMMIRROR, X 

    rts
.endproc

; DMA transfers ---------------------------------------------------------------

.proc DMAFromPaletteToCGRAM
    lda #$81
    sta CGADDR
    
    stz DMAMODE

    lda #$22
    sta DMADEST
    
    ldx #.loword(SpriteColors)
    stx DMASOURCEL
    
    lda #^SpriteColors
    sta DMABANK

    ldx #8
    stx DMALENGTHL

    lda #1
    sta DMASTART

    rts
.endproc

.proc DMAFromTilesToVRAM
    stz VMADDL

    lda #1
    sta DMAMODE

    lda #$18
    sta DMADEST
    
    ldx #.loword(SpriteTiles)
    stx DMASOURCEL
    
    lda #^SpriteTiles
    sta DMABANK

    ldx #128
    stx DMALENGTHL

    lda #1
    sta DMASTART
    
    rts
.endproc

.proc DMAFromTilemapToVRAM

.endproc

.proc DMAFromOAMBufferToOAMRAM
    stz DMAMODE

    lda #$04
    sta DMADEST
    
    ldx #.loword(OAMMIRROR)
    stx DMASOURCEL
    
    lda #^OAMMIRROR
    sta DMABANK

    ldx #$0220
    stx DMALENGTHL

    lda #1
    sta DMASTART
    
    rts
.endproc

; Event handlers --------------------------------------------------------------

.proc ResetHandler
    sei                     ; disable interrupts
    clc                     ; clear the carry flag
    xce                     ; switch the 65816 to native (16-bit mode)

    rep #$10

    lda #$8f                ; force v-blanking
    sta INIDISP
    stz NMITIMEN            ; disable NMI

    jsr SetOAMBuffer    
    jsr DMAFromPaletteToCGRAM
    jsr DMAFromTilesToVRAM
    jsr DMAFromOAMBufferToOAMRAM
    
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

.proc NMIHandler
    lda RDNMI
    rti
.endproc

; Game logic goes here --------------------------------------------------------

.proc GameLoop
    wai
    jmp GameLoop  
.endproc

; Event listeners (hardware vectors) ------------------------------------------

.segment "VECTOR"
.addr           $0000,      $0000,          $0000
.addr           NMIHandler, $0000,          $0000
.word           $0000,      $0000
.addr           $0000,      $0000,          $0000
.addr           $0000,      ResetHandler,   $0000
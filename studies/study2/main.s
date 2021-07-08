; -- TOPICS ---------------------------------------------------------
;
; * Tools: Debugger memory map
; * Registers: working registers (A, X, Y)
; * Instructions: loading (lda, ldx, ldy), storing (sta, stx, sty, stz) and transfering (tax, tay, txa, tya)
; * Flags: ?
; * Addressing modes: Imediate, absolute
;
; -------------------------------------------------------------------

.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce

    lda #$01
    sta $0011

    ldx #$02
    stx $0012

    ldy #$03
    sty $0013

    txa
    sta $0014

    tya
    sta $0015

    tax
    stx $0016

    tay
    sty $0017

    stz $0011
.endproc

.segment "VECTORS"
.addr ResetHandler
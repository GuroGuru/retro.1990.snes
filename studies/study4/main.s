; -- TOPICS ---------------------------------------------------------
;
; * Tools: n/a
; * Registers: n/a
; * Instructions: sbc, dex, dey
; * Addressing modes: n/a
; * Flags: Z and N
;
; -------------------------------------------------------------------

.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce
.endproc

.segment "VECTORS"
.addr ResetHandler
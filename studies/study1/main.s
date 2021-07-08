; -- TOPICS ---------------------------------------------------------
;
; * Tools:
;   . Configuration file (memmap.cfg)
;   . Assembler directives
;   . ROM (https://en.wikibooks.org/wiki/Super_NES_Programming/SNES_memory_map)
;   . Debugger CPU and registers sections
;   . Debugger run/break, step, jump to address
;   . Debugger tracer
; * Registers:
;   . Program counter register
;   . Processor status register
; * Instructions: clc, xce
; * Flags: C and E
; * Addressing modes: n/a
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
CGDATA  = $2122         ; data for CGRAM write

.p816                   ; assembler directive, inform the assembler this is 65816 assembly

.segment "CODE"
.proc ResetHandler
    lda #$ff            ; color low byte
    sta CGDATA          ; add data to CGRAM
    lda #$ee            ; color high byte
    sta CGDATA          ; add data to CGRAM   
.endproc

.segment "VECTOR"
.addr ResetHandler      ; reset vector pointing to ResetHandler procedure

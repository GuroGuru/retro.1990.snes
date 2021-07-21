.p816

.segment "CODE"
.proc ResetHandler
    clc
    xce
.endproc

.segment "VECTORS"
.addr ResetHandler
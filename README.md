### SnesDevStudies

---

#### Resources:
- [SNES Assembly Adventure](https://georgjz.github.io/snesaa01/)
- [Easy 6502](http://skilldrick.github.io/easy6502/)
- [SNES Development Discord](https://discord.com/invite/3K2EAFBF84) (special thanks for users **kulor**, **dougeff**, **Yoey**, **PinoBatch** and **_aitchFactor**)
- [Curso de Assembly com Snes e Mega Drive](https://www.youtube.com/playlist?list=PLLFRf_pkM7b6Vi0ehPPovl1gQ5ubHTy5P)
- [Assembly for the SNES](https://ersanio.gitbook.io/assembly-for-the-snes/)
- [!!Con 2017: Writing NES Games! with Assembly!! by Christian Joudrey](https://www.youtube.com/watch?v=IbS7uEsHV_A)

#### Tools:
- [Visual Code Studio](https://code.visualstudio.com/download)
- [bsnes-plus](https://github.com/devinacker/bsnes-plus/releases)
- [cc65](https://cc65.github.io/)
- [YY-CHR](https://www.smwcentral.net/?p=section&a=details&id=4642)

---

#### Topics:
- Instructions:
    - [x] lda, ldx, ldy (loading)
    - [x] sta, stx, sty, stz (storing)
    - [x] tax, tay, txa, tya (transfering)
    - [x] adc, inx, iny (add)
    - [x] sbc, dex, dey (sub)
    - [x] cmp, cpx, cpy (comparing)
    - [x] beq, bne, bcs, bcc (branching)
    - [x] jmp (jumping)
    - [ ] stack manipulation
    - [ ] subroutines

- Addressing modes:
    - [x] Immediate: #$c0
    - [x] Absolute: $c000
    - [x] Zero page: $c0
    - [x] Zero page,X: $c0,X
    - [x] Absolute,X: $c000,X
    - [x] Absolute,Y: $c000,Y
    - [x] Relative: $c0 or label
    - [x] Implicit
    - [x] Indirect: ($c000)
    - [x] Indexed indirect: ($c0,X)
    - [x] Indirect indexed: ($c0),Y

- Registers:
    - [x] Program counter register
    - [x] Program status register
    - [x] Working registers (A, X and Y)
    - [ ] Stack pointer register

- PSR flags:
    - [x] E
    - [x] N
    - [ ] V
    - [ ] M
    - [ ] X
    - [ ] D
    - [ ] I
    - [x] Z
    - [x] C

- Pong:
    - [ ] Display ball sprite
    - [ ] Move ball sprite
    - [ ] Check collisions
    - [ ] Check game over (ball is off-screen)
    - [ ] Display paddles sprites
    - [ ] Handle input
    - [ ] Move player paddle
    - [ ] Add start screen

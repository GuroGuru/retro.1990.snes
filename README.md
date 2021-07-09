## SnesDevStudies

---

#### Resources:
- [Curso de Assembly com Snes e Mega Drive](https://www.youtube.com/playlist?list=PLLFRf_pkM7b6Vi0ehPPovl1gQ5ubHTy5P)
- [SNES Development Discord](https://discord.com/invite/3K2EAFBF84) (special thanks for users **kulor**, **dougeff**, **Yoey**, **PinoBatch** and **_aitchFactor**)
- [SNES Assembly Adventure](https://georgjz.github.io/snesaa01/)
- [Assembly for the SNES](https://ersanio.gitbook.io/assembly-for-the-snes/)
- [Easy 6502](http://skilldrick.github.io/easy6502/)
- [!!Con 2017: Writing NES Games! with Assembly!! by Christian Joudrey](https://www.youtube.com/watch?v=IbS7uEsHV_A)

#### Tools:
- [Visual Code Studio](https://code.visualstudio.com/download)
- [bsnes-plus](https://github.com/devinacker/bsnes-plus/releases)
- [cc65](https://cc65.github.io/)
- [YY-CHR](https://www.smwcentral.net/?p=section&a=details&id=4642)

---

#### Topics:
- Instructions:
    - [x] Loading registers
    - [x] Storing in memory
    - [x] Transfering
    - [x] Adding or incrementing
    - [ ] Subtracting or decrementing
    - [ ] Comparing
    - [ ] Branching
    - [ ] Jumping
    - [ ] Subroutines
    - [ ] Stack manipulation

- Addressing modes:
    - [x] Immediate: #$c0
    - [x] Absolute: $c000
    - [x] Zero page: $c0
    - [x] Zero page,X: $c0,X
    - [ ] Absolute,X: $c000,X
    - [ ] Absolute,Y: $c000,Y
    - [ ] Relative: $c0 or label
    - [ ] Implicit
    - [ ] Indirect: ($c000)
    - [ ] Indexed indirect: ($c0,X)
    - [ ] Indirect indexed: ($c0),Y

- Registers:
    - [ ] Program counter register
    - [ ] Program status register
    - [ ] Working registers (A, X and Y)
    - [ ] Stack pointer register

- PSR flags:
    - [x] E
    - [ ] N
    - [ ] V
    - [ ] M
    - [ ] X
    - [ ] D
    - [ ] I
    - [ ] Z
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

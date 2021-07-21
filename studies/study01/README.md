### SnesDevStudies 1 - The native mode

The **65816** processor is a superset the popular **6502** model, the CPU used by many consoles released during the 80s-90s, including the original NES.

To guarantee [retrocompatibility](https://georgjz.github.io/snesaa02/) with its predecessor, 65816 starts in a mode called **emulation mode** where only the 6502 instruction set is avaiable. Using 65816 set requires turn the emulation mode off, thus switching the processor to the mode called **native mode**.

This can be achieved by using the instruction `xce`.

<!-- 



- Registers
- The **program counter register**
- The **processor status register** flags **E** and **C**

---

#### Topics introduced:

- Registers:
    - [x] Program counter register
    - [x] Program status register

- PSR flags:
    - [x] E
    - [x] C -->

; 10 SYS (2304)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $33, $30, $34, $29, $00, $00, $00
*=$900
;First Basic Program
;PEEK to read the desired byte using address $FD to have the address for indirect addressing
;10 data 120, 165, 1, 41, 252, 133, 1, 160, 0, 177, 251, 133,2, 165, 1, 9, 3, 133, 1, 88, 96

        SEI     ;set interrupt flag
        ;lets swap out the rom, charracter and kernel memories
        LDA 1   ;load acummulator with memory register at 1 memory position
        EOR 252 ;change accumulator turning off bits 6 y 7 1111 1100 to get 62k of free memory
        STA 1   ;save the changed memory address at the memory register
        ;peek the value on the overlapped memory postion
        LDY 0   ;to load Y for an indrect of LDA
        LDA ($FB),Y     ;load what is in memory position 251 the value that we want to save
                        ;memory position 251 is FB adn FC the address is a pointer
        STA 2   ;save the value in byte 2 so we can retrieve it easily
        ;lets swap in the rom, character and kernel memories
        LDA 1
        ORA 3   ;change the acummulator and turn on bits 6 and 7
        STA 1   ;store the memory register at position 1
        ;allow interrupts again
        CLI     ;clear interrupt flag
        RTS

;POKE to write the desired byte using address $FD to have the address for indirect addressing       
;20 data 120, 165, 1, 41, 252, 133, 1, 160, 0, 165, 2, 145, 251, 165, 1, 9, 3, 133, 1, 88, 96


        SEI     ;set interrupt flag
        ;lets swap out the rom, charracter and kernel memories
        LDA 1   ;load acummulator with memory register at 1 memory position
        EOR 252 ;change accumulator turning off bits 6 y 7 1111 1100 to get 62k of free memory
        STA 1   ;save the changed memory address at the memory register
        ;poke the value on the overlapped memory postion
        LDY 0   ;to load Y for an indrect of LDA
        LDA 2   ;load acummulator with the value on byte 2
        STA ($FB),Y     ;save to the indirect direction starting the low byt on $FB and high byte $FC (251 and 252)
        ;lets swap in the rom, character and kernel memories
        LDA 1
        ORA 3   ;change the acummulator and turn on bits 6 and 7
        STA 1   ;store the memory register at position 1
        ;allow interrupts again
        CLI     ;clear interrupt flag
        RTS
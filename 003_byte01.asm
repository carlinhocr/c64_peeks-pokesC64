; 10 SYS (2304)
WATCH $0001
WATCH $0002
WATCH $0003
WATCH $FB
WATCH $FC
WATCH $0400

*=$900
;First Basic Program

;set up a false byte one to simulate on a debugger the byte 1
        LDA #$FF ; all ones on the memory position 1 to switch in the kernel and charcter code and basic
        STA 1
;store a memory position to write or read data at 251 and 251 low and hight byte
;using 0401 to influence on the screen
        LDA #$01
        STA $FB
        LDA #$04
        STA $FC
        LDA #$AA
        STA $0401

;set accumulator on zero
        LDA #$00


;PEEK to read the desired byte using address $FD to have the address for indirect addressing
;10 data 120, 165, 1, 41, 252, 133, 1, 160, 0, 177, 251, 133,2, 165, 1, 9, 3, 133, 1, 88, 96

        SEI     ;set interrupt flag
        ;lets swap out the rom, charracter and kernel memories
        LDA $1   ;load acummulator with memory register at 1 memory position
        AND #$FC  ;change accumulator turning off bits 6 y 7 1111 1100 to get 62k of free memory FC=252
        STA $1   ;save the changed memory address at the memory register
        ;peek the value on the overlapped memory postion
        LDY #$0   ;to load Y for an indrect of LDA
        LDA ($FB),Y     ;load what is in memory position 251 the value that we want to save
                        ;memory position 251 is FB adn FC the address is a pointer
        STA $2   ;save the value in byte 2 so we can retrieve it easily
        ;lets swap in the rom, character and kernel memories
        LDA $1
        ORA #$3   ;change the acummulator and turn on bits 6 and 7
        STA $1   ;store the memory register at position 1
        ;allow interrupts again
        CLI     ;clear interrupt flag
        RTS

;POKE to write the desired byte using address $FD to have the address for indirect addressing       
;20 data 120, 165, 1, 41, 252, 133, 1, 160, 0, 165, 2, 145, 251, 165, 1, 9, 3, 133, 1, 88, 96


        SEI     ;set interrupt flag
        ;lets swap out the rom, charracter and kernel memories
        LDA $1   ;load acummulator with memory register at 1 memory position
        AND #$FC  ;change accumulator turning off bits 6 y 7 1111 1100 to get 62k of free memory FC=252
        STA $1   ;save the changed memory address at the memory register
        ;poke the value on the overlapped memory postion
        LDY #$0   ;to load Y for an indrect of LDA
        LDA $2   ;load acummulator with the value on byte 2
        STA ($FB),Y     ;save to the indirect direction starting the low byt on $FB and high byte $FC (251 and 252)
        ;lets swap in the rom, character and kernel memories
        LDA $1
        ORA #$3   ;change the acummulator and turn on bits 6 and 7
        STA $1   ;store the memory register at position 1
        ;allow interrupts again
        CLI     ;clear interrupt flag
        RTS
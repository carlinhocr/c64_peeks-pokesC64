*=0900
        LDA $14 
        PHA
        LDA $15
        PHA
        JSR $B7
        SEI
        LDA $1
        AND #$FC
        STA $1
        LDY 0
        LDA ($14),Y
        TAY
        LDA $1
        ORA #$3
        STA $1
        CLI
        PLA
        STA $15
        PLA
        STA $1D
        JMP $B3
        JSR $AE
        JSR $AD
        JSR $B7
        JSR $AE
        JSR $B7
        LDA $1
        AND #$FC
        STA $1
        TXA
        LDY 0
        STA ($14),Y
        LDA $1
        ORA #$3
        STA $1
        RTS

*=0900
        SEI
        LDA $1
        AND #$FC
        STA $1
        LDY 0
        LDA ($FB),Y
        STA $2
        LDA $1
        ORA #$3
        STA $1
        CLI
        RTS
        SEI
        LDA $1
        AND #$FC
        STA $1
        LDY 0
        LDA $2
        STA ($FB),Y
        LDA $1
        ORA #$3
        STA $1
        CLI
        RTS

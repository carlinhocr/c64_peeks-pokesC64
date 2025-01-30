10 print"{clear}"
15 rem move char rom to ram in 14336 bit 111  241 = 11110001
18 poke 53272, (peek (53272) and 241) or 8
20 rem  stop timer A 56334 from CIA 1
25 rem turns off keyscan timer
30 poke 56334, peek (56334) AND 254
40 rem disble rom 251 = 11111011
50 rem put the char gen in memory at 53248 to 57434
60 rem so the 6510 can read it, no I/O can happen
70 poke 1, peek (1) and 251
80 b = 8192
90 for i = 0 to 4095
100 poke b+i,peek(53248+i) : rem 53248 is hwere the char rom is mapped in ram
110 next i
120 rem enable i/o
130 poke 1, peek(1) or 4
135 rem reactivate timer A
140 poke 56334, peek (56334) or 1
150 poke b,255
160 poke b+1,129
170 poke b+2,129
180 poke b+3,165
190 poke b+4,165
200 poke b+5,129
210 poke b+6,129
220 poke b+7,255
230 print "try the at symbol hehhehehe"
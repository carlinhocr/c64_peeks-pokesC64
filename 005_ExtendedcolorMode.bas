10 POKE 53281,1 : rem set background color white
20 POKE 53282,2 : rem set background color red
30 POKE 53283,5 : rem set background color green
40 POKE 53284,6 : rem set background color blue
50 POKE 53265,PEEK(53265) OR 64 : rem turn on extended color mode
60 PRINT "ABC abc ";CHR$(18);"ABC abc": rem chr$ 18 is reverse on
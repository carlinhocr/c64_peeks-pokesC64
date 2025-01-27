5 print"{clear}"
10 POKE 53281,1 : rem set background color white
20 POKE 53282,2 : rem set background color red
30 POKE 53283,5 : rem set background color green
40 POKE 53284,6 : rem set background color blue
45 POKE 53265,PEEK(53265) OR 64 : rem turn on extended color mode
46 rem 3 background colors with bit 7 and 6 of the character
47 rem 64 characters to choose from 2^6
51 rem upper background 53282, foreground 53284
52 rem lower background 53281, foreground 53284
56 rem reverse upper background 53284, reverse foreground 53284
58 rem reverse lower background 53283, reverse foreground 53284
60 PRINT "ABC abc ";CHR$(18);"ABC abc": rem chr$ 18 is reverse on
65 poke 198,0:wait 198,1:geta$
70 POKE 53265,PEEK(53265) AND 191 : rem turn off extended color mode
75 poke 198,0:wait 198,1:geta$
80 rem you can turn it on and off and things will change on the screen
90 POKE 53265,PEEK(53265) OR 64: rem turn ON extended color mode
100 poke 198,0:wait 198,1:geta$
110 POKE 53265,PEEK(53265) AND 191 : rem turn off extended color mode
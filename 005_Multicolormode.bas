5 print"{clear}"
10 POKE 53281,1 : rem set background color white
20 POKE 53282,2 : rem set background color red
30 POKE 53283,5 : rem set background color green
40 POKE 53284,6 : rem set background color blue
50 poke 53270,peek (53270) or 16
60 print "opaaaaaa"
75 poke 198,0:wait 198,1
80 poke 53270,peek (53270) and 239
10 poke 56334, peek (56334) and 254 : REM turn off interrupt
20 for i = 1 to 1000 : print i : next i
30 poke 56334, peek (56334) and 1 : REM turn on interrupt
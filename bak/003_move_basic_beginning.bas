10 poke 43, (2560 +1) and 255 : rem set low byte
20 poke 44, int((2560+1)/256) : poke 2560,0 : clr :rem set high byte, the first zero byte for basic and relaod all in a clr
30 load "the program to load in the new memory position"
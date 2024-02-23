1 dim m(7)
3 dim l(7)
5 print"{clear}"
10 input "ingrese codigo de pantalla";c
15 print"        "
20 ad= 53248+c*8: rem start the bytes array/description of the character 
25 ac= 53248+(c+256)*8
30 poke 56334, peek (56334) and 254 :rem turn off interrupts
40 poke 1, peek (1) and 251: rem map character rom in $D000-$DFFF
50 for i = 0 to 7:m(i)=peek (ad+i):next i : rem read each character line
55 for i = 0 to 7:l(i)=peek (ac+i):next i : rem read low char
60 poke 1, peek (1) or 4:rem map i/o again at $D000-$DFFF
70 poke 56334, peek (56334) or 1
80 for i = 0 to 7:for j = 7 to 0 step -1
90 if (m(i)and 2^j) then print"*";:goto 110
100 print".";
110 next j:print:next i
111 print"        "
112 for i = 0 to 7:for j = 7 to 0 step -1
115 if (l(i)and 2^j) then print"*";:goto 140
130 print".";
140 next j:print:next i
145 print"        "
150 print"upper + lower":poke 198,0:wait 198,1:geta$:goto 5
 
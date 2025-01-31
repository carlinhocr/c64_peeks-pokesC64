10 print"{clear}"
20 for i = 0 to 15
30 poke 646,i
40 print " modify writing color: ";:print peek(646)
50 next i
60 gosub 490
70 poke 646,14
80 print "current character color: ";:print peek(647)
90 gosub 490
100 print "current color ram position: ";:print peek(244) *256 + peek(243)
110 gosub 490
120 print "current video ram position: ";:print peek(210) *256 + peek(209) +peek(211)
130 gosub 490
140 print "cursor column number: ";:print peek(211)
150 gosub 490
160 print "cursor row number: ";:print peek(214)
170 gosub 490
180 print "position cursor"
190 poke 211,20:poke 214,10:sys 58732
200 poke 646,7:print "here here here now!!":poke 646,14
210 gosub 490
220 poke 211,0:poke 214,24:sys 58732
230 print "turn on cursor"
240 poke 204,0
250 gosub 490
260 print "turn off cursor"
270 poke 207,0:poke 204,1
280 gosub 490
290 poke 19,0
300 rem not working
310 input "input with special cursor{right*2}Z{right*3}";a$
320 poke 199,1
330 print "reverse on"
340 gosub 490
350 poke 199,0
360 print "reverse off"
370 gosub 490
390 print "special character mode on"
392 poke 216,8
395 print "{home}{clear}{right*2}{right*3}"
400 gosub 490
410 print "turn off screen"
420 gosub 490
430 poke 53265, peek(53265) and 239
440 gosub 490
450 poke 53265, peek(53265) or 16
460 print "turn on screen"
470 gosub 490
480 end
490 poke 198,0:wait 198,1:geta$:return
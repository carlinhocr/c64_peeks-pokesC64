10 PRINT "{clear}":co=4
20 dim p2% (15), pd%(1,1,1,15)
30 for b = 0 to 1 : for xb = 0 to 1 :for yb = 0 to 1: for z = 0 to 15
32 rem poke 1640+z+40*yb+80*xb+160*b,pd%(b,xb,yb,z) to test put it in the for
35 
40 read pd% (b,xb,yb,z):next z,yb,xb,b 
60 for xa = 0 to 15 : read p2% (xa):next xa
70 rem each data number is a character with a square in some place
80 rem for example 126 is a square in the upper right corner and the rest blank
90 rem similar to {cm v} commodore + V
100 rem there are 16 different character combinations from 0 to 15
110 rem the first read loads the first 8 rows of data
120 rem the last read p2% loads the last line of data which has all the 
121 rem different kinds of squares
130 DATA 126, 126, 226, 97, 127, 97, 251, 226, 252, 127, 236, 160, 252, 251, 236, 160
140 DATA 123, 97, 255, 123, 98, 97, 254, 236, 98, 252, 255, 254, 252, 160, 236, 160
150 DATA 124, 226, 124, 255, 225, 236, 225, 226, 254, 251, 255, 254, 160, 251, 236, 160
160 DATA 108, 127, 225, 98, 108, 252, 225, 251, 98, 127, 254, 254, 252, 251, 160, 160
170 DATA 32, 32, 124, 123, 108, 123, 225, 124, 98, 108, 255, 254, 98, 225, 255, 254
180 DATA 32, 126, 124, 32, 108, 126, 225, 226, 108, 127, 124, 225, 127, 251, 226, 251
190 DATA 32, 126, 32, 123, 108, 97, 108, 126, 98, 127, 123, 98, 252, 127, 97, 252
200 DATA 32, 126, 124, 123, 32, 97, 124, 226, 123, 126, 255, 255, 97, 226, 236, 236
210 rem this last line has all the different types of squares
220 DATA 32, 126, 124, 123, 108, 97, 225, 226, 98, 127, 255, 254, 252, 251, 236, 160
230 rem coordinate to set he point
240 x=0 : rem from 0 to 49
250 y=0 : rem from 0 to 79
260 gosub 310
270 rem for j = 0 to 38 :x=x+1:y=y+1: gosub 310:next j
280 rem x=x+1:gosub 310
290 rem for h = 0 to 39 :x=x+1:y=y-1: gosub 310:next h
300 end
310 l = 0: goto 330
320 l = 1
330 y2 = 49 -y:s=int(x/2):z=int(y2/2):po=s+40*z
340 rem po is the position where I want the character relative to the screen start
350 rem x3 is the character currently on the screen
360 x1=x-2*s:x2=y2-2*z:x3=peek(1024+po)
370 rem f is a variable for found
380 f=0:for i = 0 to 15:if x3=p2%(i) then x3=i:f=1
390 next i
400 rem if f=0 then it is not found if l=1 it is delete so go back as 
401 rem there is no character
410 if f=0 then x3=0: if l=1 then return
420 rem load x3 as the character to add using
430 rem 1 as we are adding and not deleting
440 rem x1 is
450 rem example for x=0 y=0
460 rem s=0, y2=49, z=24,po=0+40*24=960 or the first char of the last line
470 rem x1=0, x2=49-2*24=1, x3=character in the position 960
480 rem we look at the table as x3 was not found it is 0
490 rem so we are looking for 1,0,1,0
500 rem 101 is 5 in bynary so we look at row 6 as we are starting at 0
510 rem in row six we look for character in the postion 0 it is
520 print po,x1,x2,x3,pd%(l,x1,x2,x3)
530 poke 1024+po,pd%(l,x1,x2,x3):poke 55296+po,co:return
540 rem lower left corner 0,0 top 49,79







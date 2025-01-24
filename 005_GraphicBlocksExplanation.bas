10 PRINT "{clear}":co=4
20 dim p2% (15), pd%(1,1,1,15)
30 for b = 0 to 1 : for xb = 0 to 1 :for yb = 0 to 1: for z = 0 to 15
40 rem poke 1640+z+40*yb+80*xb+160*b,pd%(b,xb,yb,z) to test put it in the for
50 rem b=l 0=create 1=delete
60 rem xb=x1 is left or right in the square
70 rem yb=x2 is up or down in the square
80 rem z=x3 or the graphic character
90 read pd%(b,xb,yb,z):next z,yb,xb,b
100 for xa = 0 to 15 : read p2% (xa):next xa
110 rem each data number is a character with a square in some place
120 rem for example 126 is a square in the upper right corner and the rest blank
130 rem similar to {cm v} commodore + V
140 rem there are 16 different character combinations from 0 to 15
150 rem the first read loads the first 8 rows of data
160 rem the last read p2% loads the last line of data which has all the
170 rem different kinds of squares
180 DATA 126, 126, 226, 97, 127, 97, 251, 226, 252, 127, 236, 160, 252, 251, 236, 160
190 DATA 123, 97, 255, 123, 98, 97, 254, 236, 98, 252, 255, 254, 252, 160, 236, 160
200 DATA 124, 226, 124, 255, 225, 236, 225, 226, 254, 251, 255, 254, 160, 251, 236, 160
210 DATA 108, 127, 225, 98, 108, 252, 225, 251, 98, 127, 254, 254, 252, 251, 160, 160
220 DATA 32, 32, 124, 123, 108, 123, 225, 124, 98, 108, 255, 254, 98, 225, 255, 254
230 DATA 32, 126, 124, 32, 108, 126, 225, 226, 108, 127, 124, 225, 127, 251, 226, 251
240 DATA 32, 126, 32, 123, 108, 97, 108, 126, 98, 127, 123, 98, 252, 127, 97, 252
250 DATA 32, 126, 124, 123, 32, 97, 124, 226, 123, 126, 255, 255, 97, 226, 236, 236
260 rem this last line has all the different types of squares
270 DATA 32, 126, 124, 123, 108, 97, 225, 226, 98, 127, 255, 254, 252, 251, 236, 160
280 rem coordinate to set he point
290 x=0 : rem from 0 to 49
300 y=0 : rem from 0 to 79
310 gosub 6000
320 x=1
330 y=1
340 gosub 6000
350 rem for j = 0 to 38 :x=x+1:y=y+1: gosub 310:next j
360 rem x=x+1:gosub 310
370 rem for h = 0 to 39 :x=x+1:y=y-1: gosub 310:next h
380 end
6000 l = 0: goto 6020
6010 l = 1
6020 y2 = 49 -y:s=int(x/2):z=int(y2/2):po=s+40*z
6030 rem po is the position where I want the character relative to the screen start
6040 rem x3 is the character currently on the screen
6050 rem x1 is left or right in the square
6060 rem x2 is up or down in the square
6070 x1=x-2*s:x2=y2-2*z:x3=peek(1024+po)
6080 rem f is a variable for found
6090 f=0:for i = 0 to 15:if x3=p2%(i) then x3=i:f=1
6100 next i
6110 rem if f=0 then it is not found if l=1 it is delete so go back as
6120 rem there is no character
6130 if f=0 then x3=0: if l=1 then return
6140 rem load x3 as the character to add using
6150 rem 1 as we are adding and not deleting
6160 rem x1 is
6170 rem example for x=0 y=0
6180 rem s=0, y2=49, z=24,po=0+40*24=960 or the first char of the last line
6190 rem l=0,x1=0, x2=49-2*24=1, x3=character in the position 960
6200 rem we look at the table as x3 was not found it is 0
6210 rem so we are looking for 0,0,1,0
6220 rem 001 is 1 in bynary so we look at row 2 as we are starting at 0
6230 rem in row 2 we look for character in the position 0 it is 123
6240 rem 126 is the square in the left and down position commodore + f
6250 print po,l,x1,x2,x3,pd%(l,x1,x2,x3)
6260 poke 1024+po,pd%(l,x1,x2,x3):poke 55296+po,co:return
6270 rem lower left corner 0,0 top 49,79
6280 rem if we run it a second time with x=1 and y=1 it will go with this numbers
6290 rem l=0,x1=1, x2=0, x3=character in the position 960 in the table p2 it is 3
6300 rem so it will add a square in the upper right corner keeping the square
6310 rem on the lower right corner of the position that is character 255







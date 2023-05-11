1 PRINT "{clear}":co=14
10 dim p2% (15), pd%(1,1,1,15)
20 for b = 0 to 1 : for x = 0 to 1 :for y = 0 to 1: for z = 0 to 15
30 read pd% (b,x,y,z): next z,y,x,b
40 for x = 0 to 15 
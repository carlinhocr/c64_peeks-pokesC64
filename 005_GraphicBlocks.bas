1 PRINT "{clear}":co=12
10 dim p2% (15), pd%(1,1,1,15)
20 for b = 0 to 1 : for x = 0 to 1 :for y = 0 to 1: for z = 0 to 15
30 read pd% (b,x,y,z): next z,y,x,b
40 for x = 0 to 15 : read p2% (x):next x
50 DATA 126, 126, 226, 97, 127, 97, 251, 226, 252, 127, 236, 160, 252, 251, 236, 160
51 DATA 123, 97, 255, 123, 98, 97, 254, 236, 98, 252, 255, 254, 252, 160, 236, 160
52 DATA 124, 226, 124, 255, 225, 236, 225, 226, 254, 251, 255, 254, 160, 251, 236, 160
53 DATA 108, 127, 225, 98, 108, 252, 225, 251, 98, 127, 254, 254, 252, 251, 160, 160
54 DATA 32, 32, 124, 123, 108, 123, 225, 124, 98, 108, 255, 254, 98, 225, 255, 254
55 DATA 32, 126, 124, 32, 108, 126, 225, 226, 108, 127, 124, 225, 127, 251, 226, 251
56 DATA 32, 126, 32, 123, 108, 97, 108, 126, 98, 127, 123, 98, 252, 127, 97, 252
57 DATA 32, 126, 124, 123, 32, 97, 124, 226, 123, 126, 255, 255, 97, 226, 236, 236
58 DATA 32, 126, 124, 123, 108, 97, 225, 226, 98, 127, 255, 254, 252, 251, 236, 160
60000 l = 0: goto 60010
60001 l = 1
60010 y = 49 -y:s=int(x/2):z=int(y/2):po=s+40*z
60020 x1=x-2*s:x2=y-2*z:x3=peek(1024+po)
60030 f=0:for i = 0 to 15:if x3=p2%(i) then x3=i:f=1
60040 next i
60050 if f=0 then x3=0: if l=1 then return
60060 poke 1024+po,pd%(l,x1,x2,x3):poke 55296+po,co:return







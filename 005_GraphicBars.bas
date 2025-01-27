10 rem graphic bars
20 PRINT "{clear}"
30 PRINT "              graphic bars"
40 dim xa$(7):for i = 0 to 7:read xa$(i):next
50 data " ","{165}","{180}","{181}","{161}","{reverse on}{182}{reverse off}","{reverse on}{170}{reverse off}","{reverse on}{167}{reverse off}"
60 y = 100 : rem longitud barra
70 x= 10 : rem linea donde aparece la barra 0 a 39
80 v=5 :rem here starts the bar in column 5
90 c0 = 5 : rem definir el color
100 gosub 200
110 y = 51
120 x=11
130 c0 = 3 : rem definir el color
140 gosub 200
150 y = 55
160 x=12
170 c0 = 7 : rem definir el color
180 gosub 200
185 wait 653,2 :rem wait sfor the commodore key to be pressed
190 end
200 ym=320-v*8:an$="":if y > ym then y = ym
210 xa = y /8:g=int(xa):xa=(xa-g)*8
220 if g>0 then for i = 1 to g:an$ = an$+"{reverse on} {reverse off}":next i
230 an$ = an$+xa$(xa)
240 c1=peek(214):c2=peek(211):c3=peek(646)
250 poke 646,c0:poke 214,x: poke 211,v:sys 58732 : print an$
260 poke 646,c3:poke 214,c1: poke 211,c2:sys 58732: return
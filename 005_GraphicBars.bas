1 rem graphic bars
10 dim xa$(7):for i = 0 to 7:read xa$(i):next
20 data " ","{165}","{180}","{181}","{161}","{reverse on}{182}{reverse off}","{reverse on}{170}{reverse off}","{reverse on}{167}{reverse off}"
30 y = 100 : rem longitud barra
40 x= 10 : rem linea donde aparece la barra 0 a 39
45 v=5 :rem here starts the bar
50 c0 = 5 : rem definir el color
60 gosub 60500
70 y = 51
80 x=11
90 gosub 60500
95 y = 55
96 x=12
97 gosub 60500
100 end
60500 ym=320-v*8:an$="":if y > ym then y = ym
60510 xa = y /8:g=int(xa):xa=(xa-g)*8
60520 if g>0 then for i = 1 to g:an$ = an$+"{reverse on} {reverse off}":next i
60530 an$ = an$+xa$(xa)
60540 c1=peek(214):c2=peek(211):c3=peek(646)
60550 poke 646,c0:poke 214,x: poke 211,v:sys 58732 : print an$
60560 poke 646,c3:poke 214,c1: poke 211,c2:sys 58732: return
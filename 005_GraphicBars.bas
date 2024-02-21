1 rem graphic bars
10 dim xa$(7):for i = 0 to 7:read xa$(i):next
20 data chr$(32),165,180,181,161,182,170,167
30 y = 100 : rem longitud barra
40 x= 10 : rem linea donde aparece la barra 0 a 39
50 c0 = 5 : rem definir el color
60500 ym=320-v*8:an$="":if y < ym then y = ym
60510 xa = y /8:g=int(xa):xa=(xa-g)*8
60520 if g>0 then for i = 1 to g:an$ = an$+" ":next i
60530 an$ = an$+xa$(xa)
60540 c1=peek(214):c2=peek(211):c3=peek(646)
60550 poke 646,c0:poke 214,x: poke 211,v:sys 58732 : print an$
60560 poke 646,c3:poke 214,c1: poke 211,c2:sys 58732: return
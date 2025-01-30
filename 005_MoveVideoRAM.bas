10 print"{clear}"
20 rem move video ram from 1024 to 12288 = 1100 11000001
30 rem k = kilobyte for ram, in this case 12
40 k = 12
50 poke 53272, (peek (53272) and 15) or k *16
60 rem  tell the operating system where to print characters
70 poke 648,k * 4
80 rem try poke 12290,0 to see a @ sign
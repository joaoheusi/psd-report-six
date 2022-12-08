
0: RF[0]=#C[8] -> Colocar valor da constante no registrador 0
1: RF[1]=D[1] -> Lê da posição 1 da memória de dados para o registrador 1
2: RF[2]=RF[0]+RF[1] -> Soma o valor do registrador 0 com o registrador 1 no registrador 2
3: D[9]=RF[2] -> armazena na memória de dados posição 9 o valor do registrador 2

Desired program 
0: 0011 0000 00001000
1: 0000 0001 00000001
2: 0010 0010 0000 0001
3: 0001 0010 00001001
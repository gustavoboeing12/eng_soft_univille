lista = [1,2,2,3,4,1,5]

lista_ordernada = []

for i in range(0,len(lista)):
    if(lista[i] in lista_ordernada):
        continue
    else:
        lista_ordernada.append(lista[i])

print(lista_ordernada)
    


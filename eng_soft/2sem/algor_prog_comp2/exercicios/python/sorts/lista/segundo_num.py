lista = [10,4,6,3,2,8,5]
maior = 0
segundo = 0

for i in range(0,len(lista)):
    if(lista[i] > maior):
        maior = lista[i]
    if(lista[i] < maior and lista[i] > segundo):
        segundo = lista[i]

print(maior, segundo)
    


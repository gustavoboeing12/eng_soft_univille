lista1 = [1,3,5]
lista2 = [2,4,6]
lista_total = []

for i in range(0,len(lista1)):
    if(lista1[i] < lista2[i]):
        lista_total.append(lista1[i])
        lista_total.append(lista2[i])
    else:
        lista_total.append(lista2[i])
        lista_total.append(lista1[i])

print(lista_total)
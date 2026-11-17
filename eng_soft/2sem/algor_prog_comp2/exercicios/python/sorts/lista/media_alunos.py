lista = [10,4,6,3,2,8,5]
media = sum(lista)/len(lista)
lista_aprov = []

for i in range(0,len(lista)):
    if(lista[i] >= 6):
        lista_aprov.append(lista[i])

print("Lista dos aprovados sucker:",lista_aprov)
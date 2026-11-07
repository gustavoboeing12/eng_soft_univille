lista = [2,4,72,7,67,9]

for i in range(1,len(lista)):
    menor = lista[i]
    j = i - 1
    while(j>=0 and lista[j]>menor):
        lista[j+1] = lista[j]
        j -= 1
    lista[j+1] = menor

print(lista)
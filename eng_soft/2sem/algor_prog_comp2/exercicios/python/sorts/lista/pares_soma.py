lista = [1,4,6,3,2,5,5]
soma = 0

for i in range(0,len(lista)):
    if(lista[i] % 2 == 0):
        soma += lista[i]

print(f"Soma dos pares da lista: {soma}")
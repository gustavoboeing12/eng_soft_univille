lista = [1,4,6,-3,-2,-5,5]
maior = 0

for i in range(0,len(lista)):

    if(lista[i] >= maior):
        maior = lista[i]

print(f"Maior número na lista: {maior}")
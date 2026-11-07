lista = [1,4,5,2,8,9,3]
for i in range(0,len(lista)-1):
    posiMenor = i
    for j in range(i+1,len(lista)):
        if(lista[posiMenor] > lista[j]):
            posiMenor = j
    lista[posiMenor],lista[i] = lista[i],lista[posiMenor]
print(lista)
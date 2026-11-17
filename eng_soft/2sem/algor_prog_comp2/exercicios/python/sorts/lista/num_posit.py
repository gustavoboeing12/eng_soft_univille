lista = [1,4,5,-3,-2,-5,5]
posit = 0

for i in range(len(lista)):
    if(lista[i] >= 0):
        posit += 1

print(f"Números positivos na lista: {posit}")
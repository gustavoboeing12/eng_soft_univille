quant = int(input("Digite a quantidade de notas que serão inseridas: "))
lista = []
for i in range(0,quant):
    nota = float(input(f"Digite a nota {i+1}: "))
    lista.append(round(nota,2))

for i in range(0,quant):
    if(lista[i] >= 6):
        lista[i] += 0.5
        if(lista[i] >= 10):
            lista[i] = round(lista[i])

for i in range(0,quant):
    if(lista[i] >= 6): print(f"Aprovado! Nota: {lista[i]}")
    else: print(f"Reprovado! Nota: {lista[i]}")

dele = float(input("Qual nota se quer excluir ai?: "))
lista.remove(dele)
print(lista)


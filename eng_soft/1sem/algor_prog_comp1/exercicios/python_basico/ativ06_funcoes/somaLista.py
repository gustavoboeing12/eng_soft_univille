def soma_lista(lista):
    soma = 0
    for numero in lista:
        soma += numero
    return soma

print(soma_lista([1, 2, 3, 4, 5]))
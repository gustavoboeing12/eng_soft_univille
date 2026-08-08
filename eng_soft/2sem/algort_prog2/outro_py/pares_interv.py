def quant_pares(inicio,fim):
    pares = 0
    for i in range(inicio,fim):
        if(i % 2 == 0):
            pares += 1
    return pares

inicio = int(input("Digite o início: "))
fim = int(input("Digite o final: "))

print(quant_pares(inicio,fim))

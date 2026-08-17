def contagem_reg(inicio):
    if(inicio <= 0):
        return "Maior que zero pls"
    
    for i in range(inicio,-1,-1):
        print(i)

inicio = int(input("Digite um número pra contagem regressiva: "))

contagem_reg(inicio)
        
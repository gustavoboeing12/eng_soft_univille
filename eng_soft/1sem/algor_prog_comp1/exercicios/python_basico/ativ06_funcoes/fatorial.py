def fatorial(x):
    resultado = 1
    if(x < 0):
        print("Não pode ser menor ou igual a 0!")
    else:
        for i in range(x, 1, -1):
            resultado *= i
    return resultado


x = int(input("Digite um número: "))
print(fatorial(x))
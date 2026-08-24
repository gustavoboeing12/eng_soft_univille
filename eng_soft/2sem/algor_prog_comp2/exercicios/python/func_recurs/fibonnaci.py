def fibonacci(num):
    if(num < 0):
        return "Número inválido"
    else:
        if(num == 0):
            return 0
        elif(num == 1):
            return 1
        else:
            return fibonacci(num-1)+fibonacci(num-2)

num = int(input("Escolha o número para o fibonacci: "))
print(fibonacci(num-1))

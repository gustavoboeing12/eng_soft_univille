def fatorial(x):
    if(x < 0):
        return("Não tem o anta")
    if(x == 0):
        return 1
    result = 1
    for i in range(x,1,-1):
        result *= i
    return result

x = int(input("Digite um número: "))

print(fatorial(x))
        
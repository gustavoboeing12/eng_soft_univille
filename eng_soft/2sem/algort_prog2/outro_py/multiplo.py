def multiplo(x,y):
    if(x % y == 0):
        return "X é múltiplo de Y"
    elif(y % x == 0):
        return "Y é múltiplo de X"
    else:
        return "Nenhum é múltiplo"

x = int(input("Digite o número 1: "))
y = int(input("Digite o número 2: "))

print(multiplo(x,y))
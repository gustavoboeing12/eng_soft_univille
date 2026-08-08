def maior2(x,y):
    if(x > y):
        return x
    elif(y > x):
        return y
    else:
        return "iguais"

x = float(input("Digite o número 1:\n "))
y = float(input("Digite o número 2:\n "))


print(maior2(x,y))
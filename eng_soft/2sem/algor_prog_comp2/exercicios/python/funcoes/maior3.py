def maior3(x,y,z):
    if(x > y and x > z):
        return x
    elif(y > x and y > z):
        return y
    else:
        return z

x = float(input("Digite o número 1:\n "))
y = float(input("Digite o número 2:\n "))
z = float(input("Digite o número 3:\n "))

maior = maior3(x,y,z)

print(maior)
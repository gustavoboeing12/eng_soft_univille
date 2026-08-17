def notas(x):
    if(x >= 9 and x<=10):
        return "A"
    elif(x < 9 and x>=8):
        return "B"
    elif(x < 8 and x>=7):
        return "C"
    elif(x < 7 and x>=6):
        return "D"
    elif(x < 6):
        return "F"
    elif(x < 0 or x > 10):
        print("Nota inválida 6767676767")

x = float(input("Digite a nota: "))

conversao = notas(x)

print(conversao)
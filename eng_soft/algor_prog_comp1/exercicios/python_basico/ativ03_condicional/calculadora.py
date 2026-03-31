num1 = float(input("Digite o primeiro número: "))
num2 = float(input("Digite o segundo número: "))
ope = int(input("Digite a operação desejada:\n 1.+ 2.- 3.* 4./"))

if(ope == 1):
    print("Resultado da soma: ",num1+num2)
elif(ope == 2):
    print("Resultado da subtração: ",num1-num2)
elif(ope == 3):
    print("Resultado da multiplicação: ",num1*num2)
else:
    print("Resultado da divisão: ",num1/num2)




def calculadora(num1,num2,oper):
    if(num2 == 0):
        return "Seu merda"
    match oper:
        case "+":
            return num1+num2
        case "-":
            return num1-num2
        case "*":
            return num1*num2
        case "/":
            return num1/num2
        case _:
            return "Opção inválida" 

num1 = float(input("Digite o número 1: "))
num2 = float(input("Digite o número 2: "))
oper = input("Digite o operador: (+ , - , * , / ): ")

print(calculadora(num1,num2,oper))
            
        
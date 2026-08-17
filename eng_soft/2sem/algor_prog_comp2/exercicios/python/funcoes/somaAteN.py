def somaAteN(num):
    result = 0
    for i in range(1,num+1):
        result += i
    return result

num = int(input("Digite um número pra soma: "))

print(somaAteN(num))


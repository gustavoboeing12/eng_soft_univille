num = int(input("Escolha o número para o fatorial: "))
resultado = 1

if(num <= 0):
    print("Não pode ser menor ou igual a 0!")
else:
    for i in range(num, 1, -1):
        resultado *= i

print(resultado)
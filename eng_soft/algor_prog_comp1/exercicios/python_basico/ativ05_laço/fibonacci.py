num = int(input("Escolha o número para o fibonacci: "))
resultado = 0
a = 0
b = 1

if(num <= 0):
    print("Não pode ser menor ou igual a 0!")
else:
    for i in range(1, num, 1):
        print(a, end=' ')
        a, b = b, a + b


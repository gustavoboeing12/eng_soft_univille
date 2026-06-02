def maior_num(x,y):
    if(x > y):
        print(f"{x} é maior!")

    elif(y > x):
        print(f"{y} é maior!")
    else:
        print("Eles são iguais!")

x = float(input("Digite um número: "))
y = float(input("Digite um outro número: "))

maior_num(x,y)


nota1 = float(input("Digite a primeira nota: "))
nota2 = float(input("Digite a segunda nota: "))

media = (nota1+nota2)/2

if(media >= 7):
    print(f"Você está aprovado com média {media}")
elif(media < 5):
    print(f"Você está reprovado com média {media}")
else:
    print(f"Você está de recuperação com média {media}")





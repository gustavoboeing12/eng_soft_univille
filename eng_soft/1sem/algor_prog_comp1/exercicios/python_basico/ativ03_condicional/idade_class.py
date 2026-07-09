idade = int(input("Digite sua idade: "))

if(idade <= 18):
    print(f"Criança ({idade} anos)")
elif(idade >= 60):
    print(f"Idoso ({idade} anos)")
else:
    print(f"Adulto ({idade} anos)")


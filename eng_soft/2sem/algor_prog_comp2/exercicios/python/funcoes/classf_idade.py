def classif(idade):
    if(idade < 12):
        return "Criança"
    elif(idade >= 12 and idade <= 17):
        return "Adolescente"
    elif(idade >= 18 and idade <= 59):
        return "Adulto"
    else:
        return "Idoso"
    
idade = int(input("Digite sua idade moribundo: "))

print(classif(idade))
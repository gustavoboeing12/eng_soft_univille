def classe(idade):
    if(idade < 16):
        return "Não eleitor"
    elif(idade >=16 and idade <=18 or idade > 65):
        return "Eleitor facultativo"
    else:
        return "Eleitor obrigatório"
    
idade = int(input("Digite sua idade moribundo: "))

i = classe(idade)

print(i)
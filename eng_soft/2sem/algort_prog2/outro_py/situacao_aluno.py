def aprovacao(nota1,nota2,nota3):
    media = (nota1+nota2+nota3)/3
    if(media >= 7):
        return "Aprovado"
    elif(media >= 5 and media < 7):
        return "Recuperação"
    elif(media < 5 and media >= 0):
        return "Reprovado"
    else:
        return "Média inválida"

nota1 = float(input("Digite a nota 1: ")) 
nota2 = float(input("Digite a nota 2: ")) 
nota3 = float(input("Digite a nota 3: ")) 

print(aprovacao(nota1,nota2,nota3))
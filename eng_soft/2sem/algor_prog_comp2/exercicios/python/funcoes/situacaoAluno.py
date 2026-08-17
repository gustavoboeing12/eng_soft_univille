def situacao(a,f,n):
    faltas = f/(a*0.01)
    if(faltas <= 25 and n >= 6):
        return 1
    else:
        return 0




a = int(input("Digite o número total de aulas: "))
f = int(input("Digite o número total de faltas: "))
n = float(input("Digite a nota: "))

aluno = situacao(a,f,n)

print(aluno)



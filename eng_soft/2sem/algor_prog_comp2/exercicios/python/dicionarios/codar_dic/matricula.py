aluno = {"num_matr":1, "nome": 'gustavo', "curso":'ADS',"idade":19}

num_matr = 1

while(num_matr != 0):
    num_matr = (input("Digite o numero da matrícula: \n"))
    if(num_matr == 0):
        break
    nome = (input("Digite o nome: \n"))
    curso = (input("Digite o curso da matrícula: \n"))
    idade = (input("Digite a idade: \n"))

    aluno["num_matr"].append(num_matr)
    aluno["nome"].append(nome)
    aluno["curso"].append(curso)
    aluno["idade"].append(idade)
    print(aluno)
print("Processo encerrado.")
print(aluno)
    
usu = input("Digite o usuário: ")
senha = input("\nDigite a senha: ")

if(usu != "admin"):
    print("Usuário não encontrado.")
elif(senha != "1234"):
    print("Senha incorreta.")
else:
    print("Acesso permitido!")
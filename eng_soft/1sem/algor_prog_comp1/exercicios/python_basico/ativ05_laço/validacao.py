def validar_login(senha):
    return senha == "1234"

tenta = ""

while not validar_login(tenta):
    tenta = input("Digite a senha: ")
    if not validar_login(tenta):
        print("Senha incorreta")

print("Login bem-sucedido")
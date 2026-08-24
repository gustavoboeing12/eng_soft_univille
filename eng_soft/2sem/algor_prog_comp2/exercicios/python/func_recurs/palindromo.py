def verifica_palindromo(s):
    if(len(s) <= 1):
        return "Palíndromo"
    else:
        if (s[0] == s[-1]):
            return verifica_palindromo(s[1:-1])
        else:
            return "Não é palíndromo"

s = str(input("Digite uma string: ")) # Lê a string do usuário

print(verifica_palindromo(s)) # Chama a função e imprime o resultado
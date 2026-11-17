palavras = ["casa", "carro", "casa", "livro", "carro", "casa"]

frequencia = {}

for palavra in palavras:
    if palavra in frequencia:
        frequencia[palavra] += 1
    else:
        frequencia[palavra] = 1

mais_frequente = max(frequencia, key=frequencia.get)

print("Frequência das palavras:", frequencia)
print("Palavra mais frequente:", mais_frequente)
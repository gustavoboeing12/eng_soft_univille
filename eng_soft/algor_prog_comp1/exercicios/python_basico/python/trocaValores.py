#
# Programa para ler dois valores e trocar entre si seus valores

valor1 = float(input("Digite o primeiro valor: \n"))
valor2 = float(input("Digite o segundo valor: \n"))

valor3 = valor2
valor2 = valor1
valor1 = valor3

print("Valores trocados: 1: ",valor1," 2: ",valor2)
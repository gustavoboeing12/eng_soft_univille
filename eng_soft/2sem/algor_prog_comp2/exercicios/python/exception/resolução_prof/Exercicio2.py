# Escreva um programa em Python que peça ao usuário para digitar um número inteiro. Use o
# bloco try e except para capturar qualquer erro na conversão e exibir a mensagem:
# "Entrada inválida! Por favor, digite apenas números."
# caso a conversão falhe.

try:
    num = int(input('digite um número inteiro'))
except ValueError:
    print('digite apenas números inteiros')
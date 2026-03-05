#
# Programa para calcular quantidade de latas de tinta necessárias

altura = float(input("Digite a altura do cilíndro: \n"))
raio = float(input("Digite o raio do cilíndro: \n"))

area = (2*3.14*(raio*raio)) + (2*3.14*raio*altura)
print("Área do cilíndro: ",area)

litros = area/3
print("Litros de tinta necessários: ",litros)

tintas = litros/5
print("Quantidade de latas de tinta: ",tintas)

preco = tintas*20
print("Preço para todas as tintas necessárias: ",preco)


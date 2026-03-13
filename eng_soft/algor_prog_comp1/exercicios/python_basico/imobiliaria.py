#
# Programa para calcular

nome = input("Digite o nome do corretor: \n")
quant = int(input("Digite a quantidade de imóveis vendidos por ele: \n"))
valorTot = float(input("Digite o valor total das vendas: \n"))

salFinal = 1500 + (200*quant) + (valorTot*0.05)

print("O salário final com acrescento de bônus é de: ",salFinal)
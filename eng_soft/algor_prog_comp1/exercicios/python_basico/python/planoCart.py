#
# Programa que le a entrada de 2 pontos de um plano P e Q, e imprima a distância
# entre eles

# Coleta de dados
x1 = float(input("Digite o ponto x1: \n"))
x2 = float(input("Digite o ponto x2: \n"))
y1 = float(input("Digite o ponto y1: \n"))
y2 = float(input("Digite o ponto y2: \n"))

# Cáluclo da distância do plano P Q
distancia = ((x2-x1)**2 + (y2-y1)**2)

# Print do resultado 
print("A distância entre os pontos é: ",distancia)
#
# Programa para cálcular a fórmula de bhaskara

a = int(input("Informe o valor de A: \n"))
b = int(input("Informe o valor de B: \n"))
c = int(input("Informe o valor de C: \n"))

delta = (b**2)-(4*a*c)

x1 = (-b + (delta**0.5)) / (2*a)
x2 = (-b - (delta**0.5)) / (2*a)

print(f"Valor de x1: {x1:.2f}")
print(f"Valor de x2: {x2:.2f}")


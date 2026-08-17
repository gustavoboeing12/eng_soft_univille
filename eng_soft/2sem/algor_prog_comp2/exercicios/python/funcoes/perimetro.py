def perimetro(x,y,z):
   return x+y+z


x = float(input("Digite o lado 1:\n "))
y = float(input("Digite o lado 2:\n "))
z = float(input("Digite o lado 3:\n "))

triangulo = perimetro(x,y,z)

print(triangulo)
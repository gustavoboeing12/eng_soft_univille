peso = float(input("Digite seu peso atual:(kg)"))
altura = float(input("Digite sua altura atual:(m)"))

imc = peso/(altura*altura)

if(imc < 18,5):
    print(f"Baixo peso. IMC {imc}")
elif(imc >= 18,5 and imc <= 24,9):
    print(f"Peso normal. IMC {imc}")
elif(imc >= 25 and imc <= 29,9):
    print(f"Sobrepeso. IMC {imc}")
else:
    print(f"Obesidade. IMC {imc}")

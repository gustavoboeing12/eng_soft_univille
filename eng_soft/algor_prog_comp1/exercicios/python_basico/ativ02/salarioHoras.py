horas = float(input("Digite o número de horas trabalhadas: "))
valorHora = float(input("Digite o valor da hora trabalhada: "))

salario = horas*valorHora
print(f"Salário base: {salario}")

salario -= salario*0.11
print(f"Salário com desconto do INSS(11%): {salario}")
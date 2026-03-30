#
# Programa para receber o ganho em horas e horas trabalhadas no mês, calcule as deduções(inss, imposto, sindicato), e calcular o salário líquido

# Coleta de dados
ganhoHora = float(input("Informe seu ganho em horas: \n"))
horaTrab = float(input("Informe o número de horas trabalhadas: \n"))

# Cálculos
salBruto = ganhoHora*horaTrab
imp = salBruto*11/100
inss = salBruto*8/100
sind = salBruto*5/100
vt = imp+inss+sind
salaLiq = salBruto - vt

# Print das informações
print(f"INSS: {inss}, Imposto: {imp}, Sindicato: {sind}.")
print(f"Salário líquido: {salaLiq:.2f}")

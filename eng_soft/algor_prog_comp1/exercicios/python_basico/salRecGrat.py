#
# Programa para calcular salário base e a receber

# Coleta de dados
salBase = float(input("Informe seu salário: \n"))
grat = float(input("Informe a porcentagem da gratificação(número inteiro): \n"))

# Cálculo de gratificação e imposto
salReceber = salBase + (salBase*grat/100)
print("Gratificação: ",salReceber-salBase,"\n")

imp = salReceber*7/100
salReceber -= imp

# Print do resultado
print("Imposto: ",imp,"\n")
print("O salário a receber(- imposto + gratificação) é: ",salReceber)
#
# Programa para calcular salário base e a receber

# Coleta de dados
salBase = float(input("Informe seu salário: \n"))

# Cálculo de gratificação e imposto
salReceber = salBase + (salBase*5/100)
imp = salReceber*7/100
salReceber -= imp

# Print do resultado
print("O salário a receber(- imposto) é: ",salReceber)
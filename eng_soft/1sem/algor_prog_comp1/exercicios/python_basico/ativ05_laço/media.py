total = 0
for i in range(1,6):
    nota = float(input(f"Digite a {i} nota: "))
    total += nota

print("Média das 5 notas é: ",total/5)
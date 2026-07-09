quant_num = int(input("Digite a quantidade de números a ser inserido: "))
num_posi = 0

for i in range(quant_num):
    num = float(input(f"Digite o {i+1} número: "))
    if(num >= 0):
        num_posi += 1

print(f"Quantidade de números positivos: ",num_posi)

#
# Programa para receber velocidade média e distância em kilometros, e faça as medidas de tempo em horas, minutos e segundos

velocMedia = float(input("Digite a velocidade média: \n"))
distancia = float(input("Digite a distância em km: \n"))

tempo = distancia/velocMedia

tempoS = int(tempo*3600)

horas = int(tempoS/3600)
tempoS = int(tempoS%3600)

minutos = int(tempoS/60)
segundos = int(tempoS%60)

print("%05d:%02d:%02d"%(horas,minutos,segundos))
print("O tempo estimado é de %5.2fhoras"% tempo)


import time
opcoes = 0

while opcoes != 4:
    opcoes = int(input("Menú de opções: \n1-Corinthians \n2-Corinthians de novo \n3-Mais Corinthians \n4-Sair\n"))
    if(opcoes <=0 or opcoes >= 5):
        print("Opção inválida")
        time.sleep(2)
    match opcoes:
        case 1:
            print("O maior time do Brasil")
            time.sleep(2)
        case 2:
            print("A melhor torcida do mundo")
            time.sleep(2)
        case 3:
            print("Tetracampeão da Copa do Brasil")
            time.sleep(2)
print("Programa finalizado")
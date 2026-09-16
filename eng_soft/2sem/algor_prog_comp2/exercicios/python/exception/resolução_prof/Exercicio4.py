# Escreva uma função chamada somar_elementos(lista, indice_1, indice_2) que
# recebe uma lista de dados e dois índices para somar os valores presentes nessas posições.
# Tente realizar a soma dos elementos apontados por indice_1 e indice_2.
# Trate de forma independente as exceções:
# IndexError: Se algum dos índices estiver fora do limite da lista.
# TypeError: Se os elementos nas posições indicadas não puderem ser somados (ex:
# somar uma string com um número).
# Utilize o recurso as e para capturar a mensagem nativa do erro e exibi-la formatada no
# console (exemplo: print(f"Erro capturado pelo Python: {e}")).

def somar_elementos(lista, indice_1, indice_2):
    try:
        return lista[indice_1]+lista[indice_2]
    except  IndexError as e:    
        print(f"Erro capturado pelo Python: {e}")
    except TypeError as e:
        print(f"Erro capturado pelo Python: {e}")


lista = [1,2,'a',9]
somar_elementos(lista,0,2)
def calcular_inversos(lista_dados):
    dados = []
    try:
        for item in lista_dados:
            dados.append(100/item)
    except (ValueError, TypeError, ZeroDivisionError) as e:
        print(f"Falha ao processar o item '{item}': {e}")
    return dados  

def calcular_inverso(lista_dados):
    dados = []
    for item in lista_dados:
        try:
            dados.append(100/item)
        except (ValueError, TypeError, ZeroDivisionError) as e:
            print(f"Falha ao processar o item '{item}': {e}")
    return dados              

dados_brutos = [10, "20", "trinta", 0, [5, 5], 50, None, "100"]
retorno = calcular_inverso(dados_brutos)
print(retorno)


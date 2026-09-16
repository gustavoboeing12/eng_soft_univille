from pathlib import Path

# Pega o diretório da pasta onde o script atual (.py) está salvo
diretorio_script = Path(__file__).resolve().parent

# Define o caminho do arquivo concatenando com o diretório
caminho_arquivo = diretorio_script / 'arquivo.txt'

# Abre e lê o arquivo
try:
    nota = []
    with open(caminho_arquivo, 'r', encoding='utf-8') as arquivo:
        for linha in arquivo:
            nota.append(float(linha))
except FileNotFoundError:
    print("Erro: O arquivo informado não foi encontrado no sistema.")   
except ValueError:
    print('o arquivo deve conter apenas números ')
else:
    print(f'a média da turma {sum(nota)/len(nota)}')
         
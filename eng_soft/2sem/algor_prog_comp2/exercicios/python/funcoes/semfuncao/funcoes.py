estoque = [
    {"id": 1, "nome": "Notebook", "preco": 3500.0, "qtd": 5},
    {"id": 2, "nome": "Mouse", "preco": 80.0, "qtd": 15},
    {"id": 3, "nome": "Teclado", "preco": 150.0, "qtd": 10}
]

carrinho = []
taxa_imposto_padrao = 0.05


def exibir_menu():
    print("\n" + "=" * 30)
    print("      SISTEMA DE ESTOQUE      ")
    print("=" * 30)
    print("1. Listar Produtos")
    print("2. Adicionar ao Carrinho")
    print("3. Exibir Carrinho e Total")
    print("4. Cadastrar Novo Produto")
    print("0. Sair")

    return input("\nEscolha uma opção: ")


def listar_produtos(estoque):
    print("\n--- PRODUTOS DISPONÍVEIS ---")

    if not estoque:
        print("Estoque vazio.")
    else:
        for item in estoque:
            print(
                f"ID: {item['id']} | "
                f"Nome: {item['nome']} | "
                f"Preço: R$ {item['preco']:.2f} | "
                f"Estq: {item['qtd']}"
            )


def buscar_produto(estoque, id_produto):
    for item in estoque:
        if item["id"] == id_produto:
            return item

    return None


def adicionar_ao_carrinho(estoque, carrinho):
    print("\n--- ADICIONAR AO CARRINHO ---")

    id_busca = input("Digite o ID do produto: ")

    if not id_busca.isdigit():
        print("Erro: ID deve ser um número inteiro.")
        return

    id_busca = int(id_busca)

    produto_encontrado = buscar_produto(estoque, id_busca)

    if produto_encontrado is None:
        print("Erro: Produto não encontrado.")
        return

    qtd_desejada = input(
        f"Quantidade desejada de '{produto_encontrado['nome']}': "
    )

    if not qtd_desejada.isdigit():
        print("Erro: Quantidade inválida.")
        return

    qtd_desejada = int(qtd_desejada)

    if qtd_desejada <= 0 or qtd_desejada > produto_encontrado["qtd"]:
        print("Erro: Quantidade indisponível no estoque.")
        return

    produto_encontrado["qtd"] -= qtd_desejada

    no_carrinho = False

    for item_c in carrinho:
        if item_c["id"] == produto_encontrado["id"]:
            item_c["qtd"] += qtd_desejada
            no_carrinho = True
            break

    if not no_carrinho:
        carrinho.append({
            "id": produto_encontrado["id"],
            "nome": produto_encontrado["nome"],
            "preco": produto_encontrado["preco"],
            "qtd": qtd_desejada
        })

    print(
        f"Sucesso: {qtd_desejada}x "
        f"'{produto_encontrado['nome']}' "
        f"adicionado(s) ao carrinho!"
    )


def calcular_total(subtotal, taxa=0.05):
    valor_imposto = subtotal * taxa
    total_final = subtotal + valor_imposto

    return valor_imposto, total_final


def exibir_carrinho(carrinho):
    print("\n--- SEU CARRINHO ---")

    if not carrinho:
        print("O carrinho está vazio.")
        return

    subtotal = 0.0

    for item in carrinho:
        total_item = item["preco"] * item["qtd"]
        subtotal += total_item

        print(
            f"- {item['nome']} "
            f"(x{item['qtd']}): "
            f"R$ {total_item:.2f}"
        )

    aplicar_taxa = input(
        "\nDeseja aplicar taxa de entrega/serviço customizada? (s/N): "
    ).strip().lower()

    taxa_aplicada = taxa_imposto_padrao

    if aplicar_taxa == "s":
        val_taxa = input(
            "Digite a taxa decimal (ex: 0.10 para 10%): "
        )

        try:
            taxa_aplicada = float(val_taxa)
        except ValueError:
            print("Valor inválido. Mantendo taxa padrão de 5%.")

    valor_imposto, total_final = calcular_total(
        subtotal,
        taxa_aplicada
    )

    print("-" * 30)
    print(f"Subtotal: R$ {subtotal:.2f}")
    print(
        f"Taxa ({taxa_aplicada * 100:.1f}%): "
        f"R$ {valor_imposto:.2f}"
    )
    print(f"TOTAL FINAL: R$ {total_final:.2f}")


def gerar_novo_id(estoque):
    if not estoque:
        return 1

    maior_id = max(item["id"] for item in estoque)

    return maior_id + 1


def cadastrar_produto(estoque):
    print("\n--- CADASTRO DE PRODUTO ---")

    nome_novo = input("Nome do produto: ").strip()
    preco_novo = input("Preço do produto: ")
    qtd_nova = input("Quantidade inicial em estoque: ")

    try:
        preco_novo = float(preco_novo)
        qtd_nova = int(qtd_nova)

        if nome_novo and preco_novo > 0 and qtd_nova >= 0:
            novo_id = gerar_novo_id(estoque)

            estoque.append({
                "id": novo_id,
                "nome": nome_novo,
                "preco": preco_novo,
                "qtd": qtd_nova
            })

            print(
                f"Produto '{nome_novo}' "
                f"cadastrado com sucesso! "
                f"ID: {novo_id}"
            )

        else:
            print("Erro: Dados inválidos para o produto.")

    except ValueError:
        print("Erro: Preço e Quantidade devem ser numéricos.")


executando = True

while executando:
    opcao = exibir_menu()

    if opcao == "1":
        listar_produtos(estoque)

    elif opcao == "2":
        adicionar_ao_carrinho(estoque, carrinho)

    elif opcao == "3":
        exibir_carrinho(carrinho)

    elif opcao == "4":
        cadastrar_produto(estoque)

    elif opcao == "0":
        print("\nEncerrando o sistema. Até logo!")
        executando = False

    else:
        print("\nOpção inválida! Tente novamente.")
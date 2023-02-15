    # Casos de sucesso

    Scenario: Uma postagem presente
        Given Eu estou na página "Homepage"
        And Existe uma postagem com o título "Postagem de teste" e categoria "Categoria de teste"
        And Eu seleciono a categria "Categoria de teste" no campo de busca
        When Eu clico no botão "Buscar"
        Then Eu devo ver "Postagem de teste" na lista de resultados

    Scenario: Três postagens presentes
        Given Eu estou na página "Homepage"
        And Existe uma postagem com o título "Postagem de teste 1" e categoria "Categoria de teste"
        And Existe uma postagem com o título "Postagem de teste 2" e categoria "Categoria de teste"
        And Existe uma postagem com o título "Postagem de teste 3" e categoria "Categoria de teste"
        And Eu seleciono a categria "Categoria de teste" no campo de busca
        When Eu clico no botão "Buscar"
        Then Eu devo ver "Postagem de teste 1" na lista de resultados
        And Eu devo ver "Postagem de teste 2" na lista de resultados
        And Eu devo ver "Postagem de teste 3" na lista de resultados

    Scenario: Busca em post
        Given Existe uma postagem com o título "Postagem de teste" e categoria "Categoria de teste"
        And Dentro da postagem "Postagem de teste" existe um comentario com categoria "Categoria de teste" e texto "Comentario de teste"
        And Eu estou na página "Postagem de teste"
        And Eu seleciono a categria "Categoria de teste" no campo de busca
        When Eu clico no botão "Buscar"
        Then Eu devo ver "Comentario de teste" na lista de resultados

    # Casos de falha

    Scenario: Postagem não pertence a categoria
        Given Eu estou na página "Homepage"
        And Existe uma postagem com o título "Postagem de teste" e categoria "Categoria de teste"
        And Existe uma postagem com o título "Postagem de teste 2" e categoria "Categoria de teste 2"
        And Eu seleciono a categria "Categoria de teste 2" no campo de busca
        When Eu clico no botão "Buscar"
        Then Eu devo ver apenas "Postagem de teste 2" na lista de resultados

    Scenario: Categoria vazia
        Given Eu estou na página "Homepage"
        And Não existe uma postagem com a categoria "Categoria de teste"
        And Eu seleciono a categria "Categoria de teste" no campo de busca
        When Eu clico no botão "Buscar"
        Then Eu devo ver a mensagem de erro "Nenhuma postagem encontrada" na lista de resultados

    Scenario: Categoria não selecionada
        Given Eu estou na página "Homepage"
        And O campo de busca de categoria não está selecionado
        When Eu clico no botão "Buscar"
        Then Eu devo ver a mensagem de erro "Nenhuma categoria selecionada" na lista de resultados

    Scenario: Categoria vazia com postagem criada em outra categoria
        Given Eu estou na página "Homepage"
        And Existe uma postagem com o título "Postagem de teste" e categoria "Categoria de teste"
        And Não existe uma postagem com a categoria "Categoria de teste 2"
        And Eu seleciono a categria "Categoria de teste 2" no campo de busca
        When Eu clico no botão "Buscar"
        Then Eu devo ver a mensagem de erro "Nenhuma postagem encontrada" na lista de resultados


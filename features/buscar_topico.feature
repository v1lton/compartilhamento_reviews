Feature: Busca por categoria

    # Casos de sucesso

    Scenario: Uma postagem presente
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma postagem com o conteudo "Conteudo de teste", categoria "Categoria de teste" e professor "Professor de teste", criada pelo usuario "test_user" que tem email "test@test.com"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And Eu preencho o campo de busca com "Categoria de teste"
        When Eu clico no botão buscar
        Then Eu devo ver uma postagem com o conteúdo "Conteudo de teste" e categoria "Categoria de teste"

    Scenario: Duas postagens presentes
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma postagem com o conteudo "Conteudo de teste", categoria "Categoria de teste" e professor "Professor de teste", criada pelo usuario "test_user" que tem email "test@test.com"
        And Existe uma postagem com o conteudo "Conteudo de teste2", categoria "Categoria de teste2" e professor "Professor de teste2", criada pelo usuario "test_user2" que tem email "test2@test.com"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And Eu preencho o campo de busca com "Categoria de teste"
        When Eu clico no botão buscar
        Then Eu devo ver uma postagem com o conteúdo "Conteudo de teste" e categoria "Categoria de teste"
        And Eu não devo ver uma postagem com o conteúdo "Conteudo de teste2" e categoria "Categoria de teste2"

    # Casos de falha

    Scenario: Categoria vazia
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And Existe uma categoria com o nome "Categoria de teste"
        And Eu preencho o campo de busca com "Categoria de teste"
        When Eu clico no botão buscar
        Then Eu devo ver uma mensagem de erro "Infelizmente não encontramos nenhum resultado para Categoria de teste"

    Scenario: Categoria não existente
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And Eu preencho o campo de busca com "Categoria de teste"
        When Eu clico no botão buscar
        Then Eu devo ver uma mensagem de erro "A categoria Categoria de teste não existe"

    Scenario: Categoria não selecionada
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        When Eu clico no botão buscar
        Then Eu devo ver uma mensagem de erro "Nenhuma categoria selecionada"


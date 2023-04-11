Feature: Criar reviews

    Feature responsável pelo envio das informações contidas em um review.

    Scenario: Enviar um review sem conteúdo
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma categoria com o nome "Categoria de teste" 
        And Existe um professor com o nome "Professor de teste"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And O professor "Professor de teste" está no historico de professores 
        And Eu clico no botão Novo Review
        And Eu seleciono o professor "Professor de teste"
        And Eu seleciono a categoria "Categoria de teste"
        When Eu clicar no botão enviar
        Then A mensagem de erro "Escreva um review!" será exibida
        
    Scenario: Enviar um review bem sucedido sem escolher o professor
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma categoria com o nome "Categoria de teste" 
        And Existe um professor com o nome "Professor de teste"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And O professor "Professor de teste" está no historico de professores 
        And Eu clico no botão Novo Review
        And Eu digito "Esse professor mudou minha vida" para descrição
        And Eu seleciono a categoria "Categoria de teste"
        When Eu clicar no botão enviar
        Then A mensagem de erro "Selecione um professor!" será exibida

    Scenario: Enviar um review bem sucedido sem escolher a categoria
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma categoria com o nome "Categoria de teste" 
        And Existe um professor com o nome "Professor de teste"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And O professor "Professor de teste" está no historico de professores
        And Eu clico no botão Novo Review
        And Eu digito "Esse professor mudou minha vida" para descrição
        And Eu seleciono o professor "Professor de teste"
        When Eu clicar no botão enviar
        Then A mensagem de erro "Selecione uma categoria" será exibida
    
    Scenario: Enviar um review com conteúdo muito grande
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma categoria com o nome "Categoria de teste" 
        And Existe um professor com o nome "Professor de teste"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And O professor "Professor de teste" está no historico de professores 
        And Eu clico no botão Novo Review
        And Eu digito "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" para descrição
        And Eu seleciono o professor "Professor de teste"
        And Eu seleciono a categoria "Categoria de teste"
        When Eu clicar no botão enviar
        Then A mensagem de erro "Seu review não pode ter mais de 999 caracteres!" será exibida

    Scenario: Enviar um review bem sucedido com o professor e categoria selecionados
        Given Existe um usuário com o username "user", email "email@email.com", senha "user-user" e nome "user"
        And Existe uma categoria com o nome "Categoria de teste" 
        And Existe um professor com o nome "Professor de teste"
        And Eu estou autenticado com o usuário "user" e senha "user-user"
        And O professor "Professor de teste" está no historico de professores 
        And Eu clico no botão Novo Review
        And Eu digito "Esse professor mudou minha vida" para descrição 
        And Eu seleciono o professor "Professor de teste"
        And Eu seleciono a categoria "Categoria de teste"   
        When Eu clicar no botão enviar
        Then Eu devo ver o um review com a descrição "Esse professor mudou minha vida" feito pelo usuario "user" sobre o professor "Professor de teste" e com a categoria "Categoria de teste"


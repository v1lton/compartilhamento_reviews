Feature: criar posts

    Feature responsável pelo envio das informações contidas em um post.

    Background: 
        Given Eu estou na página "Página Inicial"

    Scenario: Enviar um post bem sucedido com filme já cadastrado
        When eu clico para "criar novo post"
        And Eu "Esse filme mudou minha vida" para "descrição"
        And Eu seleciono o filme "Bastardos Inglórios"
        When Eu clicar no botão "Enviar Post"
        Then Uma mensagem de sucesso será exibida
        And Eu consigo ver meu post na "lista de posts"

    Scenario: Enviar post bem sucedido sem escolher filme
        When Eu clico para "criar novo post"
        And Eu digito "Esse diretor não cansa de me surpreender" para descrição
        And Eu não seleciono o filme
        When Eu clicar no botao "Enviar Post"
        Then uma mensagem de erro será exibida

    Scenario: Enviar post sem digitar conteudo no campo de escrita
        When Eu clico para "criar novo post"
        Given Eu seleciono o filme "Star Wars"
        And Eu não digito no "campo de escrita"
        When Eu clicar no botao "Enviar Post"
        Then uma mensagem de erro será exibida

    Scenario: Enviar Post um review muito grande
        Given Eu digitei no "campo de escrita"
        And A quantidade chegou a "999" caracteres
        When Eu clicar no botao "Enviar Post"
        Then uma mensagem de erro será exibida

Feature: criar posts

    Feature responsável pelo envio das informações contidas em um post.

    Background: 
        Given Eu estou na página "Página Inicial"

    Scenario: Enviar um post bem sucedido com professor já cadastrado
        When eu clico para "criar novo post"
        And Eu "Esse professor mudou minha vida" para "descrição"
        And Eu seleciono o professor "Casemiro"
        When Eu clicar no botão "Enviar Post"
        Then Uma mensagem de sucesso será exibida
        And Eu consigo ver meu post na "lista de posts"

    Scenario: Enviar post bem sucedido sem escolher professor
        When Eu clico para "criar novo post"
        And Eu digito "Esse professor não cansa de me surpreender" para descrição
        And Eu não seleciono o professor
        When Eu clicar no botao "Enviar Post"
        Then uma mensagem de erro será exibida

    Scenario: Enviar post sem digitar conteudo no campo de escrita
        When Eu clico para "criar novo post"
        Given Eu seleciono o professor "Roberto"
        And Eu não digito no "campo de escrita"
        When Eu clicar no botao "Enviar Post"
        Then uma mensagem de erro será exibida

    Scenario: Enviar Post um review muito grande
        When Eu clico para "criar novo post"
        And A descrição chega a "999" caracteres
        When Eu clicar no botao "Enviar Post"
        Then uma mensagem de erro será exibida

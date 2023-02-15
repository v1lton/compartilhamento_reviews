Feature: criar posts

    Feature responsável pelo envio das informações contidas em um post.

    Background: 
        Given Eu estou na página "Página Inicial"
    
    Scenario: Abrir o pop-up de criação de post
        When Eu clico no botão "+"
        Then O "pop-up de criação" será aberto

    Scenario: Fechar pop-up de criação de post
        Given O "pop-up de criação" está aberto
        When Eu clico no "x"
        Then O "pop-up de criação" será fechado

    Scenario: Enviar um post bem sucedido com filme existente
        Given O "pop-up de criação" está aberto
        And Eu digito o conteúdo no "campo de escrita"
        And Eu seleciono um dos filmes no "campo de seleção"
        When Eu clicar no botão "Postar"
        Then Uma mensagem de sucesso será exibida
        And o "pop-up de criação" será fechado

   Scenario: Aparece a opção de criar filme
        Given O "pop-up de criação" está aberto
        When Eu digito "abracadabra" no "campo de seleção"
        And "abracadabra" não existe no sistema
        Then a opção criar "abracadabra" irá aparecer

    Scenario:Criar novo filme
        Given O "campo de seleção" está com a opção criar "abracadabra"
        And "abracadabra" não existe no sistema
        When Eu clico na opção criar "abracadabra"
        Then "abaracadbra" é inserido na lista
        And "abracadabra" é selecionado
    
    Scenario: Enviar post sem escolher filme
        Given Eu digito no "campo de escrita"
        And Eu não seleciono o filme no "campo de seleção"
        When Eu clicar no botao "Postar"
        Then uma mensagem de erro será exibida

    Scenario: Enviar post sem digitar conteudo no campo de escrita
        Given Eu seleciono o filme no "campo de seleção"
        And Eu não digito no "campo de escrita"
        When Eu clicar no botao "Postar"
        Then uma mensagem de erro será exibida


    Scenario: Postar um review muito grande
        Given Eu digitei no "campo de escrita"
        And A quantidade chegou a "999" caracteres
        When Eu clicar no botao "Postar"
        Then uma mensagem de erro será exibida

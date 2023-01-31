Scenario: Habilitar o botão
    Given Eu estou no topo da página "Página inicial"
    When Eu digito o caracter "a" no campo de escrita
    Then O botão "Postar" fica habilitado


Scenario: Postar um review
    Given Eu estou no topo da página "Página inicial"
    And O botão "Postar" está habilitado
    When Eu clico no botão "Postar"
    Then Eu consigo ver o post abaixo
    And O campo de escrita fica vazio 
    And O botão "Postar" fica desabilitado


Scenario: Postar um review muito grande
    Given Eu estou no topo da página "Página inicial"
    And Eu digitei "999" caracteres no campo de escrita
    And O botão "Postar" está habilitado
    When Eu digitar o caracter de número "1000"
    Then o botão "Postar será desabilitado"
    
Scenario: Postar um review sem internet
    Given Eu estou no topo da página "Página inicial"
    And Não existe conexão com a internet
    And O botão "Postar" está habilitado
    When Eu clico no botão "Postar"
    Then Uma mensagem de erro será retornada
    

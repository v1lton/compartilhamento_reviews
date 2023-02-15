Scenario: Seguir um usuário
    Given Eu estou conectado na conta minha conta "Scala"
    And Eu não sigo a usuária "Joana"
    When Eu navego para a página da usuária "Joana"
    And Eu clico no botão "Seguir"
    Then Eu recebo uma mensagem de confirmação
    And Eu vejo a página de perfil de "Joana" atualizada com o botão "Seguir" agora como "Parar de seguir"

Scenario: Parar de seguir um usuário
    Given Eu estou conectado na conta minha conta "Scala"
    And Eu sigo a usuária "Joana"
    When Eu navego para a página da usuária "Joana"
    And Eu clico no botão "Parar de seguir"
    Then Eu recebo uma mensagem de confirmação
    And Eu vejo a página de perfil de "Joana" atualizada com o botão "Parar de seguir" agora como "Seguir"

Scenario: Tentar seguir um usuário que já segue
    Given Eu estou conectado na conta minha conta "Scala"
    And Eu já sigo a usuária "Joana"
    When Eu navego para a página da usuária "Joana"
    Then Não encontro o botão "seguir"

Scenario: Ver lista de seguidores
    Given Eu estou conectado na conta minha conta "Scala"
    And Eu sou seguido por "Joana"
    And Estou na página "Meu perfil"
    When Eu navego para a página "Seguidores"
    Then Eu vejo uma lista dos usuários que eu sigo contendo "Joana"

Scenario: Ver lista de seguindo
    Given Eu estou conectado na conta minha conta "Scala"
    And Eu sigo "Joana"
    And Estou na página "Meu perfil"
    When Eu navego para a página "Seguindo"
    Then Eu vejo uma lista dos usuários que eu sigo contendo "Joana"

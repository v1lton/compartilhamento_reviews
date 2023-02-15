Scenario: Criar um novo usuário comum
    Given Eu estou na página "Cadastrar novo usuário"
    When Eu preencho "JRamos" para "Nome de usuário"
    And Eu preencho "joao@gmail.com" para "Email"
    And Eu escolho "k3Y*!W0rD)" para "Senha"
    And Eu preencho "João" para "Nome"
    And Eu preencho "Ramos de Oliveira" para "Sobrenome"
    And Eu preencho "Elu/delu" para "Pronomes"
    And Eu preencho "Brasil" para "País"
    And Eu confimo o cadastro do usuário
    Then Eu consigo ver a página "Início"

Scenario: Criar um novo usuário comum com um nome de usuário já registrado
    Given Eu estou na página "Cadastrar novo usuário" do website
    And Já existe um usuário com "JRamos" como "Nome de usuário" cadastrado
    When Eu preencho "JRamos" para "Nome de usuário"
    Then Eu vejo uma indição que o campo preenchido "Nome de usuário" já existe

Scenario: Remover um usuário comum
    Given Eu estou na página "Minhas informações"
    And Eu estou conectado como usuário comum "JRamos"
    When Eu aperto o botão "Removar"
    And Eu confirmo a remoção
    Then Eu retorno para "Página Inicial"

Scenario: Atualizar email de um usuário comum
    Given Eu estou na página "Minhas informações"
    And Eu estou conectado como usuário comum "JRamos"
    When Eu aperto no botão para editar o e-mail
    And Eu preencho o e-mail "joao@outlook.com" no campo "Email"
    And Eu clico no botão "Atualizar"
    And Eu confirmo a atualização
    Then Eu vejo o campo e-mail preenchido com "joao@outlook.com"
    
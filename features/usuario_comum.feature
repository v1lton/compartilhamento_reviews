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
    Then Eu recebo uma mensagem de confirmação
    And Eu consigo ver a página do usuário "JRamos"

Scenario: Criar um novo usuário comum com um nome de usuário já registrado
    Given Eu estou na "Cadastrar novo usuário" do website
    And Já existe um usuário com "JRamos" como "Nome de usuário" cadastrado
    When Eu preencho "JRamos" para "Nome de usuário"
    And Eu preencho "joaquim@bob.com.br" para "Email"
    And Eu preencho "ASDFJiwejr$33s2cPdd" para "Senha"
    And Eu preencho "Joaquim" para "Nome"
    Then Eu vejo uma mensagem de erro indicando que meu "Email" já existe

Scenario: Remover um usuário comum
    Given Eu estou na página "Excluir conta"
    And Eu estou conectado como usuário comum "JRamos"
    When Eu aperto o botão "Excluir conta"
    Then Eu recebo uma mensagem de confirmação
    And Eu retorno para "Página Inicial"

Scenario: Atualizar email de um usuário comum
    Given Eu estou conectado na conta minha conta "JRamos"
    When Eu navego para a página "Editar Perfil"
    And Eu preencho o e-mail "joao@outlook.com" no campo "Email"
    And Eu clico no botão "Salvar mudanças"
    Then Eu vejo uma mensagem de confirmação
    
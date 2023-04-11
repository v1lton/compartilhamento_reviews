Feature: Lista de professores
    Scenario: Adicionar um novo professor na minha lista
        Given Eu estou na página "Meus professores"
        And Eu seleciono a opção "Gabriel" na barra de seleção
        And Eu clico em "Add" para confirmar a adição
        Then Eu consigo ver "Gabriel" adicionado na lista

    Scenario: Remover um usuário comum
        Given Eu estou na página "Meus professores"
        And Eu clico em "Remover", ao lado do nome do professor "Gabriel"
        Then Eu consigo ver "Gabriel" removido na lista de professores

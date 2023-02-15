Scenario: Adicionar um novo professor na minha lista
    Given Eu estou na página "Meus professores"
    When Eu clico em "Editar Lista"
    And Eu seleciono a opção "Henrique Maciel" na barra de seleção
    And Eu clico em "+ Adicionar professor" para confirmar a adição
    Then Eu consigo ver "Henrique Maciel" adicionado na lista

Scenario: Remover um usuário comum
    Given Eu estou na página "Meus professores"
    When Eu clico em "Editar Lista"
    And Eu clico em "Remover", ao lado do nome do professor "Henrique Maciel"
    Then Eu consigo ver "Henrique Maciel" removido na lista de professores

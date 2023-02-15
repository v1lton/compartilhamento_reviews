Feature: Histórico de reviews

    Scenario: Acessar histórico nao vazio do usuario
        Given que eu estou na página "perfil de usuário" do usuário "Pedro"
        And "Pedro" já fez alguma review
        When eu clico em "visualizar histórico"
        Then eu vejo a página "histórico de reviews"
        And eu vejo uma lista de reviews feitos pelo usuário "Pedro" ordenados por data

    Scenario: Acessar histórico vazio
        Given que eu estou na página "perfil de usuário" do usuário "Ana"
        And "Ana" não fez nenhuma review
        When eu clico em "visualizar histórico"
        Then eu vejo uma janela com a mensagem "O usuario não tem reviews"

    Scenario: Abrir review através do histórico do usuário
        Given que eu estou na página "histórico de reviews" do usuário "Pedro"
        And eu vejo um review deste usuário sobre "Breno Miranda" com "ótimo professor"
        When eu clico na review em questão
        Then eu vejo a página do review com "ótimo professor"


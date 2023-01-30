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
        Then eu vejo a página "histórico de reviews"
        And eu vejo a mensagem "Este usuário ainda não fez nenhuma review"

    Scenario: Abrir post através do histórico do usuário
        Given que eu estou na página "histórico de reviews" do usuário "Pedro"
        And eu vejo um review deste usuário sob o post "Breno Miranda"
        And eu clico no post "Breno Miranda" 
        Then eu vejo a página do post de "Breno Miranda"
        // passo adicional para o exercicio 

    // novo cenario para o exercicio

    // um outro cenario para o exercicio

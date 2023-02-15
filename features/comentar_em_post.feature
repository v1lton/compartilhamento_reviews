Scenario: Postar comentário
	Given estou logado como "usuário comum" com login "ptlh" e senha "4321"
	And estou na página "Histórico de reviews" do usuário "agsa"
	And vejo o post do aluno "agsa" sobre o professor "professor A"
	When preenche a barra de comentários com "Muito legal!"
	And ainda estou na página "Histórico de reviews" do aluno "agsa"
	Then vejo a baixo do post do aluno "agsa" sobre o professor "professor A" o comentário "Muito legal!"

Scenario: Ocultar comentários
	Given estou logado como "usuário comum" com o login "agsa" e senha "1234"
	And estou na minha página "Histórico de reviews"
	And vejo o meu post sobre o professor "professor A"
	And vejo o campo de comentários preenchido com o comentario "Muito legal!" com usuário "ptlh"
	When seleciono os 3 pontos do lado direito do comentário
	And seleciono a opção "Ocultar"
	And ainda estou na minha página "Histórico de reviews" 
	Then não consigo mais ver o comentário "Muito legal!" do usuário "ptlh"
	And vejo agora a opção "Mostrar comentário"

Scenario: Apagar comentário
	Given estou logado como "usuário comum" com login "ptlh" e senha "4321"
	And estou na página "Histórico de reviews" do usuário "agsa"
	And vejo o meu comentário “Muito legal” no post do usuário "agsa" sobre o professor "Professor A"
	When seleciono os 3 pontos do lado direito do meu comentário "Muito legal!"
	And seleciono a opção "Apagar"
	And ainda estou na página "Histórico de reviews" do usuario "agsa"
	Then uma janela com a frase "Comentário apagado" é mostrada
	And não vejo mais o meu comentário no post do usuário "agsa" sobre o "Professor A"

Scenario: Referenciar comentário
	Given estou logado como "usuário comum" com login "ptlh" e senha "4321"
	And estou na página "Histórico de reviews" do usuário "agsa" 
	And vejo o comentário "Massa" do usuário "jdjr" no post do usuário "agsa" sobre o professor "Professor A" 
	When seleciono os 3 pontos do lado direito do comentáio "Massa" do usuario "jdjr"
	And seleciono a opção "referenciar"
	And eu preencho o comentário com "Tbm acho."
	And eu ainda estou na página "Histórico de reviews" do usuário "agsa"
	Then vejo o comentário "Tbm acho" referenciando o comentário "Massa"

Scenario: Curtir comentário
	Given estou logado como "usuário comum" com login "ptlh" e senha "4321"
	And estou na página "Histórico de reviews" do usuário "agsa"
	And vejo o comentário "Massa" do usuário "jdjr" no post do usuário "agsa" sobre o professor "Professor A"
	And vejo o coração com a cor branca, na parte inferior do comentário e com a numeração "4" ao lado
	When seleciono o coração na parte inferior do comentário
	And eu ainda estou na página "Histórico de reviews" do usuário "agsa"
	Then o coração fica de cor vermelha e com nuemeração "5" ao lado

Comentar em post

Cenários da feature:

Scenario: Postar comentário
	Given  estou logado como "usuário comum” com login “ptlh” e senha “4321”
	And    estou na página “Postagens sobre livros”
	And    vejo o post intitulado “As crônicas de gelo e fogo”
	When   preenche a barra de comentários com “Muito legal”
	And    ainda estou na página “Postagens sobre livros”
	Then   vejo a baixo do post “As crônicas de gelo e fogo” o comentário “Muito legal”

Scenario: Ocultar comentários
	Given  estou logado como "usuário comum” com o login “agsa” e senha “1234”
	And    estou na página “Meus posts”
	And    vejo o post intitulado “As crônicas de gelo e fogo”
	And    vejo o campo de comentários preenchido
	When   seleciono a opção “Ocultar comentários”
	And    ainda estou na página “Meus posts” 
	Then   não consigo mais ver os comentários de “ As crônicas de gelo e fogo”
	And    vejo agora a opção “Mostrar comentários"

Scenario: Apagar comentário
	Given  estou logado como "usuário comum" com login “ ptlh” e senha “4321”
	And    estou na página “Posts comentados” 
	And    vejo o meu comentário “Muito legal” no post “ As crônicas de gelo e fogo”
	When   seleciono a opção “Apagar”
	And    ainda estou na página “Posts comentados” 
	Then   uma janela com a frase “Comentario apagado” é mostrada
	And    não vejo mais o meu comentário no post “As crônicas de gelo e fogo”

Scenario: Referenciar comentário
	Given  estou logado como "usuário comum” com login “ ptlh” e senha “4321”
	And    estou na página “Posts comentados” 
	And    vejo o comentário “Massa” do usuário “jdjr” no post “As crônicas de gelo e fogo” 
	When   seleciono a opção “referenciar comentário”
	And    eu preencho o comentário com “Tbm acho”
	And    eu ainda estou na página “Posts comentados”
	Then   vejo o comentário “Tbm acho” referenciando o comentário “Massa”


Cenários defalha:

Scenario: Apagar comentário de falha
	Given  estou logado como "usuário comum" com login “ ptlh” e senha “4321”
	And    estou na página “Posts comentados” 
	And    vejo o meu comentário “Muito legal” no post “ As crônicas de gelo e fogo”
	When   seleciono a opção “Apagar”
	And    ainda estou na página “Posts comentados” 
	Then   ainda vejo o meu comentário no post “As crônicas de gelo e fogo” 

Scenario: Postar comentário com falha
	Given  estou logado como "usuário comum” com login “ptlh” e senha “4321”
	And    estou na página “Postagens sobre livros”
	And    vejo o post intitulado “As crônicas de gelo e fogo”
	When   preenche a barra de comentários com “Muito legal”
	Then   ainda estou na página “Postagens sobre livros”
	And    não vejo o meu comentario no post “As crônicas de gelo e fogo”
	And    ainda estou na página “Postagens sobre livros”
	Then   não vejo o meu comentario no post “As crônicas de gelo e fogo”

Scenario: Referenciar comentário com falha
	Given  estou logado como "usuário comum” com login “ ptlh” e senha “4321”
	And    estou na página “Posts comentados” 
	And    vejo o comentário “Massa” do usuário “jdjr” no post “As crônicas de gelo e fogo” 
	When   seleciono a opção “referenciar comentário”
	And    eu preencho o comentário com “Tbm acho”
	And    ainda estou na página “Posts comentados”
	Then   vejo uma janela dizendo "erro de referencia"

Scenario: Ocultar comentários com falha
	Given  estou logado como "usuário comum” com o login “agsa” e senha “1234”
	And    estou na página “Meus posts”
	And    vejo o post intitulado “As crônicas de gelo e fogo”
	And    vejo o campo de comentários preenchido
	When   seleciono a opção “Ocultar comentários”
	And    ainda estou na página “Meus posts” 
	Then   ainda posso ver os comentários de “ As crônicas de gelo e fogo”
	And    vejo uma janela dizendo “Ação não realizada"

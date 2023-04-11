# Compartilhamento de Reviews
Sistema de compartilhamento de reviews de professores. Esse projeto foi criado para disciplina IF682 - Engenharia de Software e Sistemas do Centro de Informática da UFPE.

## Descrição
O Sistema de Compartilhamento de Reviews de Professores é uma aplicação web que permite aos usuários compartilhar e ler reviews sobre professores. O projeto está dividido em duas partes: o front-end, desenvolvido em React, e o back-end, desenvolvido em Ruby on Rails.

## Instalação

### Pré-requisitos
Antes de começar, você precisa ter instalado em sua máquina o seguinte:
* Node.js (versão 14 ou superior)
* Yarn (versão 1.22 ou superior)
* Ruby (versão 3.0.0)
* Rails (versão 7.0.4)
* SQLite3 (versão 1.4)

### Passos de Instalação
1. Clone este repositório para o seu ambiente local
```
git clone https://github.com/v1lton/compartilhamento_reviews.git
```
#### Back-end
1. Acesse a pasta do backend.
```
cd compartilhamento_reviews/back
```
2. Instale as dependências do back-end utilizando o Bundler.
```
bundle install
```
3. Crie e migre o banco de dados.
```
rails db:create
rails db:migrate
```
4. Popule o banco de dados com dados de exemplo.
```
rails db:seed
```
5. Inicie o servidor de desenvolvimento do back-end.
```
rails s
```
#### Front-end
1. Acesse a pasta do front-end.
```
cd compartilhamento_reviews/front
```
2. Instale as dependências do front-end utilizando o Yarn.
```
yarn install
```
3. Inicie o servidor de desenvolvimento do front-end na porta 3001.
```
yarn start
```

### Utilização
Após a instalação e execução do front-end e do back-end, você pode acessar o sistema de compartilhamento de reviews de professores em seu navegador, utilizando a URL http://localhost:3001/. Ao criar uma conta, você pode navegar pelo sistema, criar reviews de professores, visualizar reviews existentes, e seguir outros usuários.

### Contribuição
Se você deseja contribuir para o projeto, por favor siga os passos abaixo:

1. Faça um fork do repositório.
2. Crie uma nova branch para sua contribuição.
3. Faça as alterações desejadas.
4. Faça testes locais para garantir que tudo está funcionando corretamente.
5. Faça um pull request para a branch principal do projeto.
6. Aguarde pela revisão e aprovação de sua contribuição.

### Licença
Este projeto está licenciado sob a MIT License.

### Contato
Em caso de dúvidas ou sugestões, por favor entre em contato com wrs@cin.ufpe.br.

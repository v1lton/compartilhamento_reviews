# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Users
users = User.create([
                      { username: "jramos", name: "João", surname: "Ramos", email: "jramos@example.com", pronouns: "elu/delu", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "anasilva", name: "Ana", surname: "Silva", email: "ana.silva@example.com", pronouns: "ela/dela", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "pedrosantos", name: "Pedro", surname: "Santos", email: "pedro.santos@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "marianalima", name: "Mariana", surname: "Lima", email: "mariana.lima@example.com", pronouns: "elu/delu", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "lucasoliveira", name: "Lucas", surname: "Oliveira", email: "lucas.oliveira@example.com", password: "password", password_confirmation: "password" },
                      { username: "julianacosta", name: "Juliana", surname: "Costa", email: "juliana.costa@example.com", pronouns: "ele/dele", country: "Peru", password: "password", password_confirmation: "password" },
                      { username: "gabrielsantana", name: "Gabriel", surname: "Santana", email: "gabriel.santana@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "isabellafernandes", name: "Isabella", surname: "Fernandes", email: "isabella.fernandes@example.com", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "carlaalves", name: "Carla", surname: "Alves", email: "carla.alves@example.com", pronouns: "ela/dela", password: "password", password_confirmation: "password" },
                      { username: "vinicispereira", name: "Vinicius", surname: "Pereira", email: "vini.pereira@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "mariamartins", name: "Maria", email: "maria.martins@example.com", pronouns: "ela/dela", password: "password", password_confirmation: "password" },
                      { username: "rodrigocarvalho", name: "Rodrigo", email: "rodrigo.carvalho@example.com", pronouns: "ele/dele", password: "password", password_confirmation: "password" },
                      { username: "mariaoliveira", name: "Maria", surname: "Oliveira", email: "maria.oliveira@example.com", pronouns: "ela/dela", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "luizsouza", name: "Luiz", surname: "Souza", email: "luiz.souza@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "amandapereira", name: "Amanda", surname: "Pereira", email: "amanda.pereira@example.com", pronouns: "ela/dela", password: "password", password_confirmation: "password" },
                      { username: "rodrigocosta", name: "Rodrigo", surname: "Costa", email: "rodrigo.costa@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "julianamartins", name: "Juliana", surname: "Martins", email: "juliana.martins@example.com", pronouns: "ela/dela", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "tiagomendes", name: "Tiago", surname: "Mendes", email: "tiago.mendes@example.com", pronouns: "ele/dele", country: "Portugal", password: "password", password_confirmation: "password" },
                      { username: "carolinacarvalho", name: "Carolina", surname: "Carvalho", email: "carolina.carvalho@example.com", pronouns: "ela/dela", password: "password", password_confirmation: "password" },
                      { username: "felipealmeida", name: "Felipe", surname: "Almeida", email: "felipe.almeida@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "alinegomes", name: "Aline", surname: "Gomes", email: "aline.gomes@example.com", pronouns: "ela/dela", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "ricardosilva", name: "Ricardo", surname: "Silva", email: "ricardo.silva@example.com", pronouns: "ele/dele", country: "Brasil", password: "password", password_confirmation: "password" },
                      { username: "anapaulafernandes", name: "Ana Paula", surname: "Fernandes", email: "ana.fernandes@example.com", pronouns: "ela/dela", password: "password", password_confirmation: "password" },
                      { username: "josemendes", name: "José", surname: "Mendes", email: "jose.mendes@example.com", pronouns: "ele/dele", country: "Portugal", password: "password", password_confirmation: "password" },
                    ])

# Categories
categories = Category.create([
                                { name: "Artes" },
                                { name: "Ciências" },
                                { name: "Educação" },
                                { name: "Esportes" },
                                { name: "Filmes" },
                                { name: "História" },
                                { name: "Música" },
                                { name: "Política" },
                                { name: "Tecnologia" },
                                { name: "Viagens" },
                                ])

# Professors
professors = Professor.create([
    { name: "Pedro" },
    { name: "Mariana" },
    { name: "Lucas" },
    { name: "Juliana" },
    { name: "Gabriel" },
    { name: "Isabella" },
    { name: "Carla" },
                            ])

# Reviews
reviews = Review.create([
    { user_id: users[0].id, professor_id: professors[0].id, category_id: categories[0].id, description: "Descricao 1"},
    { user_id: users[1].id, professor_id: professors[1].id, category_id: categories[1].id, description: "Descricao 2"},
    { user_id: users[2].id, professor_id: professors[2].id, category_id: categories[2].id, description: "Descricao 3"},
    { user_id: users[3].id, professor_id: professors[3].id, category_id: categories[3].id, description: "Descricao 4"},
    { user_id: users[4].id, professor_id: professors[4].id, category_id: categories[4].id, description: "Descricao 5"},
                        ])
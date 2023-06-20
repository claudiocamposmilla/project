# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


/creación de usuarios (todos tienen la misma contraseña)/
user1 = User.create(email: 'user1@example.com', password: 'password', password_confirmation: 'password', profile: 0, name: 'John - normal', lastname: 'Doe')
user2 = User.create(email: 'user2@example.com', password: 'password', password_confirmation: 'password', profile: 1, name: 'Jane - ejecutivo', lastname: 'Smith')
user8 = User.create(email: 'user8@example.com', password: 'password', password_confirmation: 'password', profile: 1, name: 'Emma - ejecutivo', lastname: 'Garcia')
user9 = User.create(email: 'user9@example.com', password: 'password', password_confirmation: 'password', profile: 1, name: 'Liam - ejecutivo', lastname: 'Rodriguez')
user3 = User.create(email: 'user3@example.com', password: 'password', password_confirmation: 'password', profile: 2, name: 'Michael - supervisor', lastname: 'Johnson')
user10 = User.create(email: 'user10@example.com', password: 'password', password_confirmation: 'password', profile: 2, name: 'Rodrigo - supervisor', lastname: 'Campos')
user4 = User.create(email: 'user4@example.com', password: 'password', password_confirmation: 'password', profile: 3, name: 'Emily - admin', lastname: 'Brown')
user5 = User.create(email: 'user5@example.com', password: 'password', password_confirmation: 'password', profile: 0, name: 'Michael - normal', lastname: 'Davisn')
user6 = User.create(email: 'user6@example.com', password: 'password', password_confirmation: 'password', profile:0, name: 'Olivia - normal', lastname: 'Wilsonn')
user7 = User.create(email: 'user7@example.com', password: 'password', password_confirmation: 'password', profile:0, name: 'Ethan - normal', lastname: 'Andersonn')


/Creación de tickets/

ticket1 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 1", description: "Description for ticket 1", tags: "tag 1")
ticket2 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 2", description: "Description for ticket 2", tags: "tag 2")
ticket3 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 3", description: "Description for ticket 3", tags: "tag 3")
ticket4 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 4", description: "Description for ticket 4", tags: "tag 4")
ticket5 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 5", description: "Description for ticket 5", tags: "tag 5")
ticket6 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 6", description: "Description for ticket 6", tags: "tag 6")
ticket7 = Ticket.create(claim_date: Date.today, due_date: Date.today + 7.days, incident_date: Date.today, summary: "Ticket 7", description: "Description for ticket 7", tags: "tag 7")

/ Esta parte será para crear los tickets de los usuarios normales /
user_ticket1 = UserComment.create(user_id: user1.id, ticket_id: ticket1.id)
user_ticket2 = UserComment.create(user_id: user1.id, ticket_id: ticket2.id)
user_ticket3 = UserComment.create(user_id: user5.id, ticket_id: ticket3.id)
user_ticket4 = UserComment.create(user_id: user5.id, ticket_id: ticket4.id)
user_ticket5 = UserComment.create(user_id: user6.id, ticket_id: ticket5.id)
user_ticket6 = UserComment.create(user_id: user6.id, ticket_id: ticket6.id)
user_ticket7 = UserComment.create(user_id: user7.id, ticket_id: ticket7.id)


/ Esta parte es para asignar el ticket i-ésimo para el ejecutivo /
user_ticket8 =  UserComment.create(user_id: user2.id, ticket_id: ticket1.id, body: 'Ejecutivo gives notice')
user_ticket9 =  UserComment.create(user_id: user2.id, ticket_id: ticket2.id, body: 'Ejecutivo gives notice')
user_ticket10 = UserComment.create(user_id: user2.id, ticket_id: ticket3.id, body: 'Ejecutivo gives notice')
user_ticket11 = UserComment.create(user_id: user2.id, ticket_id: ticket4.id, body: 'Ejecutivo gives notice')
user_ticket12 = UserComment.create(user_id: user8.id, ticket_id: ticket5.id, body: 'Ejecutivo gives notice')
user_ticket13 = UserComment.create(user_id: user9.id, ticket_id: ticket6.id, body: 'Ejecutivo gives notice')
user_ticket14 = UserComment.create(user_id: user9.id, ticket_id: ticket7.id, body: 'Ejecutivo gives notice')


/ Esta parte es para realizar el comentario i-ésimo del ejecutivo /
user_comment1 = UserComment.create(user_id: user2.id, ticket_id: ticket1.id, body: 'Comment 1 - ejecutivo')
user_comment2 = UserComment.create(user_id: user2.id, ticket_id: ticket2.id, body: 'Comment 2 - ejecutivo')
user_comment3 = UserComment.create(user_id: user2.id, ticket_id: ticket3.id, body: 'Comment 3 - ejecutivo')
user_comment4 = UserComment.create(user_id: user2.id, ticket_id: ticket1.id, body: 'Comment 4 - ejecutivo')
user_comment5 = UserComment.create(user_id: user8.id, ticket_id: ticket1.id, body: 'Comment 5 - ejecutivo')
user_comment6 = UserComment.create(user_id: user9.id, ticket_id: ticket1.id, body: 'Comment 6 - ejecutivo')
user_comment7 = UserComment.create(user_id: user9.id, ticket_id: ticket1.id, body: 'Comment 7 - ejecutivo')

/ Esta parte es para realizar el comentario i-ésimo del administrador /

user_comment8 = UserComment.create(user_id: user4.id, ticket_id: ticket1.id, body: 'Comment 1 - administrator')
user_comment9 = UserComment.create(user_id: user4.id, ticket_id: ticket2.id, body: 'Comment 2 - administrator')
user_comment10 = UserComment.create(user_id: user4.id, ticket_id: ticket3.id, body: 'Comment 3 - administrator')
user_comment11 = UserComment.create(user_id: user4.id, ticket_id: ticket1.id, body: 'Comment 4 - administrator')
user_comment12 = UserComment.create(user_id: user4.id, ticket_id: ticket1.id, body: 'Comment 5 - administrator')
user_comment13 = UserComment.create(user_id: user4.id, ticket_id: ticket1.id, body: 'Comment 6 - administrator')
user_comment14 = UserComment.create(user_id: user4.id, ticket_id: ticket1.id, body: 'Comment 7 - administrator')

/ Esta parte es para realizar el comentario i-ésimo del supervisor /

user_comment15 = UserComment.create(user_id: user3.id, ticket_id: ticket1.id, body: 'Comment 1 - supervisor')
user_comment16 = UserComment.create(user_id: user3.id, ticket_id: ticket2.id, body: 'Comment 2 - supervisor')
user_comment17 = UserComment.create(user_id: user3.id, ticket_id: ticket3.id, body: 'Comment 3 - supervisor')
user_comment18 = UserComment.create(user_id: user10.id, ticket_id: ticket1.id, body: 'Comment 4 - supervisor')
user_comment19 = UserComment.create(user_id: user10.id, ticket_id: ticket1.id, body: 'Comment 5 - supervisor')
user_comment20 = UserComment.create(user_id: user10.id, ticket_id: ticket1.id, body: 'Comment 6 - supervisor')
user_comment21 = UserComment.create(user_id: user10.id, ticket_id: ticket1.id, body: 'Comment 7 - supervisor')

/Resolutions/

resolution1 = Resolution.create(ticket_id: ticket1.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 1",user_body: "Comentario de usuario")
resolution2 = Resolution.create(ticket_id: ticket2.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 2",user_body: "Comentario de usuario")
resolution3 = Resolution.create(ticket_id: ticket3.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 3",user_body: "Comentario de usuario")
resolution4 = Resolution.create(ticket_id: ticket4.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 4",user_body: "Comentario de usuario")
resolution5 = Resolution.create(ticket_id: ticket5.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 5",user_body: "Comentario de usuario")
resolution6 = Resolution.create(ticket_id: ticket6.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 6",user_body: "Comentario de usuario")
resolution7 = Resolution.create(ticket_id: ticket7.id, resolved: 1, evaluation: rand(1..5), resolution_comment: "Resolution comment 7",user_body: "Comentario de usuario")

/User_resolutions para usuarios normales/

user_resolution1 = UserResolution.create(user_id: user1.id, resolution_id: resolution1.id)
user_resolution2 = UserResolution.create(user_id: user1.id, resolution_id: resolution2.id)
user_resolution3 = UserResolution.create(user_id: user5.id, resolution_id: resolution3.id)
user_resolution4 = UserResolution.create(user_id: user5.id, resolution_id: resolution4.id)
user_resolution5 = UserResolution.create(user_id: user6.id, resolution_id: resolution5.id)
user_resolution6 = UserResolution.create(user_id: user6.id, resolution_id: resolution6.id)
user_resolution7 = UserResolution.create(user_id: user7.id, resolution_id: resolution7.id)

/User_resolutions para usuarios ejecutivos/

user_resolution8 =  UserResolution.create(user_id: user2.id, resolution_id: resolution1.id )
user_resolution9 =  UserResolution.create(user_id: user2.id, resolution_id: resolution2.id )
user_resolution10 = UserResolution.create(user_id: user2.id, resolution_id: resolution3.id )
user_resolution11 = UserResolution.create(user_id: user2.id, resolution_id: resolution4.id )
user_resolution12 = UserResolution.create(user_id: user8.id, resolution_id: resolution5.id )
user_resolution13 = UserResolution.create(user_id: user9.id, resolution_id: resolution6.id )
user_resolution14 = UserResolution.create(user_id: user9.id, resolution_id: resolution7.id )



/se guarda/

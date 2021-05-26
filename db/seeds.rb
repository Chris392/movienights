# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create! name: 'John Doe', email: 'john@gail.com', password: 'topsecret',
                     password_confirmation: 'topsecret'

user1 = User.new
user1.name = 'Chris'
user1.email = 'chris@gmail.com'
user1.password = 'valid_password'
user1.password_confirmation = 'valid_password'
user1.save!

user2 = User.new
user2.name = 'ferdi'
user2.email = 'ferdi@gmail.com'
user2.password = 'valid_password'
user2.password_confirmation = 'valid_password'
user2.save!

user3 = User.new
user3.name = 'tommy'
user3.email = 'tommy@gmail.com'
user3.password = 'valid_password'
user3.password_confirmation = 'valid_password'
user3.save!

user4 = User.new
user4.name = 'john'
user4.email = 'john@gmail.com'
user4.password = 'valid_password'
user4.password_confirmation = 'valid_password'
user4.save!

user5 = User.new
user5.name = 'guenther'
user5.email = 'guenther@gmail.com'
user5.password = 'valid_password'
user5.password_confirmation = 'valid_password'
user5.save!
movie = Movie.create!({ title: 'The Lord of the Rings: The Fellowship of the Ring',
                        year: '2001',
                        runtime: '178',
                        genre: 'Action, Adventure, Drama, Fantasy',
                        director: 'Peter Jackson',
                        actors: 'Alan Howard, Noel Appleby, Sean Astin, Sala Baker',
                        plot: 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron',
                        rating: '8.8', poster_url: 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg',
                        trailor_url: '' })
movie2 = Movie.create!({ title: 'Indiana Jones and the Raiders of the Lost Ark',
                         year: '1981',
                         runtime: '115',
                         genre: 'Action, Adventure',
                         director: 'Steven Spielberg',
                         actors: 'Harrison Ford, Karen Allen',
                         plot: 'n 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before Adolf Hitlers Nazis can obtain its awesome powers.',
                         rating: '8.4',
                         poster_url: 'https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_SX300.jpg',
                         trailor_url: '' })
movie3 = Movie.create!({ title: 'Godzilla',
                         year: '2014',
                         runtime: '123',
                         genre: 'Action, Adventure, Sci-Fi',
                         director: 'Gareth Edwards',
                         actors: 'Aaron Taylor-Johnson, CJ Adams',
                         plot: 'The world is beset by the appearance of monstrous creatures, but one of them may be the only one who can save humanity.',
                         rating: '8.4',
                         poster_url: 'https://m.media-amazon.com/images/M/MV5BN2E4ZDgxN2YtZjExMS00MWE5LTg3NjQtNTkxMzJhOTA3MDQ4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg',
                         trailor_url: '' })
movie4 = Movie.create!({ title: 'The Wolf of Wall Street',
                         year: '2013',
                         runtime: '180',
                         genre: 'Biography, Crime, Drama',
                         director: 'Martin Scorsese',
                         actors: 'Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew McConaughey',
                         plot: 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.', rating: '8.2', poster_url: 'https://m.media-amazon.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_SX300.jpg', trailor_url: '' })

event = Event.create!({ user_id: user1.id, adress: 'beim Mox', date: Date.today, time: '13:00' })
event2 = Event.create!({ user_id: user2.id, adress: 'beim Ferdi', date: Date.today, time: '20:15' })
event3 = Event.create!({ user_id: user1.id, adress: 'beim Chris', date: Date.today, time: '13:00' })

MovieSuggestion.create!({ event_id: event.id, movie_id: movie.id })
MovieSuggestion.create!({ event_id: event.id, movie_id: movie2.id })
MovieSuggestion.create!({ event_id: event.id, movie_id: movie3.id })
MovieSuggestion.create!({ event_id: event.id, movie_id: movie4.id })

event.users.push(user1)
event.users.push(user2)
event2.users.push(user3)
event2.users.push(user4)
event2.users.push(user5)
event3.users.push(user1)
event3.users.push(user2)
event3.users.push(user5)

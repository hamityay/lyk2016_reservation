# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating seed data ..."

Place.create(name: 'New place', adress: 'This is an adress', phone_number: '122 456 7890', city: 'City', description: 'This is a description', contact_mail: "info@newplace.com")
Place.create(name: 'Another place', adress: 'This is a second adress', phone_number: '123 334 5643', city: 'Second City', description: 'This is another description for another place', contact_mail: "info@anotherplace.com")
Place.create(name: 'Place', adress: 'This is an adress for Place', phone_number: '777 777 7777', city: 'Another City', description: 'Desc for Place name', contact_mail: "info@place.com")

puts "Created sed data ..."
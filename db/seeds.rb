# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating seed data ..."

c = Owner.create(email: "admin@admin.com", password: 123456)

c1 = Category.create(name: 'Category 1')
c2 = Category.create(name: 'Category 2')
c3 = Category.create(name: 'Category 3')

Food.create(name: 'Food 1')
Food.create(name: 'Food 2')
Food.create(name: 'Food 3')
Food.create(name: 'Food 4')
Food.create(name: 'Food 5')

p1 = Place.create(name: 'New place', adress: 'This is an adress', phone_number: '122 456 7890', city: 'City', description: 'This is a description', contact_mail: "info@newplace.com", category_id: c1.id, owner: c)
p2 = Place.create(name: 'Another place', adress: 'This is a second adress', phone_number: '123 334 5643', city: 'Second City', description: 'This is another description for another place', contact_mail: "info@anotherplace.com", category: c2, owner: c )
p3 = Place.create(name: 'Place', adress: 'This is an adress for Place', phone_number: '777 777 7777', city: 'Another City', description: 'Desc for Place name', contact_mail: "info@place.com", category_id: c3.id, owner: c)

p1.food_ids = [1, 2, 3, 4, 5]
p2.food_ids = [1, 3, 4, 5]
p3.food_ids = [1, 2, 5]

s1 = p1.build_social_profile(facebook: 'newplace', twitter: '@newplace', instagram: 'newplace', foursquare: 'newplace')
s1.save

s2 = p2.build_social_profile(facebook: 'anotherplace', twitter: '@anotherplace', instagram: 'anotherplace', foursquare: 'anotherplace')
s2.save

s3 = p3.build_social_profile(facebook: 'place', twitter: '@place', instagram: 'place', foursquare: 'place')
s3.save

puts "Created seed data ..."

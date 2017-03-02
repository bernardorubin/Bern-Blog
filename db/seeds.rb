# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


2.times do
  User.create(first_name: Faker::Pokemon.name, last_name: Faker::Pokemon.name, email: Faker::Internet.email, password: 'chichi', password_confirmation: 'chichi' )
end

10.times do
  Post.create(title: Faker::Pokemon.name, body: Faker::Hipster.paragraph(4), user_id: 1)
end
5.times do
  Category.create(name: Faker::Pokemon.name, post_id: 9)
end

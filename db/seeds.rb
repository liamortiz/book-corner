# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
User.destroy_all
Review.destroy_all
avatar_array = ["avatar_1.jpg","avatar_2.jpg","avatar_3.jpg"]

10.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 6, max_length: 15) , avatar_url: avatar_array.sample, name: Faker::Name.name)
end

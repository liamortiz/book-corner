# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all


10.times do
    Book.create(title: Faker::Book.title , description: Faker::Lorem.words(number: 4), author: Faker::Book.author , release_date: Faker::Date.between(from: '1979-09-23', to: '2020-09-25'), category: Faker::Book.genre)
end


20.times do
    User.create(username: Faker::Name.first_name, password: Faker::Color.hex_color)
end

12.times do
    Review.create(rating: rand(6), content: Faker::Lorem.words(number: 15), user_id: User.all.sample.id, book_id: Book.all.sample.id)
end



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




10.times do
    Book.create(title: Faker::Book.title , description: Faker::Lorem.paragraph(sentence_count: 5), author: Faker::Book.author , release_date: Faker::Date.between(from: '1979-09-23', to: '2020-09-25'), category: Faker::Book.genre)
end


20.times do
    User.create(username: Faker::Name.first_name, password: Faker::Color.hex_color)
end

100.times do
    Review.create(rating: rand(1..5), content: Faker::TvShows::Community.quotes, user_id: User.all.sample.id, book_id: Book.all.sample.id)
end



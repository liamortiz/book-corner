class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def create_reviews
    if self.ratings_count
        [5, self.ratings_count].min.times do
        self.reviews << Review.create(rating: rand(1..5), book_id: self.id, user_id: User.all.sample.id, content: Faker::Lorem.paragraph(sentence_count: 8))
      end
    end
  end

end

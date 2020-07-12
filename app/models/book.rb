class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def create_reviews
    if self.ratings_count
        [5, self.ratings_count].min.times do
          self.reviews << Review.create(rating: rand(1..5), book_id: self.id, user_id: get_user, content: Faker::Lorem.paragraph(sentence_count: 8))
      end
    end
  end

  def update_rating_average
    rating = 0
    unless self.reviews.empty?
      total = self.reviews.sum(&:rating)
      rating = self.average_rating = (total / self.reviews.length).round
    end

    self.update(average_rating: rating)
  end

  def get_user
    users = User.all
    if @current_user
      users.delete(@current_user)
    end
    users.sample.id
  end

end

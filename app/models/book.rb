class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  # def average_rating
  #   if self.reviews.empty?
  #     "N/A"
  #   else
  #     ratings = self.reviews.map{|review| review.rating}
  #     total = ratings.sum.to_f / self.reviews.length.to_f
  #     average = (total * 2).round / 2.0
  #     answer = average.to_i == average ? average.to_i : average
  #     "#{answer} out of 5"
  #   end
  # end

  def create_reviews
    if self.ratings_count
        self.ratings_count.times do
        self.reviews << Review.create(rating: rand(1..5), book_id: self.id, user_id: User.all.sample.id, content: Faker::Lorem.paragraph(sentence_count: 8))
      end
    end
  end

  

end



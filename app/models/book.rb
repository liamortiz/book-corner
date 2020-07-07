class Book < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  def average_rating
    if self.reviews.empty?
      "N/A"
    else
      ratings = self.reviews.map{|review| review.rating}
      total = ratings.sum.to_f / self.reviews.length.to_f
      average = (total * 2).round / 2.0
      answer = average.to_i == average ? average.to_i : average
      "#{answer} out of 5"
    end
  end


  

end



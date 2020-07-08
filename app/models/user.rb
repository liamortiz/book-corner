class User < ApplicationRecord
  has_many :reviews
  has_many :user_shelves
  has_many :books, through: :user_shelves
  has_many :reviewed_books, through: :reviews, source: :book

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end

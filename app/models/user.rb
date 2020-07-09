class User < ApplicationRecord
  has_many :reviews
  has_many :user_shelves
  has_many :books, through: :user_shelves
  has_many :reviewed_books, through: :reviews, source: :book

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: {in: 6..20, message: "is too short or too long!"}

  has_secure_password
end

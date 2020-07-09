class User < ApplicationRecord
  has_many :reviews
  has_many :user_shelves
  has_many :books, through: :user_shelves
  has_many :reviewed_books, through: :reviews, source: :book

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  has_secure_password

  # def password=(secret)
  #   # byebug
  #   hashed_pass = BCrypt::Password.create(secret)
  #   self.password_digest = hashed_pass
  # end

  # def password
    
  # end
end

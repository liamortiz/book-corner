class UserShelf < ApplicationRecord
  belongs_to :user
  has_many :books
end

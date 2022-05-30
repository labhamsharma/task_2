class Book < ApplicationRecord
  has_many :book_requests
  has_many :users, through: :book_requests
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end

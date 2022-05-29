class Book < ApplicationRecord
  has_many :book_request
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end

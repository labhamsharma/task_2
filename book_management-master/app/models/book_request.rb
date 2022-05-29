class BookRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: [ "pending", "approved", "deny" ]
  #validates :request_date, presence: true
 # validates :status, presence: true
end

class AddStatusColumnsToBookRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :book_requests, :status, :integer
    add_column :book_requests, :request_date, :datetime
  end
  add_index :book_requests, [:user_id, :book_id], unique: true
end

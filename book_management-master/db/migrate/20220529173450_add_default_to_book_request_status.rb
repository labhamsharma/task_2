class AddDefaultToBookRequestStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :book_requests, :status, :integer, default: 0
  end
end

class CreateJoinTableBooksShelves < ActiveRecord::Migration[7.1]
  def change
    create_join_table :books, :shelves do |t|
      # t.index [:book_id, :shelf_id]
      # t.index [:shelf_id, :book_id]
    end
  end
end

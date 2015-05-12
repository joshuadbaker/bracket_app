class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :count
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end

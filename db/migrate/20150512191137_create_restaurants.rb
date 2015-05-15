class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.text :name
      t.integer :zipcode
      t.text :violations
      t.text :violation_descriptions
      t.timestamps null: false
    end
  end
end

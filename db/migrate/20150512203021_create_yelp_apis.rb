class CreateYelpApis < ActiveRecord::Migration
  def change
    create_table :yelp_apis do |t|

      t.timestamps null: false
    end
  end
end

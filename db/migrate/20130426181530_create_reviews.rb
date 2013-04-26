class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :score
      t.references :user
      t.references :dish

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :dish_id
  end
end

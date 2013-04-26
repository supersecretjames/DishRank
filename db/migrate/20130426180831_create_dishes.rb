class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.references :restaurant
      t.references :dish_type

      t.timestamps
    end
    add_index :dishes, :restaurant_id
    add_index :dishes, :dish_type_id
  end
end

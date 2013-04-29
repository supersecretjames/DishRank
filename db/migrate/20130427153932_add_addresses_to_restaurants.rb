class AddAddressesToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :street, :string
  	add_column :restaurants, :city, :string
  	add_column :restaurants, :state, :string
  	add_column :restaurants, :lat, :decimal, :precision => 15, :scale => 10
  	add_column :restaurants, :lng, :decimal, :precision => 15, :scale => 10
  end
end

class ChangeLatLngInRestaurants < ActiveRecord::Migration
  def change
  	remove_column :restaurants, :lat
  	remove_column :restaurants, :lng
  	  	add_column :restaurants, :latitude, :decimal, :precision => 15, :scale => 10
  	add_column :restaurants, :longitude, :decimal, :precision => 15, :scale => 10
  end
end

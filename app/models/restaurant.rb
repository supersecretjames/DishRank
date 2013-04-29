class Restaurant < ActiveRecord::Base
  attr_accessible :name, :street, :state, :city, :lat, :lng, :dishes, 
  	:dishes_attributes

  has_many :dishes, :inverse_of => :restaurant
  has_many :dish_types, :through => :dishes
  accepts_nested_attributes_for :dishes 

  geocoded_by :full_address
	after_validation :geocode

  def full_address
  	@full_address = "#{street}, #{city}, #{state}"
  end
end

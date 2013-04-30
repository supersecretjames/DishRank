class Restaurant < ActiveRecord::Base
  attr_accessible :name, :street, :state, :city, :lat, :lng, :dishes, 
  	:dishes_attributes

  has_many :dishes, :inverse_of => :restaurant
  has_many :dish_types, :through => :dishes
  accepts_nested_attributes_for :dishes 

  geocoded_by :full_address
	after_validation :geocode

  def self.filter_by_location(restaurants, address, radius=50)
    coords = Geocoder.coordinates(address)
    r_holder = []
    d_holder = []

    restaurants.each do |restaurant|
      lat = restaurant.latitude
      lng = restaurant.longitude
      dist = Geocoder::Calculations.distance_between(coords, [lat, lng])
      p "restaurant #{restaurant.name}"
      p "distance from address: #{dist} miles"
      if dist < radius
        r_holder << restaurant
        d_holder << dist
      end
    end
    [r_holder, d_holder, coords]
  end

  def full_address
  	@full_address = "#{street}, #{city}, #{state}"
  end
end

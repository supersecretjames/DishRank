class Restaurant < ActiveRecord::Base
  attr_accessible :name, :street, :state, :city, :lat, :lng, :dishes, 
  	:dishes_attributes, :photo

  has_many :dishes, :inverse_of => :restaurant
  has_many :dish_types, :through => :dishes
  accepts_nested_attributes_for :dishes 

  validates :name, :street, :state, :city, :presence => true

  geocoded_by :full_address
	after_validation :geocode

  has_attached_file :photo, :styles => {
    :large => "600x600>",
    :thumb => "100x100#",
    :tiny => "25x25#"
  }, :default_url => "/images/missing_rest.jpeg"

  def self.filter_by_location(restaurants, address, radius=25)
    coords = Geocoder.coordinates(address)
    restaurants_holder = []
    distances_holder = []

    restaurants.each do |restaurant|
      lat = restaurant.latitude
      lng = restaurant.longitude
      dist = Geocoder::Calculations.distance_between(coords, [lat, lng])

      if dist < radius
        restaurants_holder << restaurant
        distances_holder << dist
      end
    end
    [restaurants_holder, distances_holder, coords]
  end

  def full_address
  	@full_address = "#{street}, #{city}, #{state}"
  end
end

class Dish < ActiveRecord::Base
  attr_accessible :name, :price, :reviews, :reviews_attributes, :restaurant_id,
  								:dish_type_id, :description

  belongs_to :restaurant, :inverse_of => :dishes
  belongs_to :dish_type, :inverse_of => :dishes
  has_many :reviews, :inverse_of => :dish
  accepts_nested_attributes_for :reviews

  validates :name, :price, :presence => true
  validates_presence_of :restaurant
  

  def self.restaurant_list(dishes)
  	r_ids = []
  	
  	dishes.each do |dish|
  		r_ids << dish.restaurant_id unless r_ids.include?(dish.restaurant_id)
  	end

  	r_ids.map do |id|
  		Restaurant.find_by_id(id)
  	end
  end

end
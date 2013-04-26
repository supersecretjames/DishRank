class Dish < ActiveRecord::Base
  attr_accessible :name, :price, :reviews, :reviews_attributes, :restaurant_id,
  								:dish_type_id

  belongs_to :restaurant
  belongs_to :dish_type
  has_many :reviews, :inverse_of => :dish
  accepts_nested_attributes_for :reviews

  validates :name, :price, :presence => true
end
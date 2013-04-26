class Restaurant < ActiveRecord::Base
  attr_accessible :name, :dishes, :dishes_attributes

  has_many :dishes, :inverse_of => :restaurant
  accepts_nested_attributes_for :dishes 
end

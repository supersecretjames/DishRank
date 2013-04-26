class DishType < ActiveRecord::Base
  attr_accessible :name

  has_many :dishes, :inverse_of => :dish_type
  validates :name, :presence => true
  validates :name, :uniqueness => true
end

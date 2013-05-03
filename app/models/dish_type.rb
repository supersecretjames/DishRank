class DishType < ActiveRecord::Base
  attr_accessible :name

  has_many :dishes, :inverse_of => :dish_type
  has_many :restaurants, :through => :dishes
  validates :name, :presence => true
  validates :name, :uniqueness => true

  def dish_type_id
  end
end

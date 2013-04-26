class Review < ActiveRecord::Base
  attr_accessible :score, :user_id, :dish_id
  
  belongs_to :user
  belongs_to :dish

  validates :score, :presence => true
end

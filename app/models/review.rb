class Review < ActiveRecord::Base
  attr_accessible :score, :user_id, :dish_id, :photo
  
  belongs_to :user, :inverse_of => :reviews
  belongs_to :dish, :inverse_of => :reviews

  validates :score, :user_id, :dish_id, :presence => true

  has_attached_file :photo, 
  	:styles => { :medium => "300x300>", :thumb => "100x100>" }
end

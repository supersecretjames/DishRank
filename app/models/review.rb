class Review < ActiveRecord::Base
  attr_accessible :score, :user_id, :dish_id, :photo, :photo_file_name, :user,
    :body
  
  belongs_to :user, :inverse_of => :reviews
  belongs_to :dish, :inverse_of => :reviews

  validates :score, :user_id, :dish_id, :presence => true

  has_attached_file :photo, 
  	:styles => { :medium => "300x300#", :thumb => "100x100#" }, 
  	:default_url => "/images/missing.jpeg",
    :path => ":class/photos/:id/:style/:photo_file_name"
  	
  def self.review_average(dish)
  	Review.where("dish_id = ?", dish.id).average("score").to_f.round(2)
  end

  def self.review_count(dish)
    Review.where("dish_id = ?", dish.id).count
  end
end

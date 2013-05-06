class Review < ActiveRecord::Base
  attr_accessible :score, :user_id, :dish_id, :photo, :photo_file_name, :user,
    :body
  
  belongs_to :user, :inverse_of => :reviews
  belongs_to :dish, :inverse_of => :reviews

  validates :score, :user_id, :dish_id, :presence => true

  PAPERCLIP_OPTIONS = {:styles => { :medium => "300x300#", :thumb => "80x80#" }, 
    :default_url => "/images/missing.jpeg"}

  if Rails.env.production?
    has_attached_file(:photo, {:path => 
      ":class/photos/:id/:style.:extension"}.merge(PAPERCLIP_OPTIONS))
  else
    has_attached_file(:photo, PAPERCLIP_OPTIONS) 
  end
  	
  def self.review_average(dish)
  	Review.where("dish_id = ?", dish.id).average("score").to_f.round(2)
  end

  def self.review_count(dish)
    Review.where("dish_id = ?", dish.id).count
  end
end

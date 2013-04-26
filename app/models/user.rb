class User < ActiveRecord::Base
  attr_accessible :email, :name, :reviews

  has_many :reviews, :inverse_of => :user

  validates :email, :name, :presence => true
  validates :email, :uniqueness => true
end

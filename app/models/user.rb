class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, 
  	:remember_me, :address, :profile_photo
  # attr_accessible :title, :body
  has_many :reviews

  has_attached_file :profile_photo, :styles => {
    :large => "600x600>",
    :medium => "300x300#",
    :small => "45x45#"
  }, 
  :default_url => "/images/missing_profile.jpeg",
  :path => ":class/photos/:id/:style.:extension"
end

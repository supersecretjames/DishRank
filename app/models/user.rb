class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, 
  	:remember_me, :address, :profile_photo, :provider, :uid, :access_token

  has_many :reviews

  PAPERCLIP_OPTIONS = {:styles => {
      :large => "600x600>",
      :medium => "300x300#",
      :small => "45x45#"
    }, 
    :default_url => "/images/missing_profile.jpeg"}

  if Rails.env.production?
    has_attached_file(:profile_photo, {:path => 
      ":class/photos/:id/:style.:extension"}.merge(PAPERCLIP_OPTIONS))
  else
    has_attached_file(:profile_photo, PAPERCLIP_OPTIONS) 
  end

  def self.from_omniauth(auth)
    user = User.where("email = ?", auth.info.email).first_or_initialize 
    p "USER HERE #{user.attributes}"

    user.provider = auth.provider
    user.uid = auth.uid
    user.name ||= auth.info.name
    user.email = auth.info.email if user.email.empty?
    user.access_token = auth.credentials.token
    user.encrypted_password = 
      Devise.friendly_token[0, 20] if user.encrypted_password.empty? 
    user.save!
    user
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def post_on_facebook(review)
    if Rails.env.production?
      pic = review.photo.url(:medium, timestamp: false)
    else
      pic = "http://dishrankpro.s3.amazonaws.com/reviews/photos/37/medium.jpg"
    end

    @graph = Koala::Facebook::API.new(self.access_token)
    @graph.put_wall_post("A tasty dish appears!", {
            "name" => "#{review.dish.restaurant.name}: #{review.dish.name}",
            "link" => "#{review.url}",
            "caption" => "www.dishrank.com",
            "description" => "#{review.body}",
            "picture" => "#{pic}"
          })
    review.facebook = false
    review.save
  end

  def facebook_friends
    @graph = Koala::Facebook::API.new(self.access_token)
    @graph.get_object("me")
    @graph.get_connections("me", "friends")
  end
end

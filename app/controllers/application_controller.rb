class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_login
  	if !current_user
  		flash[:failure] = "You must log in first."
  		redirect_to dish_types_url
  	end
  end

end

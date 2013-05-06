class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@reviews = @user.reviews
		@reviews = 
			Kaminari.paginate_array(@reviews).page(params[:page]).per(10)
			
		render :show
	end
end

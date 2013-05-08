class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@reviews = @user.reviews
		@reviews = 
			Kaminari.paginate_array(@reviews).page(params[:page]).per(10)
	end

	def edit
		@user = User.find(params[:id])
		redirect_to edit_user_registration_path
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(params[:user])
			flash[:success] = "Your information has been updated."
			redirect_to @user
		else
			render :edit
		end
	end
end

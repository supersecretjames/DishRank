class RestaurantsController < ApplicationController
	
	before_filter :check_login, :only => [:new, :create, :edit, :save]
	
	def index
		render :index
	end

	def new
		@restaurant = Restaurant.new

		render :new
	end

	def create
		@restaurant = Restaurant.new(params[:restaurant])

		if @restaurant.save
			flash[:success] = "Restaurant Created!"
			redirect_to restaurant_path(@restaurant)
		else
			render :new
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		render :show
	end
	
	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
	end

end

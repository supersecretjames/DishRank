class RestaurantsController < ApplicationController
	respond_to :html
	respond_to :json
	
	def index
		@restaurants = Restaurant.all 
		@dishes = Dish.all

		respond_to do |format|
			format.html { render :index }
			format.json { render :json => @restaurants }
		end
	end

	# def new
	# 	@restaurant = Restaurant.new

	# 	render :new
	# end

	def create
		@restaurant = Restaurant.new(params[:restaurant])

		#look up lat and long and set the db

		if @restaurant.save
			render :json => @restaurant
		else
			render :json => @restaurant.errors, :status => 422
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

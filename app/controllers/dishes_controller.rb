class DishesController < ApplicationController
	respond_to :json
	respond_to :html

	def index
		@dishes = Dish.where("dish_type_id == #{params[:dish_type_id]}")
		@restaurants = Dish.restaurant_list(@dishes)
		@coords = @restaurants.first.latitude, @restaurants.first.longitude

		if params[:address] && !params[:address].empty?
			restaurants_distances = Restaurant.filter_by_location(
																@restaurants, params[:address])
			@restaurants = restaurants_distances[0]
			@distances = restaurants_distances[1]
			@coords = restaurants_distances[2]
		end

		render :index 
	end

	def show
		@dish = Dish.find(params[:id])
		@reviews = Review.where("dish_id == #{@dish.id}").order("created_at DESC")
		p "REVIEWS #{@reviews}"

		render :show
	end

end

class DishesController < ApplicationController

	before_filter :check_login, :only => [:new, :create, :edit, :save]

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

	def new
		@dish = Dish.new

		render :new
	end

	def create 
		@dish = Dish.new(params[:dish])
		@dish.restaurant_id = params[:restaurant][:restaurant_id]
		@dish.dish_type_id = params[:dish_type][:dish_type_id]

		if @dish.save
			flash[:success] = "Dish saved!"

			redirect_to restaurant_dish_path(@dish.restaurant_id, @dish)
		else
			render :new
		end
	end

	def show
		@dish = Dish.find(params[:id])
		@reviews = Review.where("dish_id == #{@dish.id}").order("created_at DESC")

		render :show
	end

end

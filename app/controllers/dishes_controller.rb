class DishesController < ApplicationController

	before_filter :check_login, :only => [:new, :create, :edit, :save]

	def index
		@dishes = Dish.where("dish_type_id = ?", params[:dish_type_id])

		@restaurants = Dish.restaurant_list(@dishes)

		@coords = @restaurants.first.latitude, @restaurants.first.longitude

		if params[:address] && !params[:address].empty?
			restaurants_distances = Restaurant.filter_by_location(
																@restaurants, params[:address])
			@restaurants = restaurants_distances[0]
			@distances = restaurants_distances[1]
			@coords = restaurants_distances[2]
		end
		@restaurants = 
			Kaminari.paginate_array(@restaurants).page(params[:page]).per(10)
	end

	def new
		@dish = Dish.new
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
		@reviews = Review.where("dish_id = ?", @dish.id).order("created_at DESC")
		@reviews = 
			Kaminari.paginate_array(@reviews).page(params[:page]).per(10)
	end

	def edit
		@dish = Dish.find(params[:id])
	end

	def update
		@dish = Dish.find(params[:id])

		if @dish.update_attributes(params[:dish])
			flash[:success] = "The dish has been updated."
			redirect_to [@dish.restaurant, @dish]
		else
			render :edit
		end
	end

end

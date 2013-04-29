class DishesController < ApplicationController
	respond_to :json
	respond_to :html

	def index
		@dishes = Dish.where("dish_type_id == #{params[:dish_type_id]}")
		@restaurants = Dish.restaurant_list(@dishes)

		respond_to do |format|
			format.html { render :index }
			format.json { render :json => @dishes }
		end
	end

	def show
		@dish = Dish.find(params[:id])

		render :show
	end

end

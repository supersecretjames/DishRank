class DishTypesController < ApplicationController
	respond_to :html
	respond_to :json

	def index
		if params[:dish_type]
			@dish_type = DishType.find(params[:dish_type][:dish_type_id])
			redirect_to dish_type_dishes_path(@dish_type, {:address => params[:address]})
		else
			@dish_types = DishType.all
			
			respond_to do |format|
				format.html { render :index }
				format.json { render :json => @dish_types }
			end
		end
	end

	def new
		@dish_type = DishType.new

		render :new
	end

	def create
		@dish_type = DishType.new(params[:dish_type])

		if @dish_type.save
			@dish_types = DishType.all
			@dishes = Dish.all 

			render :index
		else
			render :json => @dish_type.errors, :status => 422
		end
	end

	def show
		@dish_type = DishType.find(params[:id])
		redirect_to dish_type_dishes_path(@dish_type)
	end

	def destroy
		@dish_type = DishType.find(params[:id])

		if @dish_type.destroy
			render :json => @dish_type
		else
			render :json => @dish_type.error, :status => 422
		end
	end
end

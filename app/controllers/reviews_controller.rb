class ReviewsController < ApplicationController

	before_filter :check_login, :only => [:new, :create, :edit, :save]

	def index
		@reviews = Review.where("dish_id = ?", params[:dish_id])

		render :index
	end

	def new
		@dish = Dish.find(params[:dish_id])
		@review = @dish.reviews.build

		render :new
	end

	def create
		@review = Review.new(params[:review])
		@review.user_id = current_user.id
		@review.dish_id = params[:dish_id]

		p "REVIEW user_id: #{@review.user_id}"
		p "REVIEW dish_id: #{@review.dish_id}"

		if @review.save
			flash[:success] = "Review Saved!"

			redirect_to [@review.dish.restaurant, @review.dish]
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	def show
	end

	def destroy
	end

end

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

		if @review.save
			current_user.post_on_facebook(@review)
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
		@review = Review.find(params[:id])

		if @review.destroy
			flash[:success] = "Your review has been banished."
			redirect_to root_url
		else
			flash[:failure] = "Your delete attempt has failed. The review is resilient."
			redirect_to root_url
		end
	end

end

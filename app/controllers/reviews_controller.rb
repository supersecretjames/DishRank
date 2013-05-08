class ReviewsController < ApplicationController

	before_filter :check_login, :only => [:new, :create, :edit, :save]

	def index
		@reviews = Review.where("dish_id = ?", params[:dish_id])

		render :index
	end

	def new
		@dish = Dish.find(params[:dish_id])
		@review = @dish.reviews.build
	end

	def create
		@review = Review.new(params[:review])
		@review.user_id = current_user.id
		@review.dish_id = params[:dish_id]


		if @review.save
			flash[:success] = "Review Saved!"
			if @review.facebook = true
				current_user.post_on_facebook(@review) 
			end
			redirect_to [@review.dish.restaurant, @review.dish]
		else
			render :new
		end
	end

	def edit
		@review = Review.find(params[:id])
		@dish = Dish.find(params[:dish_id])
	end

	def update
		@review = Review.find(params[:id])

		if @review.update_attributes(params[:review])
			flash[:success] = "Your review has been updated."
			redirect_to [@review.dish.restaurant, @review.dish]
		else
			render :edit
		end
	end

	def show
		@review = Review.find(params[:id])
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

class AddFacebookColumnToReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :facebook, :boolean
  end
end

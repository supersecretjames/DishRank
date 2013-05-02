module RestaurantsHelper
	def address(restaurant)
		html = "#{restaurant.street}<br>#{restaurant.city}, #{restaurant.state}<br>"

		html.html_safe
	end
end

module DishesHelper

	def average_stars_for(dish)
		html = '<div class="rating_bar"><div id="star" style="width: '
		html += "#{dish.average_rating * 20}"
		html += '%"></div></div>'

		html.html_safe
	end

	def stars_and_count(dish)
		html = nil
		if dish.total_review_count > 0
			html = average_stars_for(dish)
			html += "Avg. Score: #{dish.average_rating}"
			html += " (#{dish.total_review_count} total reviews)"
			html = html.html_safe
		end
		html
	end
end

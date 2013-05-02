module ReviewsHelper

	def stars_for(review)
		html = '<div class="rating_bar"><div id="star" style="width: '
		html += "#{review.score * 20}"
		html += '%"></div></div>'

		html.html_safe
	end
end

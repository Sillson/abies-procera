class PeerReviewsController < ApplicationController

	def index
		@wcs = User.order('name ASC').all
		@peer_reviews = PeerReview.all 
	end

	def show
	end
	
end
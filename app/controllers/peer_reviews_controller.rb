class PeerReviewsController < ApplicationController

	def index
		@wcs = User.order('name ASC').all
		@peer_reviews = PeerReview.all 
		@pr_mean = PeerReview.first.pr_mean
	end

	def show
	end

	def pr_form
		respond_to do |format|               
    		format.js
  		end  
	end
	
end
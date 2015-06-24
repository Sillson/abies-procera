class PeerReviewsController < ApplicationController

	def index
		@wcs = User.order('name ASC').all
		@peer_reviews = PeerReview.all 
		@pr_mean = PeerReview.first.pr_mean
	end

	def create
		@peer_review = PeerReview.new peer_review_params
		if @peer_review.save
			flash[:notice] = "Save Complete!"
			redirect_to peer_reviews_path
		else
			flash[:alert] = "Danger! Did Not Save!"
		end 
	end

	def pr_form
		@user_options = User.all.map{|u| [u.name, u.id]}
		@peer_review = PeerReview.new
		@peer_review.submitter_id = current_user.id
		respond_to do |format|               
    		format.js
  		end
	end

	private

	def peer_review_params
		params.require(:peer_review).permit(:user_id, :submitter_id, :loc_count, :external_link)
	end
	
end
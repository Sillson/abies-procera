class PeerReview < ActiveRecord::Base
	belongs_to :user

	def pr_mean
		PeerReview.average(:loc_count).to_f
	end

end

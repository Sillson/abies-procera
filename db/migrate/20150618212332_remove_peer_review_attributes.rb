class RemovePeerReviewAttributes < ActiveRecord::Migration
  def change
  	remove_column :peer_reviews, :submitter
  	remove_column :peer_reviews, :owner
  end
end

class AddPeerReviewIdAttributes < ActiveRecord::Migration
  def change
  	add_column :peer_reviews, :submitter_id, :integer
  	add_column :peer_reviews, :owner_id, :integer
  end
end

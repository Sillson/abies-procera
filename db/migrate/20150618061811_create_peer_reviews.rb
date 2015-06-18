class CreatePeerReviews < ActiveRecord::Migration
  def change
    create_table :peer_reviews do |t|
      t.string :submitter
      t.string :owner
      t.string :external_link
      t.integer :loc_count

      t.timestamps null: false
    end
  end
end

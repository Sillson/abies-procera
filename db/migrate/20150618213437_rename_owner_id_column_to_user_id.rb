class RenameOwnerIdColumnToUserId < ActiveRecord::Migration
  def self.up
    rename_column :peer_reviews, :owner_id, :user_id
  end

  def self.down
    rename_column :peer_reviews, :user_id, :owner_id
  end
end

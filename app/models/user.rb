class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :peer_reviews

  def sum_user_locs(builder_id)
  	PeerReview.where(user_id: builder_id).sum(:loc_count)
  end
end

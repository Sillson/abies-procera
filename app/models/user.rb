class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :peer_reviews

  def sum_user_locs
  	PeerReview.where(user_id: self.id).sum(:loc_count)
  end

  def ind_mean_difference(pr_mean)
  	self.sum_user_locs - pr_mean
  end

  def calculate_user_score(pr_mean)
  	ind_mean_diff = self.ind_mean_difference(pr_mean)
  	if ind_mean_diff <= 0
  		if ind_mean_diff.abs >= pr_mean/2
  			return 1
  		else
  			return 2
  		end
  	else
  		if ind_mean_diff.abs <= pr_mean/2 
  			return 3
  		else
  			return 4
  		end
  	end
  end

end

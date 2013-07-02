class PostFollowing < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  belongs_to :post
  belongs_to :user
end

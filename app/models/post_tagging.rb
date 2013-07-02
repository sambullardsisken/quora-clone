class PostTagging < ActiveRecord::Base
  attr_accessible :post_id, :topic_id

  belongs_to :post
  belongs_to :topic
end

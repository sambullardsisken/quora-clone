class TopicChoice < ActiveRecord::Base
  attr_accessible :topic_id, :user_id

  belongs_to :topic
  belongs_to :user
end

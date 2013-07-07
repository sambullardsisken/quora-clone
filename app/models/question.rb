class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :votes, :topic_ids

  has_many :answers
  has_many :comments, through: :answers
  belongs_to :user
  has_many :question_taggings
  has_many :topics, through: :question_taggings
  has_many :question_followings
  has_many :followers, through: :question_followings, source: :user

  validates :title, :presence => true


  def latest_update_time
    latest_update.created_at
  end

  def latest_update
    changes = [self]
    changes << self.answers.last unless self.answers.count == 0
    changes << self.comments.last unless self.comments.count == 0
    last_change = changes.max_by { |change| change.created_at }
    self.last_update = last_change.to_json
    last_change
  end

end

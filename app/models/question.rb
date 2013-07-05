class Question < ActiveRecord::Base
  attr_accessible :title, :user_id, :votes, :topic_ids

  has_many :answers
  has_many :comments, through: :answers
  belongs_to :user
  has_many :question_taggings
  has_many :topics, through: :question_taggings
  has_many :question_followings
  has_many :followers, through: :question_followings, source: :user

  validates :title, :presence => true


  def latest_update
    changes = [self.created_at]
    changes << self.answers.last.created_at unless self.answers.count == 0
    changes << self.comments.last.created_at unless self.comments.count == 0
    changes.max
  end

end

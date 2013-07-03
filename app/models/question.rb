class Question < ActiveRecord::Base
  attr_accessible :title, :user_id, :votes, :topic_ids

  has_many :answers
  belongs_to :user
  has_many :question_taggings
  has_many :topics, through: :question_taggings
  has_many :question_followings
  has_many :followers, through: :question_followings, source: :user
end

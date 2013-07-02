class QuestionFollowing < ActiveRecord::Base
  attr_accessible :question_id, :user_id

  belongs_to :question
  belongs_to :user
end

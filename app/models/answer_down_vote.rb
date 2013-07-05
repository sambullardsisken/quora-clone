class AnswerDownVote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id
  belongs_to :answer
  belongs_to :user
end

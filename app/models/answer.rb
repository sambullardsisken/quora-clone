class Answer < ActiveRecord::Base
  attr_accessible :question_id, :text, :user_id, :votes
end

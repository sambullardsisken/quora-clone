class QuestionTagging < ActiveRecord::Base
  attr_accessible :question_id, :topic_id

  belongs_to :question
  belongs_to :topic
end

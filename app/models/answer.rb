class Answer < ActiveRecord::Base
  attr_accessible :question_id, :text, :user_id, :votes

  belongs_to :user
  belongs_to :question
  has_many :comments
end

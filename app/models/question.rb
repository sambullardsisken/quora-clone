class Question < ActiveRecord::Base
  attr_accessible :title, :user_id, :votes

  has_many :answers
  belongs_to :user

end

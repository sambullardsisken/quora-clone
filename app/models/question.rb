class Question < ActiveRecord::Base
  attr_accessible :title, :user_id, :votes
end

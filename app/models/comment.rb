class Comment < ActiveRecord::Base
  attr_accessible :answer_id, :text, :user_id
end

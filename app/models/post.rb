class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :votes

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :post_taggings
  has_many :topics, through: :post_taggings
end

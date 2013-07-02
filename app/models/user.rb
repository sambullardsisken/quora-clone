class User < ActiveRecord::Base
  attr_accessible :blurb, :password_digest, :session_token, :username

  has_many :questions
  has_many :answers
  has_many :comments

  validates :username, presence: true
end

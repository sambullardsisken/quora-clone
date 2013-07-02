require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :blurb, :password, :session_token, :username

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :subject_choices
  has_many :topic_choices
  has_many :subjects, through: :subject_choices
  has_many :topics, through: :topic_choices
  has_many :question_followings
  has_many :followed_questions, through: :question_followings, source: :question
  has_many :posts
  has_many :question_followers, through: :followed_questions, source: :user
  has_many :answer_votes
  has_many :answers_voted_on, through: :answer_votes, source: :answer
  has_many :post_votes
  has_many :posts_voted_on, through: :post_votes, source: :post

  validates :username, presence: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

end

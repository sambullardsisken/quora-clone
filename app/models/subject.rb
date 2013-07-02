class Subject < ActiveRecord::Base
  attr_accessible :name

  has_many :topics
  has_many :subject_choices
  has_many :followers, through: :subject_choices, source: :user
end

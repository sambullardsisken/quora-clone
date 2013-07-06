class Topic < ActiveRecord::Base
  attr_accessible :name, :subject_id

  belongs_to :subject
  has_many :topic_choices
  has_many :followers, through: :topic_choices, source: :user
  has_many :question_taggings
  has_many :questions, through: :question_taggings

  def self.most_popular
    topics = Topic.all :include => [:questions]
    topics.sort_by { |topic| topic.questions.size }.reverse[0..4]
  end
end



class Quiz < ActiveRecord::Base
  attr_accessible :name, :is_public, :cost, :code, :pass, :user_id
  has_many :results, :inverse_of => :quiz
  has_many :questions, :inverse_of => :quiz
  belongs_to :user, :inverse_of => :quizzes
  has_and_belongs_to_many :tags

end
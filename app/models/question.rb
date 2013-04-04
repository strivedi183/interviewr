class Question < ActiveRecord::Base
  attr_accessible :prompt, :quiz_id
  belongs_to :test, :inverse_of => :questions
  has_many :answers, :inverse_of => :question
end
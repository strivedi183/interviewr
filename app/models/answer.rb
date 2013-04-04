class Answer < ActiveRecord::Base
  attr_accessible :name, :is_correct, :question_id
  belongs_to :question, :inverse_of => :answers
end
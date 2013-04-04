class Result < ActiveRecord::Base
  attr_accessible :user_id, :quiz_id, :num_correct
  belongs_to :user, :inverse_of => :results
  belongs_to :test, :inverse_of => :results
end
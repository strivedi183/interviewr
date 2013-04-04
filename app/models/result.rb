class Result < ActiveRecord::Base
  attr_accessible :user_id, :test_id, :score
  belongs_to :user, :inverse_of => :results
  belongs_to :test, :inverse_of => :results
end
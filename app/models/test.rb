class Test < ActiveRecord::Base
  attr_accessible :name, :is_public, :cost, :code, :pass, :user_id
  has_many :results, :inverse_of => :test
  has_many :questions, :inverse_of => :test
  belongs_to :user, :inverse_of => :tests
  has_and_belongs_to_many :tags

end
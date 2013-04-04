# == Schema Information
#
# Table name: quizzes
#
#  id        :integer          not null, primary key
#  name      :string(255)
#  is_public :boolean
#  cost      :decimal(, )      default(0.0)
#  code      :string(255)
#  num_pass  :integer
#  user_id   :integer
#

class Quiz < ActiveRecord::Base
  attr_accessible :name, :is_public, :cost, :code, :num_pass, :user_id
  has_many :results, :inverse_of => :quiz
  has_many :questions, :inverse_of => :quiz
  belongs_to :user, :inverse_of => :quizzes
  has_and_belongs_to_many :tags

end

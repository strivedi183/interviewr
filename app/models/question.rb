# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  prompt     :string(255)
#  quiz_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :prompt, :quiz_id
  belongs_to :test, :inverse_of => :questions
  has_many :answers, :inverse_of => :question
end

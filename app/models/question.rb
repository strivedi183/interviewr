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
  belongs_to :quiz, :inverse_of => :questions
  has_many :answers, :inverse_of => :question

  def correct_answers
    self.answers.where(:is_correct => true).map(&:id).map{|i| i.to_s}
  end

  def is_correct?(answers)
    if self.correct_answers == answers
      true
    else
      false
    end
  end
end

# == Schema Information
#
# Table name: results
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  quiz_id     :integer
#  num_correct :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Result < ActiveRecord::Base
  attr_accessible :user_id, :quiz_id, :num_correct
  belongs_to :user, :inverse_of => :results
  belongs_to :quiz, :inverse_of => :results

  def is_passed?
    if self.num_correct >= self.quiz.num_pass
      true
    else
      false
    end
  end

  def num_incorrect
    self.quiz.questions.count - self.num_correct
  end

  def date
    self.created_at.strftime("%m/%d/%Y")
  end

  def score
    (self.num_correct / self.quiz.questions.count) * 100
  end
end

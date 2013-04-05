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
    ((self.num_correct.to_f / self.quiz.questions.count.to_f).to_f * 100).round(2)
  end

  def sendtxt
    if self.is_passed?
      body = 'You passed! ' + self.score.to_f.to_s + '%'
    else
      body = 'You failed! ' + self.score.to_f.to_s + '%'
    end
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+16123459441', :to => self.user.phone, :body => body)
  end
end

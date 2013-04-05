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
#  has_started :boolean          default(FALSE)
#

class Result < ActiveRecord::Base
  attr_accessible :user_id, :quiz_id, :num_correct, :has_started
  belongs_to :user, :inverse_of => :results
  belongs_to :quiz, :inverse_of => :results

  def is_passed?
    if self.num_correct.present?
      if self.num_correct >= self.quiz.num_pass
        true
      else
        false
      end
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
      body = 'Congrats, you passed: ' + self.quiz.name + '! ' + self.score.to_f.to_s + '%'
    else
      body = 'Sorry, you failed: ' + self.quiz.name + '... ' + self.score.to_f.to_s + '%'
    end
    client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
    client.account.sms.messages.create(:from => '+16123459441', :to => self.user.phone, :body => body)
  end

  def sendemail
    if self.is_passed?
      quiz = self.quiz.name
      score = self.score.to_f.to_s
      Notifications.passing_message(user, quiz, score).deliver
    else
      quiz = self.quiz.name
      score = self.score.to_f.to_s
      Notifications.failing_message(user, quiz, score).deliver
    end
  end
end

class Notifications < ActionMailer::Base
  def passing_message(user, quiz, score)
    @auth = user
    @quiz = quiz
    @score = score
    mail :to => user.email, :from => 'eric@f-robots.com', :subject => "#{user.name}, You Passed!"
  end

  def failing_message(user, quiz, score)
    @auth = user
    @quiz = quiz
    @score = score
    mail :to => user.email, :from => 'eric@f-robots.com', :subject => "#{user.name}, You Failed!"
  end
end
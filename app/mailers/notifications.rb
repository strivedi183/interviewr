class Notifications < ActionMailer::Base
  def registration_message(name, email)
    mail :to => email, :from => ENV['EMAIL'], :subject => "#{name}, Your Registration is Complete!"
  end

  def passing_message(user, quiz, score)
    @auth = user
    @quiz = quiz
    @score = score
    mail :to => user.email, :from => ENV['EMAIL'], :subject => "#{user.name}, You Passed!"
  end

  def failing_message(user, quiz, score)
    @auth = user
    @quiz = quiz
    @score = score
    mail :to => user.email, :from => ENV['EMAIL'], :subject => "#{user.name}, You Failed!"
  end
end
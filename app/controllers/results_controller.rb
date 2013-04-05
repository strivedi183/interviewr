class ResultsController < ApplicationController
  def new
  end
  def create
    result = Result.create
    result.user = @auth
    result.quiz = Quiz.find(params[:quiz_id])
    result.num_correct = 0
    questions = params[:question]
    questions.each do |key, value|
      id = key
      q1 = Question.find(id)
      if q1.is_correct?(value)
        result.num_correct += 1
      end
    end
    result.save
    result.sendtxt
    result.sendemail
    redirect_to(@auth)
  end
end
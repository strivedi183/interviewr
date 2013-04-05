class ResultsController < ApplicationController
  def new
  end
  def create
    result = Result.where(quiz_id: params[:quiz_id], user_id: @auth.id, num_correct: nil).first

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
    redirect_to(@auth)
  end
end
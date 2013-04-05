class AnswersController < ApplicationController

  def new

  end

  def create
    @answer = Answer.create(params[:answer])
    @question = Question.find(params[:question_id])
    @question.answers << @answer
    @current_answer = @answer
    @answer = Answer.new
  end



end
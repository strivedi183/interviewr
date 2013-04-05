class QuestionsController < ApplicationController

  def new
    @quiz = Quiz.last
    @question = Question.new
  end

  def create
    quiz_id = params[:quiz_id]
    @quiz = Quiz.find(quiz_id)
    @question = Question.create(params[:question])
    @quiz.questions << @question
    @answer = Answer.new
  end
end
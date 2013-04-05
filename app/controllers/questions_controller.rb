class QuestionsController < ApplicationController

  def new
    binding.pry

    @question = Question.new
    binding.pry
  end

  def create
    binding.pry
    quiz_id = params[:quiz_id]
    @quiz = Quiz.find(quiz_id)
    @question = Question.create(params[:question])
    @quiz.questions << @question
  end
end
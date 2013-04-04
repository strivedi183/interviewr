class QuizzesController < ApplicationController
  def index
  end
  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def new
    @quiz = Quiz.new
  end

  def create
  end
end
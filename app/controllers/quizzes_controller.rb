class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(params[:quiz])
    @quiz.tags = Tag.is_exists(params[:tags].split(','))
  end

  def analytics
    @quiz = Quiz.find(params[:id])
  end
end
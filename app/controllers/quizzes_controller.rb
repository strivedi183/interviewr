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
    tags = params[:tags].split(',')
    tags.each do |tag|
      tag = tag.squish
      t = Tag.where(name: tag).first
      t = Tag.new(name: tag) if t.nil?
      @quiz.tags << t
    end
    redirect_to root_path
  end

  def analytics
    @quiz = Quiz.find(params[:id])
  end
end
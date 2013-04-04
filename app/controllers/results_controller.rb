class ResultsController < ApplicationController
  def new
  end
  def create
    questions = params[:question]
    questions.each do |key, value|
      id = key
      q1 = Question.find(id)
      q1.is_correct?(value)
    end
  end
end
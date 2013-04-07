class ResultsController < ApplicationController
  def new
  end
  def create
    result = Result.where(quiz_id: params[:quiz_id], user_id: @auth.id, num_correct: 0).last
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
    gflash :success => { :title => "Quiz Complete", :value => "Congrats " + @auth.name.split(" ")[0] + "," + " your answers have been submited!", :time => 3000, :sticky => false },
           :notice => { :title => "Quiz Results", :value => @auth.name.split(" ")[0] + " you'll receive a score momentarily", :time => 7000, :sticky => false }
  end
end
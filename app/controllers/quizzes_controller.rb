class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
    result = Result.where(quiz_id: @quiz.id, user_id: @auth.id, num_correct: nil).first
    result.num_correct = 0
    result.has_started = true
    result.save
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(params[:quiz])
    @quiz.tags = Tag.is_exists(params[:tags].split(','))
    @question = Question.new
  end



  def analytics
    @quiz = Quiz.find(params[:id])
  end

  def purchase
    quiz = Quiz.find(params[:id])

    begin
      if @auth.customer_id.nil?
        customer = Stripe::Customer.create(email: @auth.email, card: params[:token])
        @auth.customer_id = customer.id
        @auth.save
      end
      Stripe::Charge.create(customer: @auth.customer_id, amount: (quiz.cost * 100).to_i, description: quiz.name, currency: 'usd')
    rescue Stripe::CardError => @error
    end

    # if @error.nil?
    #   Notifications.purchased_product(@auth, product).deliver
    # end

    result = Result.create(:user_id => @auth.id, :quiz_id => quiz.id)

    @quizzes = Quiz.all
  end

  def search
    query = params[:query]
    @quizzes = Quiz.where("name @@ :q", :q => query)
    if query==''
      @quizzes = Quiz.all
    end
    render :filter
  end
end

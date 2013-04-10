class QuizzesController < ApplicationController
  before_filter :check_if_logged_in

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = @quiz.questions
    result = Result.where(quiz_id: @quiz.id, user_id: @auth.id, num_correct: nil).first  #where 'num_correct: nil' is an issue
    result.num_correct = 0
    result.has_started = true
    result.save
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(params[:quiz])
    @quiz.user = @auth
    @quiz.tags = Tag.is_exists(params[:tags].split(','))
    @quiz.save
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

    if @error.nil?
      #Notifications.purchased_product(@auth, product).deliver
      result = Result.create(:user_id => @auth.id, :quiz_id => quiz.id)
      quiz.purchase(@auth)
    end

    @quizzes = Quiz.all
  end

  def search
    query = params[:query]
    if query==''
      @quizzes = Quiz.all
    end
    @quizzes = Quiz.where("name @@ :q", :q => query)
    tags = Tag.where('name @@ :q', :q=>query)
    tags = tags.map{ |x| x.quizzes}.flatten
    @quizzes += tags
    @quizzes.uniq!
    render :filter
  end

  def finalize
    quiz = Quiz.find(params[:quiz_final_id])
    num_pass = params[:num_pass].to_f
    quiz.num_pass = num_pass
    quiz.save
    redirect_to quizzes_path
  end
end

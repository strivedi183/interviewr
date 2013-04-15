class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      gflash :success => { :title => "Successful Registration", :value => "Congrats " + @user.name.split(" ")[0] + "," + " your account has been created!", :time => 3000, :sticky => false },
             :notice => { :title => "Welcome " + @user.name.split(" ")[0] + "!", :value => "You'll receive a notification momentarily", :time => 7000, :sticky => false }
      @user.sendtxt
      @user.sendemail
      redirect_to root_path
    else
      gflash :warning => { :title => "Registration Error", :value => "Please include your name, e-mail and phone", :time => 5000, :sticky => false }
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @quizzes = Quiz.where(:user_id => @user.id)
    @results = Result.where(:user_id => @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to (user_path)
  end
end
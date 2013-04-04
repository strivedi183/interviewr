class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(params[:user])
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @results = Result.where(:user_id => @user.id)
  end

end
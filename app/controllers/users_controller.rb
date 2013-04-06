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

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to (user_path)
  end

end
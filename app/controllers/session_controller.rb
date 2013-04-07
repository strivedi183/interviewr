class SessionController < ApplicationController

  def new
  end

  def create
    @auth = User.where(:email => params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
      gflash :success => { :title => "Successful Login", :value => "Welcome back, " + @auth.name.split(" ")[0] + "! You are now logged in.", :image => "#{@auth.image}", :time => 2500, :sticky => false }
    else
      gflash :error => { :title => "Login Error", :value => "Something went wrong; please try again", :time => 2500, :sticky => false }
    end
    authenticate
  end

  def destroy
    session[:user_id] = nil
    authenticate
    redirect_to root_path
    gflash :success => { :title => "Logout Successful", :value => "Thanks for visiting! You are now logged off.", :time => 3000, :sticky => false }
  end

end

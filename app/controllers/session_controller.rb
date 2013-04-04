class SessionController < ApplicationController

def new
end

def create
    @auth = User.where(:email => params[:email]).first
    if @auth.present? && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
    else
      redirect_to root_path
    end
    authenticate
end

end
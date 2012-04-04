class SessionsController < ApplicationController
  skip_before_filter :authenticate_user, :only => [:new, :create]

  def new
    redirect_to welcome_url, :notice => "Already Logged in !!!"  if session[:user_id]
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to welcome_path, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "You have been logged out."
  end

end
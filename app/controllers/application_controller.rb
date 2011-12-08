class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user

  def current_user
    @_current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end

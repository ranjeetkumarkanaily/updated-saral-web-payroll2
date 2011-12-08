require 'spec_helper'

describe SessionsController do
  def valid_attributes
    {:username => "1",
     :password => "456123"}
  end

  describe "Get NEW" do
    it "redirect to welcome page when session is present" do
      @user = User.create! valid_attributes
      get :new
      assigns(:session => {:user_id => @user.id })
      response.should be_true
    end
  end

  describe "on POST to #create with good credentials and a request return url" do
    it "redirects to the welcome path" do
      @user = User.create! valid_attributes
      post :create, :username => @user.username, :password => @user.password
      assigns(:session => {:user_id => @user.id })
      response.should redirect_to(welcome_path)
    end

    it "should not login for invalid credentials" do
      @user = User.create! valid_attributes
      post :create, :username => @user.username, :password => "222"
      assigns(:user).should be_nil
    end
  end

  describe "on DELETE to #destroy the current user session" do

    it "should redirect to index page after destroy" do
      controller.stub(:logged_in?).and_return(true)
      delete :destroy, :session => {:user_id => nil}
      response.should redirect_to(login_url)
    end

  end

end
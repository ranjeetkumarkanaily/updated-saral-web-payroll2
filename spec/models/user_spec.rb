require 'spec_helper'

describe User do
  before(:each) do
    @valid_attribute = {
        :username => "1",
        :password => "456321"
    }
    @user = User.new
  end

  describe "Validating Attributes" do

    describe "Validate @valid_attribute" do

      it "should validate all attributes" do
        user_new = User.new(@valid_attribute)
        user_new.should be_valid
        user_new.errors.should be_empty
      end

    end

    describe "Validating Password" do

      it "should catch invalid password" do
        [nil,""].each do |p|
          user_new = User.new(@valid_attribute.merge(:password => p))
          user_new.should_not be_valid
          user_new.errors[:password].should_not be_empty
        end
      end

      it "check password length should be equal to greater than 6" do
        @user.password = "$%%a"
        @user.should_not be_valid
        @user.errors[:password].should eq(["length should be greater than or equal to 6"])
      end
    end

    describe "Authentication" do
      it "should authenticate user with correct username and password" do
        @user = User.create! @valid_attribute
        user_auth = User.authenticate(@user.username, @user.password)
        user_auth.should eq(@user)
      end

      it "should not authenticate user with incorrect password" do
        @user = User.create! @valid_attribute
        user_auth = User.authenticate(@user.username, "invalid")
        user_auth.should be_nil
      end
    end
  end
end

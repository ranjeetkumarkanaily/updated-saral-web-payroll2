require "spec_helper"

describe UserMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # include ActionController::UrlWriter - old rails
  include Rails.application.routes.url_helpers


  before(:all) do
    @user_detail =FactoryGirl.create(:employee)
    @company= FactoryGirl.create(:company,:photo => Rails.root.join("spec/factories/icon_a.png").open)
    paymonth = FactoryGirl.create(:paymonth, :month_year =>24134, :number_of_days => 28, :from_date =>"2011-02-01",:to_date => "2011-02-28", :month_name => "Feb/2011")
    @email = UserMailer.mail_payslip(@user_detail,paymonth.month_year)
  end

  it "should be set to be delivered to the email passed in" do
    @email.should deliver_to("#{@user_detail.empname} <#{@user_detail.email}>")
  end

  it "should delete the file after sending the mail" do

  end
  #
  #it "should contain the user's message in the mail body" do
  #  @email.should have_body_text(/Registered Successfully/)
  #end
  #
  #it "should have the correct subject" do
  #  @email.should have_subject(/Registered/)
  #end
end
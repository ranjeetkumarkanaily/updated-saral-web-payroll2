require 'spec_helper'

describe SalaryAllotmentsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  describe "Index" do
    it "gets salary allotment index page" do
      salAllot = FactoryGirl.create(:salary_allotment)
      get :index, :employee_id => salAllot.employee_id
      assigns(:allotSal).should eq([salAllot])
    end
  end

  describe "Update" do
    it "should update the salary allotted amount" do
      salAllot = FactoryGirl.create(:salary_allotment)
      post :update, :id => salAllot.id, :salAllotment => [salAllot.attributes.merge(:salary_allotment => 2222.00)]
      SalaryAllotment.find_by_id(salAllot.id)[:salary_allotment].should eq(2222.00)
    end
  end
end
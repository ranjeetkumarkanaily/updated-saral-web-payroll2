require 'spec_helper'
describe SalaryAllotmentsController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  describe "POST create" do
    it "creates a new salary" do
      salary_allot = FactoryGirl.create(:salary_allotment)
      salary = FactoryGirl.build(:salary)
      #expect {
      #  post :create, :salary => [salary.attributes], :month_year => "02/2011", :employee_id => "1"
      #}.to change(Salary, :count).by(1)
    end
  end
end
require 'spec_helper'
describe SalariesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  describe "POST create" do
    describe "Creation of new Salary" do
      salary = FactoryGirl.build(:salary)
      it "Count should be increases by one" do
        expect {
          post :create, :salary => [salary.attributes]
        }.to change(Salary, :count).by(1)
      end

      it "redirects to salary index path" do
        post :create, :salary => [salary.attributes]
        response.should redirect_to salaries_path
      end

      it "should redirect to salary new page" do
        post :create, :month_year => "01/2011", :employee_id => 1
      end

      it "should redirect to salary new page" do
        salary = FactoryGirl.build(:salary_allotment)
        post :create, :month_year => "02/2011", :employee_id => 1
      end
    end
  end
end
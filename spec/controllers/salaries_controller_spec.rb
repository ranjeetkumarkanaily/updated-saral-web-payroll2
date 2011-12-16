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
    end
  end

  describe "GET new" do
    it "assigns a requested SalaryAllotment as @SalaryAllotment" do
      sal_allot = FactoryGirl.create(:salary_allotment)
      get :new, :month_year => "02/2011", :employee_id => sal_allot.employee_id
      assigns(:salary_allotments).should eq([sal_allot])
    end

    it "assigns a requested SalaryAllotment as @SalaryAllotment" do
      sal_allot = FactoryGirl.create(:salary_allotment)
      get :new, :month_year => "03/2011", :employee_id => sal_allot.employee_id
      assigns(:salary_allotments).should eq([sal_allot])
    end
  end

  describe "GET index" do

    it "get salary earnings for the given employee" do

      Salary.destroy_all
      SalaryHead.destroy_all
      salary_head =  FactoryGirl.create(:salary_head, :id => 1, :head_name => "BASIC", :short_name => "Basic", :salary_type => "Earnings")
      salary = FactoryGirl.create(:salary, :salary_head => salary_head)
      salary_head =  FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :short_name => "DA", :salary_type => "Earnings")
      salary_da = FactoryGirl.create(:salary, :salary_head => salary_head )

      get :index, :month_year => "02/2011", :employee_id => salary.employee_id
      assigns(:salary_earning)

    end

  end
end
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

  #describe "GET edit" do
  #  it "assigns the requested salary as @salary" do
  #    salary = FactoryGirl.create(:salary)
  #    get :edit_salaries, :month_year => "02/2011", :employee_id => 1
  #    assigns(:salary).should eq(salary)
  #  end
  #end

  describe "Update" do
    it "should update the salary amount" do
      sal = FactoryGirl.create(:salary)
      post :update, :id => sal.id, :salary => [sal.attributes.merge(:salary_amount => 1000)]
      Salary.find_by_id(sal.id)[:salary_amount].should eq(1000)
    end
  end
end
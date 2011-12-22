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
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Earnings")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2)

      get :index, :month_year => "02/2011", :employee_id => salary_basic.employee_id

      assigns(:salary_earning)[0].salary_amount.should eq(salary_basic.salary_amount)
    end

    it "get salary deductions for the given employee" do
      Salary.destroy_all
      SalaryHead.destroy_all
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Deductions")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Deductions")
      salaryHead3 = FactoryGirl.create(:salary_head, :id => 3, :head_name => "HRA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2)
      salary_hra = FactoryGirl.create(:salary, :salary_head => salaryHead3)
      get :index, :month_year => "02/2011", :employee_id => salary_basic.employee_id

      assigns(:salary_deduction)[0].salary_amount.should eq(salary_basic.salary_amount)
    end


    it "get pf for the given employee" do
      Salary.destroy_all
      SalaryHead.destroy_all
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Earnings")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2)

      get :index, :month_year => "02/2011", :employee_id => salary_da.employee_id

      pf_amount = ((salary_basic.salary_amount + salary_da.salary_amount) *0.12).round.to_f
      assigns(:pf_amount).should eq(pf_amount)
    end

    describe "Update" do
      it "should update the salary amount" do
        sal = FactoryGirl.create(:salary)
        post :update, :id => sal.id, :salary => [sal.attributes.merge(:salary_amount => 1000)]
        Salary.find_by_id(sal.id)[:salary_amount].should eq(1000)
      end
    end

    describe "GET edit" do
    it "assigns the requested Salary as @salary" do
      salary = FactoryGirl.create(:salary)
      get :edit, :month_year => "02/2011", :employee_id => 1
      assigns(:salary).should eq([salary])
    end
  end

  end
end
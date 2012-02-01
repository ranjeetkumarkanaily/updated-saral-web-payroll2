require 'spec_helper'
describe SalariesController do
  before :each do
    controller.stub(:logged_in?).and_return(true)
  end

  describe "POST create" do
    describe "Creation of new Salary" do

      before :each do
        leave_detail = FactoryGirl.create(:leave_detail,:leave_date => "2011-02-02")
        pay_month =  FactoryGirl.create(:paymonth, :month_year => 24134, :number_of_days => 28,:from_date => "2011-02-01",:to_date => "2011-02-28",:month_name => "Feb/2011")

        @salary = FactoryGirl.build(:salary)
      end

      it "Count should be increases by one" do
        expect {
          post :create, :salary => [@salary.attributes],:month_year=>'Feb/2011'
        }.to change(Salary, :count).by(1)
      end

      it "redirects to salary index path" do
        post :create, :salary => [@salary.attributes],:month_year=>'Feb/2011'
        response.should redirect_to salaries_path
      end
    end
  end

  describe "GET new" do
    it "assigns a requested SalaryAllotment as @SalaryAllotment" do
      salary_group_detail = FactoryGirl.create(:salary_group_detail)
      sal_allot = FactoryGirl.create(:salary_allotment,:salary_group_detail_id=>salary_group_detail.id)
      get :new, :month_year => "Feb/2011", :employee_id => sal_allot.employee_id
      assigns(:salary_allotments).should eq([sal_allot])
    end

    it "assigns a requested SalaryAllotment as @SalaryAllotment" do
      salary_group_detail = FactoryGirl.create(:salary_group_detail)
      sal_allot = FactoryGirl.create(:salary_allotment,:salary_group_detail_id=>salary_group_detail.id)
      get :new, :month_year => "Mar/2011", :employee_id => sal_allot.employee_id
      assigns(:salary_allotments).should eq([sal_allot])
    end
  end

  describe "GET index" do
    before :each do
      @pf_esi_rate = FactoryGirl.create(:pf_esi_rate)
      paymonth = FactoryGirl.create(:paymonth, :month_year =>24134, :number_of_days => 31, :from_date =>"2011-02-01",:to_date => "2011-02-28", :month_name => "Feb/2011")
      pt_rate = FactoryGirl.create(:pt_rate, :paymonth_id => paymonth.id)
      @employee = FactoryGirl.create(:employee)
    end

    it "get salary earnings for the given employee" do
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Earnings")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1, :employee_id => @employee.id)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2, :employee_id => @employee.id)

      get :index, :month_year => "Feb/2011", :employee_id => salary_basic.employee_id

      assigns(:salary_earning)[0].salary_amount.should eq(salary_basic.salary_amount)
    end

    it "get salary deductions for the given employee" do
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Deductions")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Deductions")
      salaryHead3 = FactoryGirl.create(:salary_head, :id => 3, :head_name => "HRA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2)
      salary_hra = FactoryGirl.create(:salary, :salary_head => salaryHead3)

      get :index, :month_year => "Feb/2011", :employee_id => salary_basic.employee_id

      assigns(:salary_deduction)[0].salary_amount.should eq(salary_basic.salary_amount)
    end


    it "get pf for the given employee" do
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Earnings")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2, :salary_amount=>500.00)

      get :index, :month_year => "Feb/2011", :employee_id => salary_da.employee_id

      pf_amount = ((salary_basic.salary_amount + salary_da.salary_amount) * @pf_esi_rate.pf_rate/100).round.to_f

      assigns(:pf_amount).should eq(pf_amount)
    end

    it "generates pdf output" do
      salaryHead1 = FactoryGirl.create(:salary_head, :id => 1, :head_name => "Basic", :salary_type => "Earnings")
      salaryHead2 = FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :salary_type => "Earnings")
      salary_basic = FactoryGirl.create(:salary, :salary_head => salaryHead1, :employee_id => @employee.id)
      salary_da = FactoryGirl.create(:salary, :salary_head => salaryHead2, :employee_id => @employee.id)

      get :index, :month_year => "Feb/2011", :employee_id => salary_basic.employee_id, :format => "pdf"
      response.should render_template('salaries/index.pdf')
    end
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
      get :edit, :month_year => "Feb/2011", :employee_id => 1
      assigns(:salary).should eq([salary])
    end
  end


end
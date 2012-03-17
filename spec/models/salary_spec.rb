require 'spec_helper'

describe Salary do
   it { should belong_to(:salary_head)}

  it { should belong_to(:employee_detail)}

  describe "Salary Calculation" do

    it "should return true (salary is generated for given employee for given month)" do
      salary = FactoryGirl.create(:salary)
      Salary.is_salary_generated?("Feb/2011", salary.employee_id).should be_true
    end

    it "should get salary on basis of salary type" do
      salary = FactoryGirl.create(:salary)
      getSalary = Salary.get_salary_on_salary_type salary.salary_head.salary_type, 'Feb/2011', salary.employee_id.to_s
      getSalary[0].salary_amount.should eq(1000.00)
      getSalary[0].salary_head.head_name.should eq("Basic")
    end


    describe "find employee Leave" do
      it "should find employee leave" do
        leave_detail = FactoryGirl.create(:leave_detail)
        getleave = Salary.find_employees_leave '2011-01-01', '2011-01-31', leave_detail.employee_id.to_s
        getleave[0]['leave_count'].should eq("1")
      end
    end

    describe "get pt amount" do

      it "should give pt amount within range defined" do
        salary = FactoryGirl.create(:salary)
        pt_rate = FactoryGirl.create(:pt_rate)
        get_pt = Salary.get_pt_amount "Feb/2011", salary.employee_id.to_s
        get_pt.should eq(100.00)
      end

      it "should give pt amount outside the range defined" do
        salary = FactoryGirl.create(:salary,:salary_amount => 17000)
        pt_rate = FactoryGirl.create(:pt_rate,:min_sal_range => 15000.0, :max_sal_range => 25000, :pt=>250.0)
        get_pt = Salary.get_pt_amount "Feb/2011", salary.employee_id.to_s
        get_pt.should eq(250.0)
      end

      it "should give pt amount outside the range defined" do
        salary = FactoryGirl.create(:salary,:salary_amount => 6000)
        pt_rate = FactoryGirl.create(:pt_rate,:min_sal_range => 7000.0)
        get_pt = Salary.get_pt_amount "Feb/2011", salary.employee_id.to_s
        get_pt.should eq(0)
      end

    end

  end

end
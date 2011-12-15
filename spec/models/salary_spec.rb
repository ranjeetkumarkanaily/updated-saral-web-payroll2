require 'spec_helper'

describe Salary do
   it { should belong_to(:salary_head)}

  it { should belong_to(:employee_detail)}

  describe "Salary Calculation" do
    before(:each) do
      Salary.delete_all
      SalaryHead.delete_all
    end

    it "should return true (salary is generated for given employee for given month)" do
      salary = FactoryGirl.create(:salary)
      Salary.is_salary_generated?("02/2011", salary.employee_id).should be_true
    end

    it "should get salary on basis of salary type" do
      salary = FactoryGirl.create(:salary)

      getSalary = Salary.get_salary_on_salary_type salary.salary_head.salary_type, '02/2011', salary.employee_id.to_s
      getSalary[0].total.should eq("1000.00")
      getSalary[0].head_name.should eq("Basic")
    end

    it "should get pf amount for the given employee for the respected month" do
      Salary.delete_all
      SalaryHead.delete_all
      salary_head =  FactoryGirl.create(:salary_head, :id => 1, :head_name => "BASIC", :short_name => "Basic", :salary_type => "Earnings")
      salary = FactoryGirl.create(:salary, :salary_head => salary_head)
      salary_head =  FactoryGirl.create(:salary_head, :id => 2, :head_name => "DA", :short_name => "DA", :salary_type => "Earnings")
      salary_da = FactoryGirl.create(:salary, :salary_head => salary_head )
      getPF = Salary.get_pf_amount "02/2011", salary.employee_id.to_s
      getPF.should eq(240.00)
    end

    describe "get esi amount" do

      it "should get esi amount if gross salary is less or equal to 15000" do

        salary = FactoryGirl.create(:salary)
        getESI = Salary.get_esi_amount "02/2011", salary.employee_id.to_s
        getESI.should eq(18.00)

      end

      it "should get 0 esi amount if gross salary is more than 15000" do

        salary = FactoryGirl.create(:salary,:salary_amount => 17000)
        getESI = Salary.get_esi_amount "02/2011", salary.employee_id.to_s
        getESI.should eq(0)

      end

    end

  end

end
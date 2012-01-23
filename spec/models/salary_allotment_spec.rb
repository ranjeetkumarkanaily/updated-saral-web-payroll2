require 'spec_helper'

describe SalaryAllotment do
  it { should belong_to(:salary_head)}

  it { should belong_to(:employee_detail)}

  it "should return employee whose salary is not allotted" do
    sal_allot = FactoryGirl.create(:salary_allotment,:salary_allotment=>0)
    SalaryAllotment.get_employee_with_salary_not_allotted.should be_true
  end

  it "should return employee whose salary is allotted" do
    sal_allot = FactoryGirl.create(:salary_allotment)
    SalaryAllotment.get_employee_with_salary_allotted.should be_true
  end

  it "should return allotted salaries" do
    sal_allot = FactoryGirl.create(:salary_allotment)
    SalaryAllotment.get_allotted_salaries("Feb/2011",sal_allot.employee_id).should be_true
  end

  it "should return allotted salaries for previous effective date" do
    sal_allot = FactoryGirl.create(:salary_allotment)
    SalaryAllotment.get_allotted_salaries_for_max_effective_date("Feb/2011", sal_allot.employee_id).should be_true
  end

end
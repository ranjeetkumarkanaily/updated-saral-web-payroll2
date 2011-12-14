require 'spec_helper'

describe EmployeeDetail do
  it { should belong_to(:employee)}

  it { should belong_to(:salary_group)}

  it { should have_many(:salary_allotments)}

  it { should have_many(:salaries)}

  it "checks for the uniqueness of employee_id and effective_date" do
    emp_detail = FactoryGirl.create(:employee_detail)
    duplicate_emp_detail = EmployeeDetail.new(:employee_id => 1, :effective_date => "2009-10-31", :salary_group_id =>2, :allotted_gross=>6000)
    duplicate_emp_detail.should_not be_valid
  end
end

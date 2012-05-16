require 'spec_helper'

describe EmployeeDetail do

  it { should belong_to(:employee)}

  it { should belong_to(:salary_group)}

  it { should have_many(:salary_allotments)}

  it { should have_many(:salaries)}

  it "checks for the uniqueness of employee_id and effective_date" do
    employee = FactoryGirl.create(:employee,:date_of_birth => "1986-01-01")
    attendance_configuration = FactoryGirl.create(:attendance_configuration)
    branch = FactoryGirl.create(:branch)
    financial_institution = FactoryGirl.create(:financial_institution)
    emp_detail = FactoryGirl.create(:employee_detail,:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id )
    duplicate_emp_detail = EmployeeDetail.new(:employee_id => employee.id, :effective_date => "2011-02-10", :salary_group_id =>2, :allotted_gross=>6000,:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id )
    duplicate_emp_detail.should_not be_valid
  end

  it "should return branch detail for selected month and employee" do
    employee = FactoryGirl.create(:employee)
    attendance_configuration = FactoryGirl.create(:attendance_configuration)
    branch = FactoryGirl.create(:branch)
    financial_institution = FactoryGirl.create(:financial_institution)

    emp_details = FactoryGirl.create(:employee_detail,:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id )
    month_year = Date.strptime "Oct/2009","%b/%Y"
    emp_branch_detail = EmployeeDetail.employee_branch month_year, 1
    emp_branch_detail[0][:branch_id].should eq(emp_details[:branch_id])

  end

  it "should return branch detail for selected month and employee" do
    employee = FactoryGirl.create(:employee)
    attendance_configuration = FactoryGirl.create(:attendance_configuration)
    branch = FactoryGirl.create(:branch)
    financial_institution = FactoryGirl.create(:financial_institution)

    emp_details = FactoryGirl.create(:employee_detail,:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id, :effective_date => '2011-03-01')
    month_year = Date.strptime "Mar/2011","%b/%Y"
    emp_branch_detail = EmployeeDetail.employee_branch month_year, 1
    emp_branch_detail[0][:branch_id].should eq(emp_details[:branch_id])

  end

  it "should give error if effective date is before date of joining" do
    employee = FactoryGirl.create(:employee,:date_of_joining => '2011-02-02')
    employee_detail = EmployeeDetail.new(:employee_id => employee.id,:effective_date => '2011-01-01',:salary_group_id => 2)
    employee_detail.save
    employee_detail.errors.messages[:effective_date].should eq(["should be after date of joining"])
  end

  it "should give error if effective date is after date of leaving" do
    employee = FactoryGirl.create(:employee,:date_of_leaving => '2011-05-02',:leaving_reason => 'Without Reason')
    employee_detail = EmployeeDetail.new(:employee_id => employee.id,:effective_date => '2011-05-10',:salary_group_id => 2)
    employee_detail.save
    employee_detail.errors.messages[:effective_date].should eq(["should be before date of leaving"])
  end

  it "should give error if effective date is before last saved effective date" do
    employee = FactoryGirl.create(:employee)
    employee_detail = EmployeeDetail.create(:employee_id => employee.id,:effective_date => '2011-03-01',:salary_group_id => 2)
    employee_details_second = EmployeeDetail.new(:employee_id => employee.id,:effective_date => '2011-02-10',:salary_group_id => 2)
    employee_details_second.save
    employee_details_second.errors.messages[:effective_date].should eq(["should be after date of last saved Effective date"])
  end


end

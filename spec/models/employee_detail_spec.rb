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
    duplicate_emp_detail = EmployeeDetail.new(:employee_id => employee.id, :effective_date => "2009-10-01", :salary_group_id =>2, :allotted_gross=>6000,:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id )
    duplicate_emp_detail.should_not be_valid
  end

  it "checks for the DOB validation with pan effective date given for the employee" do
    employee = FactoryGirl.create(:employee,:date_of_birth => "1986-01-01")
    attendance_configuration = FactoryGirl.create(:attendance_configuration)
    branch = FactoryGirl.create(:branch)
    financial_institution = FactoryGirl.create(:financial_institution)
    salary_group = FactoryGirl.create(:salary_group)
    emp_detail = EmployeeDetail.new(:employee_id=> employee.id,:salary_group_id => salary_group.id,:effective_date => "2010-01-01",:pan => "aaaaa1234a",:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id, :pan_effective_date => "1985-02-02" )
    emp_detail.save
    emp_detail.errors.messages[:pan_effective_date].should eq(["PAN effective date should be after date of Birth"])
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

    emp_details = FactoryGirl.create(:employee_detail,:branch_id => branch.id,:financial_institution_id => financial_institution.id,:attendance_configuration_id => attendance_configuration.id )
    month_year = Date.strptime "Nov/2009","%b/%Y"
    emp_branch_detail = EmployeeDetail.employee_branch month_year, 1
    emp_branch_detail[0][:branch_id].should eq(emp_details[:branch_id])

  end


end

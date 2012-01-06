require 'spec_helper'

describe Employee do
  before(:each) do

    @dept = FactoryGirl.create(:department)
    @desig = FactoryGirl.create(:designation)
    @grd = FactoryGirl.create(:grade)
    @attr = {
      :empname => "GaneshL",
      :date_of_birth => "1985-1-1",
      :date_of_joining => "2009-10-31",
      :date_of_leaving => "2010-11-30",
      :present_state_id => "1",
      :refno => "A1",
      :email => "gane@gane.com",
      :designation_id => @desig.id,
      :department_id => @dept.id,
      :grade_id => @grd.id
    }
  end

  it { should have_many(:leave_details)}

  it { should belong_to(:designation)}

  it { should belong_to(:department)}

  it { should belong_to(:grade)}

  it "should require a name" do
    no_name_employee = Employee.new(@attr.merge(:empname => ""))
    no_name_employee.should_not be_valid
  end

  it "should not accept names that are too long" do
    long_name = "s" * 101
    long_name_employee = Employee.new(@attr.merge(:empname => long_name))
    long_name_employee.should_not be_valid
  end

  it "should require dateofjoining" do
    no_date_employee = Employee.new(@attr.merge(:date_of_joining => ""))
    no_date_employee.should_not be_valid
  end

  it "rejects duplicate Ref nos" do
    Employee.create!(@attr)
    emp_with_duplicate_refno = Employee.new(@attr)
    emp_with_duplicate_refno.should_not be_valid
  end

  it "rejects Ref nos identical up to case" do
    upcased_refno = @attr[:refno].upcase
    Employee.create!(@attr.merge(:refno => upcased_refno))
    emp_with_duplicate_refno = Employee.new(@attr)
    emp_with_duplicate_refno.should_not be_valid
  end

    it "accepts valid email addresses" do
    emails = %w[emp@abc.com THE_EMP@abc.b.org first.last@sdf.jp]
    emails.each do |email|
      valid_email_emp = Employee.new(@attr.merge(:email => email))
      valid_email_emp.should be_valid
    end
  end

  it "rejects invalid email addresses" do
    emails = %w[emp@abc,com emp_at_rel.org example.emp@gan.]
    emails.each do |email|
    invalid_email_emp = Employee.new(@attr.merge(:email => email))
    invalid_email_emp.should_not be_valid
    end
  end

  it "rejects duplicate email addresses" do
    Employee.create!(@attr)
    emp_with_duplicate_email = Employee.new(@attr)
    emp_with_duplicate_email.should_not be_valid
  end

  it "rejects email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Employee.create!(@attr.merge(:email => upcased_email))
    emp_with_duplicate_email = Employee.new(@attr)
    emp_with_duplicate_email.should_not be_valid
  end

  it "requires a state" do
    no_state_employee = Employee.new(@attr.merge(:present_state_id => ""))
    no_state_employee.should_not be_valid
  end

  it "requires a designation" do
    no_designation_employee = Employee.new(@attr.merge(:designation_id => ""))
    no_designation_employee.should_not be_valid
  end

  it "requires a department" do
    no_department_employee = Employee.new(@attr.merge(:department_id => ""))
    no_department_employee.should_not be_valid
  end

  it "requires a grade" do
    no_grade_employee = Employee.new(@attr.merge(:grade_id => ""))
    no_grade_employee.should_not be_valid
  end

  describe "dateofjoining" do
    it "should be before dateofleaving if dateofleaving exists" do
      wrongdoj_employee = Employee.new(@attr.merge(:date_of_joining => "2010-12-01"))
      wrongdoj_employee.should_not be_valid
    end
  end

  describe "dateofbirth" do
    it "should be before dateofjoining" do
      wrongdob_employee = Employee.new(@attr.merge(:date_of_birth => "2009-11-01"))
      wrongdob_employee.should_not be_valid
    end
  end

end

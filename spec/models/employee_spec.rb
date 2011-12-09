require 'spec_helper'

describe Employee do
  before(:each) do
  @attr = {
    :empname => "GaneshL",
    :date_of_joining => "2009-10-31",
    :date_of_leaving => "2010-11-30"
  }
  end

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

  describe "dateofjoining" do
    it "should be before dateofleaving if dateofleaving exists" do
      wrongdoj_employee = Employee.new(@attr.merge(:date_of_joining => "2010-12-01"))
      wrongdoj_employee.should_not be_valid
    end
  end
end

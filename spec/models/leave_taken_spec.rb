require 'spec_helper'

describe LeaveTaken do

  it "should return employee list" do
    employee = FactoryGirl.create(:employee)
    leave_taken = LeaveTaken.new()
    employee_list = leave_taken.employee_list
    employee_list.count.should eq(1)
  end

  it "should return employee name" do
    employee = FactoryGirl.create(:employee)
    leave_taken = FactoryGirl.create(:leave_taken,:employee_id=>employee.id)
    employee_name = leave_taken.employee_name
    employee_name.should eq(employee.empname)
  end

end

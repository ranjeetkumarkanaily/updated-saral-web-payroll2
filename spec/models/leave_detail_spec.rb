require 'spec_helper'

describe LeaveDetail do
  describe "Association" do
    it { should belong_to(:employee)}
  end

  describe "validates leave details" do

    it "should require employee id " do
      no_employee = LeaveDetail.new(:employee_id => "", :leave_date => "2011-01-01")
      no_employee.should_not be_valid
    end

    it "should require leave date" do
      no_employee = LeaveDetail.new(:employee_id => "1", :leave_date => "")
      no_employee.should_not be_valid
    end

    it "should require employee existence" do
      no_employee = LeaveDetail.new(:employee_id => "1", :leave_date => "2011-01-01")
      no_employee.should_not be_valid
    end

    it "checks for the uniqueness of employee_id and leave_date" do
      leave_detail = FactoryGirl.create(:leave_detail)
      dup_leave_detail = LeaveDetail.new(:employee_id => leave_detail.employee_id, :leave_date => leave_detail.leave_date)
      dup_leave_detail.should_not be_valid
    end
  end
end

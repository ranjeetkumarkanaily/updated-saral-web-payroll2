require 'spec_helper'

describe AttendanceConfiguration do
  before(:each) do
    @attr = {
        :attendance => 'Karnataka',
        :short_name => 'KARNATAKA',
        :salary_calendar_days => 'Actual Days / Month'
    }
  end

  it "should require a attendance name" do
    no_attendance_name = AttendanceConfiguration.new(@attr.merge(:attendance => ""))
    no_attendance_name.should_not be_valid
  end

  it "should require a short name" do
    no_short_name = AttendanceConfiguration.new(@attr.merge(:short_name => ""))
    no_short_name.should_not be_valid
  end

  it "should require a salary calendar days" do
    no_salary_calendar_days = AttendanceConfiguration.new(@attr.merge(:salary_calendar_days => ""))
    no_salary_calendar_days.should_not be_valid
  end


end

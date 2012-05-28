Given /^valid Attendance Normal Shift created$/ do
  @attnd=AttendanceConfiguration.create(:attendance=> "Normal Shift", :short_name=> "NS", :salary_calendar_days=> "Actual Day / Month")
end

Given /^valid Holiday gandhi jayanthi created$/ do
  Holiday.create(:attendance_configuration_id=> @attnd.id, :holiday_date=> "2012-10-02", :description=> "gandhi jayanthi", :national_holiday=> false)
end

Then /^Holiday "(.*?)" should be deleted$/ do |value|
  Holiday.delete(value)
end

Then /^Holiday list count should increse by (\d+)$/ do |count|
  Holiday.count.should == count.to_i
end
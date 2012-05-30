Given /^a valid leave definition Compensatory Work Created$/ do
  LeaveDefinition.create(:leave_name=> "Compensatory Work", :short_name=> "CW")
end

Then /^Leave definition "(.*?)" should be deleted$/ do |value|
  LeaveDefinition.delete(value)
end

Then /^Leave definition count should get increase by (\d+)$/ do |count|
  LeaveDefinition.count.should == count.to_i
end
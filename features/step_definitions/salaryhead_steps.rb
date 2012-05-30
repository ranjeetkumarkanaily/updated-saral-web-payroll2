Given /^User have Salary Head  Allowance created$/ do
  SalaryHead.create(:head_name=> "Allowance", :short_name=> "ALLOW", salary_type: "Earnings")
end

Then /^Salary Head "(.*?)" should be deleted$/ do |value|
  SalaryHead.delete(value)
end

Then /^Salary head count should get increase by (\d+)$/ do |count|
  SalaryHead.count.should == count.to_i
end
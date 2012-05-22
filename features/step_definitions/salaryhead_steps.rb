Given /^User have Salary Head  Allowance created$/ do
  SalaryHead.create(:head_name=> "Allowance", :short_name=> "ALLOW", salary_type: "Earnings")
end

Then /^Salary Head "(.*?)" should be deleted$/ do |value|
  SalaryHead.delete(value)
end
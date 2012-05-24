Given /^User have Salary Group  Manager created$/ do
  SalaryGroup.create(:salary_group_name=> "Manager", :based_on_gross=> true)
end

Then /^Salary Group "(.*?)" should be deleted$/ do |value|
   SalaryGroup.delete(value)
end
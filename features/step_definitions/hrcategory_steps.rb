Given /^User have HR Category Family Details created$/ do
  HrCategory.create(:category_name=> "Family Details")
end

Then /^hr category "(.*?)" should be deleted$/ do |value|
  HrCategory.delete(value)
end
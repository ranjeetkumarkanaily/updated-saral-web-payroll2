Given /^User have (.*?) Family Details created$/ do |hr_category|
  HrCategory.create(:category_name=> hr_category)
end

Then /^hr category "(.*?)" should be deleted$/ do |value|
  HrCategory.delete(value)
end

Given /^User have Hr category (.*?) created under (.*?)$/ do |category,hr_category|
  hr_catgry=HrCategory.create(:category_name=> hr_category)
  HrCategoryDetail.create(hr_category_id: hr_catgry.id, name: category, data_type: nil, required: false)
end
Given /^no company created$/  do
  Company.delete_all
end

Given /^user on the new company creation page$/  do
  visit path_to('company_new')
end

Given /^user enters relyon as companyname$/ do
   fill_in(:companyname, :with => "relyon")
end

Given /^user enters rahul as responsible_person$/ do
   fill_in(:responsible_person, :with => "rahul")
end

Given /^user enters 2011-01-01 as dateofestablishment$/ do
   fill_in(:dateofestablishment, :with => "2011-01-01")
end

Given /^user enters bangalore as address$/ do
   fill_in(:address, :with => "bangalore")
end

When /^user click on create$/ do
  click_button('Create Company')
end

Then /^it should create company$/ do
 Company.create!(:companyname => "relyon" ,:responsible_person => "rahul", :address => "Bangalore",:dateofestablishment => "2010-01-01" )
end


Then /^it should load Web-SPP Companies index page$/ do
 visit path_to('company_list')
end

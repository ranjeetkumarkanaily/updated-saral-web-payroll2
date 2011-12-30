Given /^user on the Web-SPP Login page$/  do
  visit path_to('login')
end

Given /^user enter admin as username$/ do
   fill_in(:username, :with => "admin")
end

Given /^user enters rahul as responsible_person$/ do
   fill_in(:responsible_person, :with => "rahul")
end

When /^user click on Login button$/ do
  #click_button('Login')
end

Then /^it should login successfully$/ do
#
end

Given /^a valid user$/ do
  User.create(:username => "admin", :password => "default")
  #pending # express the regexp above with the code you wish you had
end

Then /^User should have ([0-9]+) company$/ do |count|
  Company.count.should == count.to_i
  #pending # express the regexp above with the code you wish you had
end

Given /^User have company named Relyon$/ do
  Company.create!(:companyname => "Relyon" ,:responsible_person => "rahul", :address => "Bangalore",:website => "www.mycompany.com",:dateofestablishment => "2010-10-30",:pf => true,:esi => true,:phonenumber1 => "080201256",:phonenumber2 => "080201256" ,:address2 => "My company address 2",:address3 => "My company address 3",:email => "mycomap@comp.com" )
end

### paymonths steps definition

Given /^User have paymonth jan\/(\d+) created$/ do |arg1|
  Paymonth.create!(:month_year=> 24145, :number_of_days=> 31, :from_date=> "2010-12-01", :to_date=> "2010-12-31", :month_name=> "jan/2012")
end

And /^User should see paymonth "(.*?)" details$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
Then /^paymonth "(.*?)" should be deleted$/ do |value|
  Paymonth.delete(value)
end
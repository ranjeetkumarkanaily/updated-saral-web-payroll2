Given /^a valid user$/ do
  User.create(:username => "admin", :password => "default")
  #pending # express the regexp above with the code you wish you had
end

Then /^I should have ([0-9]+) company$/ do |count|
  Company.count.should == count.to_i
  #pending # express the regexp above with the code you wish you had
end

Given /^I have company named Relyon$/ do
  Company.create!(:companyname => "Relyon" ,:responsible_person => "rahul", :address => "Bangalore",:website => "www.mycompany.com",
      :dateofestablishment => "2010-10-30",:pf => true,:esi => true,:phonenumber1 => "080201256",:phonenumber2 => "080201256" ,
      :address2 => "My company address 2",:address3 => "My company address 3",:email => "mycomap@comp.com" )
  #pending # express the regexp above with the code you wish you had
end
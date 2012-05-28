Given /^User have required details for employees created$/ do
  Company.create!(:companyname => "Relyon" ,:responsible_person => "rahul", :address => "Bangalore",:website => "www.mycompany.com",:dateofestablishment => "2010-10-30",:pf => true,:esi => true,:phonenumber1 => "080201256",:phonenumber2 => "080201256" ,:address2 => "My company address 2",:address3 => "My company address 3",:email => "mycomap@comp.com" )
  classification_heading = ClassificationHeading.create(classification_heading_name: "Designation", display_order: 1)
  classification=Classification.create(:classification_heading_id=> classification_heading.id, classification_name: "Developer")
end

Then /^User should redirect to employees report$/ do
  visit path_to("report")
end
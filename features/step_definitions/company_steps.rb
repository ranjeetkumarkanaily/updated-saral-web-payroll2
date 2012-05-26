Given /^a valid user$/ do
  User.create(:username => "admin", :password => "default")
end

Then /^User should have ([0-9]+) company$/ do |count|
  Company.count.should == count.to_i
end

Given /^User have company named Relyon$/ do
  Company.create!(:companyname => "Relyon" ,:responsible_person => "rahul", :address => "Bangalore",:website => "www.mycompany.com",:dateofestablishment => "2010-10-30",:pf => true,:esi => true,:phonenumber1 => "080201256",:phonenumber2 => "080201256" ,:address2 => "My company address 2",:address3 => "My company address 3",:email => "mycomap@comp.com" )
end

Given /^User have required data created$/ do
  UploadFileType.create(max_file_size: 800, file_type: "application/pdf,application/msword")
end

When /^User upload the doc file$/ do
  attach_file("company_document_file_path", File.join(Rails.root.to_s, 'spec', 'factories', 'docs.doc'))
end

Given /^User have docs\.doc uploaded under company Relyon$/ do
  UploadFileType.create(max_file_size: 800, file_type: "application/pdf,application/msword")
  company=Company.create(companyname: "JNK", responsible_person: "KP", address: "140", website: "www.relyon.com", dateofestablishment: "2012-03-10", pf: true, esi: true, phonenumber1: "", phonenumber2: "1234567890", address2: "1st street", address3: "Bangalore", email: "", pt: true, tds: true, :photo=> Rails.root.join("spec/factories/icon_a.png").open)
  CompanyDocument.create(remarks: "sdf", company_id: company.id, :file_path=> Rails.root.join("spec/factories/docs.doc").open)
end

Then /^User should get downloaded the file "(.*?)"$/ do |filename|
  page.response_headers['Content-Disposition'].should include("filename=\"#{filename}\"")
end

Then /^Company Document count should get decrement by (\d+)$/ do |arg1|
  CompanyDocument.count.should == arg1.to_i-1
end


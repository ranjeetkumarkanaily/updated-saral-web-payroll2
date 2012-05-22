Given /^User have PF Group Tamilnadu created$/ do
  PfGroup.create(:pf_group=> "Tamilnadu", :pf_number=> "1234", :db_file_code=> "", :extension=> 1, :address=> "Bangalore",:user_id=> "test", :password=> "test123")
end

Then /^PF Group "(.*?)" should be deleted$/ do |value|
  PfGroup.delete(value)
end

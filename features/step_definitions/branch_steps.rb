Given /^User have Branch Bangalore created$/ do
  Branch.create(:branch_name=> "Bangalore", :responsible_person=> "HSN", :address=> "Rajajinagara", :pf_group_id=> nil, :esi_group_id=> nil, :pt_group_id=> nil)
end

Then /^branch "(.*?)" should be deleted$/ do |value|
  Branch.delete(value)
end
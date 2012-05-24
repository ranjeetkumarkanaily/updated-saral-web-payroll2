Given /^User have ESI Group Karnakata created$/ do
  EsiGroup.create(:esi_group_name=> "Karnakata", :address=> "Bangalore", :esi_no=> 123, :esi_local_office=> "Bangalore", :user_id=> "test", :password=> "test123")
end

Then /^ESI Group "(.*?)" should be deleted$/ do |value|
   EsiGroup.delete(value)
end

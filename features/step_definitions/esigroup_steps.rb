Given /^User have ESI Group (.*?) created$/ do |state|
  EsiGroup.create(:esi_group_name=> state, :address=> "Bangalore", :esi_no=> 123, :esi_local_office=> "Bangalore", :user_id=> "test", :password=> "test123")
end

Then /^ESI Group "(.*?)" should be deleted$/ do |value|
   EsiGroup.delete(value)
end

Given /^User have ESI Group Rate (\d+) created under (.*?)$/ do |rate,esi_group|
  esi_grp = EsiGroup.create(:esi_group_name=> esi_group, :address=> "Bangalore", :esi_no=> 123, :esi_local_office=> "Bangalore", :user_id=> "test", :password=> "test123")
  EsiGroupRate.create(esi_group_id: esi_grp.id, employee_rate: rate, employer_rate: 2.0, cut_off: 3.0, minimum_limit_dailywage: 12.0, round_off: "Higher Rupee")
end

Then /^ESI Group Rate count decreased by (\d+)$/ do |arg1|
  EsiGroupRate.count.should == arg1.to_i-1
end


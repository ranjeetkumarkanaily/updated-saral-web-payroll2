Given /^Given valid state Karnakata created$/ do
  @state=State.create(:state_name=> "Karnakata")
  puts State.all.inspect
end

Given /^User have PT Group Karnakata created$/ do
  PtGroup.create(:name=> "Karnakata", :state_id=> @state.id, :certificate_no=>"123", pto_circle_no: "123456", address: "Bangalore", return_period: "Monthly")
end

Then /^PT Group "(.*?)" should be deleted$/ do |value|
  PtGroup.delete(value)
end
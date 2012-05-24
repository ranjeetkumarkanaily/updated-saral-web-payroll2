Given /^valid Financial institution State Bank Created$/ do
  @bank=FinancialInstitution.create(:name=> "State Bank", :address_line1=> "Bangalore", :address_line2=> "JP Nagara", :address_line3=> "1st Cross", :address_line4=> "1st main", pincode: 560040, :branch_code=> 2, :email=> "statebank@bangalore.com")
end

Then /^Financial Institution "(.*?)" should be deleted$/ do |value|
  FinancialInstitution.delete(value)
end
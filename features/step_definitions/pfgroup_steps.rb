Given /^User have PF Group (.*?) created$/ do |state|
  PfGroup.create(:pf_group=> state, :pf_number=> "1234", :db_file_code=> "", :extension=> 1, :address=> "Bangalore",:user_id=> "test", :password=> "test123")
end

Then /^PF Group "(.*?)" should be deleted$/ do |value|
  PfGroup.delete(value)
end

Given /^User have PF Group Rate (\d+) created under (.*?)$/ do |rate,state|
  month=Paymonth.create(:month_name => "Mar/2012")
  pf_grp=PfGroup.create(:pf_group => state, :pf_number=> "134", :db_file_code=> "23", :extension=> 2, :address=> "Bangalore",:user_id=> "test12", :password=> "test1423")
  PfGroupRate.create(pf_group_id: pf_grp.id, paymonth_id: month.id, account_number_21: 11.0, pension_fund: 10.0, epf: rate, account_number_02: 12.0, account_number_22: 12.0, round_off: "Higher Rupee", restrict_employer_share: false, restrict_employee_share_to_employer_share: false, employer_epf: -8.0, cutoff: 12.0, effective_date: "2012-02-01")
end

Given /^valid (.*?) month is created$/ do |month|
  Paymonth.create(:month_name => month)
end

Given /^User have Salary Group  Manager created$/ do
  SalaryGroup.create(:salary_group_name=> "Manager", :based_on_gross=> true)
end

Then /^Salary Group "(.*?)" should be deleted$/ do |value|
   SalaryGroup.delete(value)
end

Given /^User have salaryhead (.*?) created$/ do |sal_head|
  SalaryHead.create(head_name: sal_head, short_name: "BASIC", salary_type: "Earnings")
end

Given /^User have salary detail (.*?) created under Salary Group (.*?)$/ do |grp_detail,grp|
  sal_head=SalaryHead.create(head_name: grp_detail, short_name: "ESI", salary_type: "Deductions")
  sal_grp=SalaryGroup.create(:salary_group_name=> grp, :based_on_gross=> true)
  sal_grp_detail=SalaryGroupDetail.create(calc_type: "Lumpsum", calculation: "", based_on: "Pay Days", salary_group_id: sal_grp.id, salary_head_id: sal_head.id, pf_applicability: nil, pf_percentage: nil, print_name: nil, print_order: nil, esi_applicability: nil, esi_percentage: nil, pt_applicability: nil, pt_percentage: nil)
  bank=FinancialInstitution.create(:name=> "State Bank", :address_line1=> "Bangalore", :address_line2=> "JP Nagara", :address_line3=> "1st Cross", :address_line4=> "1st main", pincode: 560040, :branch_code=> 2, :email=> "statebank@bangalore.com")
end
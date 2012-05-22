Given /^Given valid state Karnakata for employee created$/ do
  @state=State.create(:state_name=> "Karnakata")
  puts State.all.inspect
end

Given /^User have Employee Shivarudraiah \.D created$/ do
  @employee=Employee.create(:empname=> "Shivarudraiah .D", :date_of_joining=> "2004-04-04", :date_of_leaving=> nil, :date_of_birth=> "1980-04-01", :marital_status=>"Single", father_name: "xyz", spouse_name: "", gender: "Male", present_res_no: "", present_res_name: "", present_street: "#411, 3rd main, 2nd stage, 9th", present_locality: "", present_city: "Bangalore", present_state_id: @state.id, perm_res_no: nil, perm_res_name: nil, perm_street: nil, perm_locality: nil, perm_city: nil, perm_state_id: nil, perm_sameas_present: nil, email: "shivugowda84@gmail.com", mobile: "919986928734", refno: "V2040402", designation_id: 30, department_id: 1, grade_id: 4, branch_id: 1, financial_institution_id: 1, bank_account_number: "08751050014908", restrct_pf: false, probation_period: nil, probation_complete_date: nil, confirmation_date: nil, salary_start_date: nil, retirement_date: nil, handicapped: nil, emergency_contact_number: nil, official_mail_id: nil, leaving_reason: nil)
end

Given /^valid Employee Statutory Details Created$/ do
  EmployeeStatutory.create(employee_id: @employee.id, pan: "aaaaa1234a", pan_effective_date: "2012-05-08", pf_number: "123", pf_effective_date: "2012-05-08", esi_number: "123", esi_effective_date: "2012-05-08", created_at: "2012-05-17 10:31:56", updated_at: "2012-05-17 10:31:56", zero_pt: false, zero_pension: false, vol_pf: false, vol_pf_percentage: nil, vol_pf_amount: nil)
end
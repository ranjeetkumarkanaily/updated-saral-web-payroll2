Then /^Leave details should increse by (\d+)$/ do |arg1|
  LeaveDetail.count.should == arg1.to_i
end

Given /^User have a leave detail created under employee (.*?)$/ do |employee|
  employee=Employee.create(:empname=> employee, :date_of_joining=> "2010-04-04", :date_of_leaving=> nil, :date_of_birth=> "1980-04-01", :marital_status=>"Single", father_name: "xyz", spouse_name: "", gender: "Male", present_res_no: "", present_res_name: "", present_street: "#411, 3rd main, 2nd stage, 9th", present_locality: "", present_city: "Bangalore", present_state_id: @state.id, perm_res_no: nil, perm_res_name: nil, perm_street: nil, perm_locality: nil, perm_city: nil, perm_state_id: nil, perm_sameas_present: nil, email: "shivugowda84@gmail.com", mobile: "919986928734", refno: "V2040402", designation_id: 30, department_id: 1, grade_id: 4, branch_id: 1, financial_institution_id: 1, bank_account_number: "08751050014908", restrct_pf: false, probation_period: nil, probation_complete_date: nil, confirmation_date: nil, salary_start_date: nil, retirement_date: nil, handicapped: nil, emergency_contact_number: nil, official_mail_id: nil, leaving_reason: nil)
  leave_def=LeaveDefinition.create(:leave_name=> "Casual holoiday", :short_name=> "CH")
  lev_det=LeaveDetail.create(employee_id: employee.id, leave_date: "2012-05-09", leave_definition_id: leave_def.id)
end

Then /^leave detail count should decreased by (\d+)$/ do |arg1|
  LeaveDetail.count.should == arg1.to_i-1
end

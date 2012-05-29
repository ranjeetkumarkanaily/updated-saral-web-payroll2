Given /^Salary rate for employee XYZ defined$/ do
  employee = FactoryGirl.create(:employee)
  salary_head = FactoryGirl.create(:salary_head)
  salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
  need_to_allot_Sal = FactoryGirl.create(:salary_allotment,:salary_allotment=>0,:employee_id=>employee.id,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
end

Given /^Salary rate alloted for employee Shivarudraiah defined$/ do
  paymonth=Paymonth.create!(:month_year=> 24145, :number_of_days=> 31, :from_date=> "2012-01-01", :to_date=> "2012-01-31", :month_name=> "jan/2012")
  employee=Employee.create(:empname=> "Shivarudraiah", :date_of_joining=> "2012-01-01", :date_of_leaving=> nil, :date_of_birth=> "1980-04-01", :marital_status=>"Single", father_name: "xyz", spouse_name: "", gender: "Male", present_res_no: "", present_res_name: "", present_street: "#411, 3rd main, 2nd stage, 9th", present_locality: "", present_city: "Bangalore", present_state_id: @state.id, perm_res_no: nil, perm_res_name: nil, perm_street: nil, perm_locality: nil, perm_city: nil, perm_state_id: nil, perm_sameas_present: nil, email: "shivugowda84@gmail.com", mobile: "919986928734", refno: "V2040402", designation_id: 30, department_id: 1, grade_id: 4, branch_id: 1, financial_institution_id: 1, bank_account_number: "08751050014908", restrct_pf: false, probation_period: nil, probation_complete_date: nil, confirmation_date: nil, salary_start_date: nil, retirement_date: nil, handicapped: nil, emergency_contact_number: nil, official_mail_id: nil, leaving_reason: nil)
  pf_grp=PfGroup.create(:pf_group=> "Karnataka", :pf_number=> "1234", :db_file_code=> "", :extension=> 1, :address=> "Bangalore",:user_id=> "test", :password=> "test123")
  esi_grp=EsiGroup.create(:esi_group_name=> "Karnataka", :address=> "Bangalore", :esi_no=> 123, :esi_local_office=> "Bangalore", :user_id=> "test", :password=> "test123")
  pt_grp=PtGroup.create(name: "Karnataka", state_id: @state.id, certificate_no: "12345", pto_circle_no: "123", address: "Bangalore", return_period: "Half Yearly")
  brnch=Branch.create(:branch_name=> "Bangalore", :responsible_person=> "HSN", :address=> "Rajajinagara", :pf_group_id=> pf_grp.id, :esi_group_id=> esi_grp.id, :pt_group_id=> pt_grp.id)
  attn_config=AttendanceConfiguration.create(:attendance=> "First Shift", short_name: "FS", salary_calendar_days: "Actual Days / Month")
  bank=FinancialInstitution.create(:name=> "State Bank", :address_line1=> "Bangalore", :address_line2=> "JP Nagara", :address_line3=> "1st Cross", :address_line4=> "1st main", pincode: 560040, :branch_code=> 2, :email=> "statebank@bangalore.com")
  sal_head=SalaryHead.create(:head_name=> "Allowance", :short_name=> "ALLOW", salary_type: "Earnings")
  sal_grp=SalaryGroup.create(:salary_group_name=> "Manager", :based_on_gross=> true)
  sal_grp_detail=SalaryGroupDetail.create(calc_type: "Lumpsum", calculation: "", based_on: "Pay Days", salary_group_id: sal_grp.id, salary_head_id: sal_head.id, pf_applicability: true, pf_percentage: 100, print_name: nil, print_order: nil, esi_applicability: true, esi_percentage: 100, pt_applicability: true, pt_percentage: 100, paymonth_id: paymonth.id)
  emp_detail=EmployeeDetail.create(employee_id: employee.id, effective_date: "2012-03-21", salary_group_id: sal_grp.id, allotted_gross: 10000,classification: { "Designation"=>"Developer"}, branch_id: brnch.id, financial_institution_id: bank.id, attendance_configuration_id: attn_config.id, bank_account_number: "", effective_to: nil, pan: "PAN Applied", pan_effective_date: nil, international_worker: nil)
  SalaryAllotment.create(employee_id: employee.id, employee_detail_id: emp_detail.id, effective_date: "2012-01-01", salary_head_id: sal_head.id, salary_allotment: 10000, salary_group_detail_id: sal_grp_detail.id)
end


Then /^User should redirect to salary allotment generate_sample_excel_template$/ do
  visit path_to("salary allotment sample excel")
end

Then /^User should redirect to salary allotment index page$/ do
  visit path_to("salary allotment index page")
end

When /^User clicks on the Listing Employee Salary not Allotted tab$/ do
  find('#sal_not_allotted', :text => 'Listing Employee (Salary not Allotted)').click
end

When /^User clicks on the Listing Employee Salary Allotted tab$/ do
  find('#sal_allotted', :text => 'Listing Employee (Salary Allotted)').click
end

When /^User upload the employees salary allotment excel file$/ do
  employee = FactoryGirl.create(:employee)
  basic = FactoryGirl.create(:salary_head)
  da = FactoryGirl.create(:salary_head, :head_name => "DA",  :short_name => "DA")
  hra = FactoryGirl.create(:salary_head, :head_name => "HRA",  :short_name => "HRA")
  sal_grp = FactoryGirl.create(:salary_group)
  paymonth = FactoryGirl.create(:paymonth)
  sal_grp_det1 = FactoryGirl.create(:salary_group_detail, :salary_group_id => sal_grp.id, :salary_head_id => basic.id)#, :paymonth_id => paymonth.id)
  sal_grp_det2 = FactoryGirl.create(:salary_group_detail, :salary_group_id => sal_grp.id, :salary_head_id => da.id)#, :paymonth_id => paymonth.id)
  sal_grp_det3 = FactoryGirl.create(:salary_group_detail, :salary_group_id => sal_grp.id, :salary_head_id => hra.id)#, :paymonth_id => paymonth.id)
  @attn_config = FactoryGirl.create(:attendance_configuration)
  fin_insti = FactoryGirl.create(:financial_institution)
  @branch = FactoryGirl.create(:branch)
  employee_detail = FactoryGirl.create(:employee_detail, :employee_id => employee.id, :salary_group_id => sal_grp.id, :financial_institution_id => fin_insti.id)
  SalaryAllotment.create(:employee_id => employee.id, :employee_detail_id => employee_detail.id, :effective_date => employee_detail.effective_date, :salary_head_id => sal_grp_det1.salary_head_id, :salary_group_detail_id => sal_grp_det1.id, :salary_allotment =>100)
  SalaryAllotment.create(:employee_id => employee.id, :employee_detail_id => employee_detail.id, :effective_date => employee_detail.effective_date, :salary_head_id => sal_grp_det2.salary_head_id, :salary_group_detail_id => sal_grp_det2.id, :salary_allotment =>100)
  SalaryAllotment.create(:employee_id => employee.id, :employee_detail_id => employee_detail.id, :effective_date => employee_detail.effective_date, :salary_head_id => sal_grp_det3.salary_head_id, :salary_group_detail_id => sal_grp_det3.id, :salary_allotment =>100)
  attach_file("excel_file", File.join(Rails.root.to_s, 'spec', 'factories', 'Template_Theoretical_Salary.xls'))
end

Then /^User should redirect to salary allotments page$/ do
  visit path_to("salary allotments path")
end

Given /^Salary rate for employee XYZ defined$/ do
  employee = FactoryGirl.create(:employee)
  salary_head = FactoryGirl.create(:salary_head)
  salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
  need_to_allot_Sal = FactoryGirl.create(:salary_allotment,:salary_allotment=>0,:employee_id=>employee.id,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
end

Given /^Salary rate alloted for employee XYZ defined$/ do
  employee = FactoryGirl.create(:employee)
  salary_head = FactoryGirl.create(:salary_head)
  salary_group_detail = FactoryGirl.create(:salary_group_detail,:salary_head_id=>salary_head.id)
  already_allot_Sal = FactoryGirl.create(:salary_allotment,:employee_id=>employee.id,:salary_group_detail_id=>salary_group_detail.id,:salary_head_id=>salary_head.id)
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

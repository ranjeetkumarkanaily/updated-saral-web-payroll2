def path_to(page_name)
  case page_name

    when /the login page/
      root_path
    when /company_list/
      companies_path
    when /the (.*?) classifications page/
      classification_id = ClassificationHeading.find_by_classification_heading_name($1).id
      classifications_path(:params1=>classification_id)
    when /the (.*?) hr categories page/
      hr_category_id=HrCategory.find_by_category_name($1).id
      hr_category_details_path(:param1 => hr_category_id)

    when /the (.*?) ESI Group page/
      esi_grp_id = EsiGroup.find_by_esi_group_name($1).id
      esi_group_rates_path(:params1 => esi_grp_id)
    when /the (.*?) ESI Group new page/
      esi_grp_id = EsiGroup.find_by_esi_group_name($1).id
      new_esi_group_rate_path(:params1 => esi_grp_id)

    when /the (.*?) ESI Group (\d+) ESIGroupRate edit page/
      esi_grp = EsiGroup.find_by_esi_group_name($1).id
      esi_grp_rate = EsiGroupRate.find_by_employee_rate($2)
      edit_esi_group_rate_path(esi_grp_rate,:params1 => esi_grp)



    when /the (.*?) PF Group rate page/
      pf_grp_id = PfGroup.find_by_pf_group($1).id
      pf_group_rates_path(:params1 => pf_grp_id)

    when /the (.*?) PF Group page/
      pf_grp_id = PfGroup.find_by_pf_group($1).id
      pf_group_rates_path(:params1 => pf_grp_id)


    when /the new PT Rate for (.*?) PT Group/
      pt_grp_id=PtGroup.find_by_name($1).id
      new_pt_group_rate_path(:pt_group_id => pt_grp_id)

    when /the PT Rates (.*?) details for (.*?) month/
      pt_grp_id=PtGroup.find_by_name($1).id
      paymonth_id=Paymonth.find_by_month_name($2).id
      pt_rates_path(:paymonth_id => paymonth_id, :pt_group_id => pt_grp_id)

    when /the PT Rates (.*?) page/
      pt_grp_id=PtGroup.find_by_name($1).id
      pt_rate=PtRate.find_by_pt_group_id(pt_grp_id)
      edit_pt_rate_path(pt_rate, :pt_group_id => pt_rate.pt_group_id)

    when /the (.*?) group salary page/
      sal_grp_id=SalaryGroup.find_by_salary_group_name($1).id
      salary_group_details_path(:param1=>sal_grp_id)

    when /the (.*?) group (.*?) salary detail show page/
      sal_grp_id=SalaryGroup.find_by_salary_group_name($1).id
      sal_head_id = SalaryHead.find_by_head_name($2).id
      sal_grp_detail = SalaryGroupDetail.find_by_salary_head_id(sal_head_id)
      salary_group_detail_path(sal_grp_detail,:param1=>sal_grp_id)

    when /the (.*?) group (.*?) salary detail/
      sal_grp_id = SalaryGroup.find_by_salary_group_name($1).id
      sal_head_id = SalaryHead.find_by_head_name($2).id
      sal_grp_detail = SalaryGroupDetail.find_by_salary_head_id(sal_head_id)
      edit_salary_group_detail_path(sal_grp_detail,:param1=>sal_grp_id)


    when /the employee (.*?) details page/
      employee_id=Employee.find_by_empname($1).id
      employee_details_path(:param1=>employee_id)

    when /the employee (.*?) details new page/
      employee_id=Employee.find_by_empname($1).id
      new_employee_detail_path(:param1 => employee_id)

    when /the employee (.*?) details edit page/
      employee_id=Employee.find_by_empname($1).id
      emp_detail=EmployeeDetail.find_by_employee_id(employee_id)
      edit_employee_detail_path(emp_detail,:param1 => employee_id)

    when /the (.*?) Statutory Details edit page/
      employee_id=Employee.find_by_empname($1)
      puts employee_id.employee_statutory.inspect
      edit_employee_statutory_path(:employee_id => employee_id.id)


    #when /company_new/
    # new_company_path
    #when /login/
    #  login_path
    # Add more page name => path mappings here

  else
    raise "Can't find mapping from \"#{page_name}\" to a path."
  end
end


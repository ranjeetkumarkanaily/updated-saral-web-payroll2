Feature: Web-SPP – Employee

  Background:
  Given a valid user
  And Given valid state Karnakata created
  When User go to the login page
  And User enters "Username" as "admin"
  And User enters "Password" as "default"
  And User clicks "Sign In" button
  And User follow "Master" link

#  Scenario: Creating an new Employee
#    When User follow "Employees" link
#    Then User should see the text "Listing Employees"
#    When User follow "Add New Employee" link
#    And User enters "employee_refno" as "test12345"
#    And User enters "dob" as "1986-03-05"
#    And User enters "dol" as "2020-12-12"
#    And User enters "employee_empname" as "ABC"
#    And User select "Karnakata" from "employee_present_state_id"
#    And User enters "doj" as "2012-03-06"
#    And User select "Without Reason" from "employee_leaving_reason"
#    And User enters "employee_official_mail_id" as "test@test.com"
#    And User enters "employee_email" as "test@company.com"
#    And User enters "employee_emergency_contact_number" as "100"
#    And User clicks "Create Employee" button
#    Then User should see the text "ABC"
#
#  Scenario: Viewing Employee Detail
#   Given User have Employee Shivarudraiah created
#    When User follow "Employees" link
#    And User should see the text "Operations"
#    And User follow "Show" link
#    Then User should see the text "Shivarudraiah"
#
#  Scenario: Adding statutory Details
#    Given User have Employee Shivarudraiah created
#    When User follow "Employees" link
#    And User follow "Show" link
#    And User follow "Statutory Details" link
#    Then User should see the text "New Employee Statutory"
#    And User select "ADD PAN" from "panoption"
#    And User enters "employee_statutory_pan" as "aaaaa1234a"
#    And User enters "employee_statutory_pf_number" as "1234"
#    And User enters "employee_statutory_esi_number" as "123456"
#    And User uncheck "employee_statutory_zero_pt"
#    And User enters "pan_ed" as "2012-05-12"
#    And User enters "pf_ed" as "2012-04-12"
#    And User enters "esi_ed" as "2012-04-12"
#    And User uncheck "employee_statutory_zero_pension"
#    And User uncheck "employee_statutory_vol_pf"
#    And User clicks "Create Employee statutory" button
#    Then User should see the text "Employee statutory was successfully created."

#  Scenario: Editing Employee statutory Details
#    Given Employee Statutory Details with esi eff. date 2012-04-12 under employee Shivarudraiah created
#    When User follow "Employees" link
#    And User follow "Show" link
#    Then User should see the text "Edit Employee Statutory Details"
#    And User follow "Statutory Details" link
#    When User go to the Shivarudraiah Statutory Details edit page
#
#    And User follow "Statutory Details" link
#   When User go to the Shivarudraiah Statutory Details edit page
#    Then User should see the text "Statutory Details"
#    And User should see the text "Employee Statutory Details"
#    Then User should see the text "Editing Employee Statutory"
#    And User select "ADD PAN" from "panoption"
#    And User enters "employee_statutory_pan" as "aaaaa1734a"
#    And User enters "employee_statutory_pf_number" as "134"
#    And User enters "employee_statutory_esi_number" as "123456"
#    And User uncheck "employee_statutory_zero_pt"
#    And User enters "pan_ed" as "2012-05-12"
#    And User enters "pf_ed" as "2012-04-12"
#    And User enters "esi_ed" as "2012-04-12"
#    And User uncheck "employee_statutory_zero_pension"
#    And User uncheck "employee_statutory_vol_pf"
#    And User clicks "Create Employee statutory" button
#    Then User should see the text "Employee statutory was successfully updated."


#  Scenario: Editing Employee Detail
#    Given User have Employee Shivarudraiah created
#    When User follow "Employees" link
#    And User follow "Edit" link
#    And User enters "employee_refno" as "test12345"
#    And User enters "dob" as "1987-03-05"
#    And User enters "dol" as "2020-12-12"
#    And User enters "employee_empname" as "ABC"
#    And User select "Karnakata" from "employee_present_state_id"
#    And User enters "doj" as "2012-03-06"
#    And User select "Without Reason" from "employee_leaving_reason"
#    And User enters "employee_official_mail_id" as "test123@test.com"
#    And User enters "employee_email" as "test@company.com"
#    And User enters "employee_emergency_contact_number" as "100"
#    And User clicks "Update Employee" button
#    Then User should see the text "Employee was successfully updated."
#
#  Scenario: Deleting an Employee
#   Given User have Employee Shivarudraiah created
#    When User follow "Employees" link
#    And User follow "Delete" link
#    Then Salary Head "Shivarudraiah .D" should be deleted
#    And User should not see "Shivarudraiah .D"
#
#  Scenario: Adding New Details for Employee Details
#    Given User have Employee Shivarudraiah created
#    And User have required details created
#    When User follow "Employees" link
#    And User follow "Details" link
#    When User go to the employee Shivarudraiah details page
#    And User follow "Add New Detail" link
#    When User go to the employee Shivarudraiah details new page
#    And User enters "sed" as "2012-04-02"
#    And User select "Manager" from "employee_detail_salary_group_id"
#    And User select "Bangalore" from "employee_detail_branch_id"
#    And User select "State Bank" from "employee_detail_financial_institution_id"
#    And User uncheck "employee_detail_international_worker"
#    And User enters "employee_detail_allotted_gross" as "2000"
#    And User select "First Shift" from "employee_detail_attendance_configuration_id"
#    And User enters "employee_detail_bank_account_number" as "123456789"
#    And User select "Developer" from "employee_detail_classification_Designation"
#    And User clicks "Create Employee detail" button
#    Then User should see the text "Employee detail was successfully created."
#
#  Scenario: Editing Employee details for Employee
#    Given employee detail salary group Manager created under employee Shivarudraiah
#    When User follow "Employees" link
#    And User follow "Details" link
#    When User go to the employee Shivarudraiah details page
#    And User follow "Edit" link
#    When User go to the employee Shivarudraiah details edit page
#    And User enters "sed" as "2012-05-02"
#    And User select "Manager" from "employee_detail_salary_group_id"
#    And User select "Bangalore" from "employee_detail_branch_id"
#    And User select "State Bank" from "employee_detail_financial_institution_id"
#    And User uncheck "employee_detail_international_worker"
#    And User enters "employee_detail_allotted_gross" as "2000"
#    And User select "First Shift" from "employee_detail_attendance_configuration_id"
#    And User enters "employee_detail_bank_account_number" as "123456789"
#    And User select "Developer" from "employee_detail_classification_Designation"
#    And User clicks "Update Employee detail" button
#    Then User should see the text "Employee detail was successfully updated."
#
#  Scenario: Deleting Employee details for Employee
#    Given employee detail salary group Manager created under employee Shivarudraiah
#    When User follow "Employees" link
#    And User follow "Details" link
#    When User go to the employee Shivarudraiah details page
#    And User follow "Delete" link
#    Then User should see the text "Employee detail was successfully Destroyed."

#  Scenario: Restrict employee PF contribution
#    Given User have Employee Shivarudraiah created
#    When User follow "Employees" link
#    And User follow "Restrict PF Contribution" link
#    And User check "employee_data__pf"
#    And User clicks "Save Changes" button
#    Then User should see the text "true"

  Scenario: Employees excel upload
    When User follow "Employees" link
    And User follow "Excel Upload" link
    And User upload the employees excel file




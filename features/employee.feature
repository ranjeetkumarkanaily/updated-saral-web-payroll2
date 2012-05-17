Feature: Web-SPP – Employee

Background:
Given a valid user
And Given valid state Karnakata for employee created
And User have Employee Shivarudraiah .D created
When User go to the login page
Then User should see the text "Sign In"
And User enters "Username" as "admin"
And User enters "Password" as "default"
And User clicks "Sign In" button
Then User should see the text "Home"
When User follow "Master" link
Then User should see the text "Employees"

Scenario: Creating an new Employee
When User follow "Employees" link
Then User should see the text "Listing Employees"
And User should see the text "Add New Employee"
When User follow "Add New Employee" link
Then User should see the text "New Employee"
And User enters "employee_refno" as "test12345"
And User enters "dob" as "1986-03-05"
And User enters "dol" as "2020-12-12"
And User enters "employee_empname" as "ABC"
And User select "Karnakata" from "employee_present_state_id"
And User enters "doj" as "2012-03-06"
And User select "Without Reason" from "employee_leaving_reason"
And User enters "employee_official_mail_id" as "test@test.com"
And User enters "employee_email" as "test@company.com"
And User enters "employee_emergency_contact_number" as "100"
And User clicks "Create Employee" button
Then User should see the text "ABC"

Scenario: Viewing Employee Detail
When User follow "Employees" link
Then User should see the text "Listing Employees"
And User should see the text "Operations"
When User follow "Show" link
Then User should see the text "Shivarudraiah .D"

Scenario: Adding statutory Details
When User follow "Employees" link
Then User should see the text "Listing Employees"
And User should see the text "Operations"
When User follow "Show" link
Then User should see the text "Statutory Details"
When User follow "Statutory Details" link
Then User should see the text "New Employee Statutory"
And User select "ADD PAN" from "panoption"
And User enters "employee_statutory_pan" as "aaaaa1234a"
And User enters "employee_statutory_pf_number" as "1234"
And User enters "employee_statutory_esi_number" as "123456"
And User uncheck "employee_statutory_zero_pt"
And User enters "pan_ed" as "2012-05-12"
And User enters "pf_ed" as "2012-04-12"
And User enters "esi_ed" as "2012-04-12"
And User uncheck "employee_statutory_zero_pension"
And User uncheck "employee_statutory_vol_pf"
And User clicks "Create Employee statutory" button
Then User should see the text "Employee statutory was successfully created."

# Scenario: Editing Employee statutory Details
# Given valid Employee Statutory Details Created
# When User follow "Employees" link
# Then User should see the text "Listing Employees"
# And User should see the text "Operations"
# When User follow "Show" link
# Then User should see the text "Statutory Details"
# And User should see the text "Employee Statutory Details"
# When User follow "Edit" link
# Then User should see the text "Editing Employee Statutory"
# And User select "ADD PAN" from "panoption"
# And User enters "employee_statutory_pan" as "aaaaa1734a"
# And User enters "employee_statutory_pf_number" as "134"
# And User enters "employee_statutory_esi_number" as "123456"
# And User uncheck "employee_statutory_zero_pt"
# And User enters "pan_ed" as "2012-05-12"
# And User enters "pf_ed" as "2012-04-12"
# And User enters "esi_ed" as "2012-04-12"
# And User uncheck "employee_statutory_zero_pension"
# And User uncheck "employee_statutory_vol_pf"
# And User clicks "Create Employee statutory" button
# Then User should see the text "Employee statutory was successfully updated."


Scenario: Editing Employee Detail
When User follow "Employees" link
Then User should see the text "Listing Employees"
And User should see the text "Operations"
When User follow "Edit" link
Then User should see the text "Editing Employee"
And User enters "employee_refno" as "test12345"
And User enters "dob" as "1987-03-05"
And User enters "dol" as "2020-12-12"
And User enters "employee_empname" as "ABC"
And User select "Karnakata" from "employee_present_state_id"
And User enters "doj" as "2012-03-06"
And User select "Without Reason" from "employee_leaving_reason"
And User enters "employee_official_mail_id" as "test123@test.com"
And User enters "employee_email" as "test@company.com"
And User enters "employee_emergency_contact_number" as "100"
And User clicks "Update Employee" button
Then User should see the text "Employee was successfully updated."

Scenario: Deleting an Employee
When User follow "Employees" link
Then User should see the text "Listing Employees"
And User should see the text "Operations"
When User follow "Delete" link
Then Salary Head "Shivarudraiah .D" should be deleted
And User should not see "Shivarudraiah .D"

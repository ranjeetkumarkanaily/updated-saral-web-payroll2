Feature: Web-SPP – Salary Group

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Master" link

  Scenario: Creating an new Salary Group
    When User follow "Salary Group" link
    And User follow "Add New Salary Group" link
    And User enters "salary_group_salary_group_name" as "WDO"
    And User check "salary_group_based_on_gross"
    And User clicks "Create Salary group" button
    Then salary group count should get increased by 1

  Scenario: Editing Salary Head Group
    Given User have Salary Group  Manager created
    When User follow "Salary Group" link
    And User follow "Edit" link
    And User enters "salary_group_salary_group_name" as "WDO"
    And User uncheck "salary_group_based_on_gross"
    And User clicks "Update Salary group" button
    Then User should see the text "No"

  Scenario: Deleting an Salary Group
   Given User have Salary Group  Manager created
    When User follow "Salary Group" link
    And User follow "Delete" link
    Then Salary Group "Manager" should be deleted
    And User should not see "Manager"

  Scenario: Viewing the salary group details
    Given User have salary detail ESI created under Salary Group Manager
    When User follow "Salary Group" link
    And User follow "Settings" link
    When User go to the Manager group salary page
    And User follow "Show" link
    When User go to the Manager group ESI salary detail show page
    Then User should see the text "ESI"

  Scenario: Defining the Salary Group Detail
    Given User have Salary Group  Manager created
    And User have salaryhead Basic created
    When User follow "Salary Group" link
    And User follow "Settings" link
    When User go to the Manager group salary page
    And User follow "Add New Configuration" link
    And User select "Basic" from "salary_group_detail_salary_head_id"
    And User enters "salary_group_detail_print_order" as "2"
    And User select "Pay Days" from "salary_group_detail_based_on"
    And User uncheck "salary_group_detail_pf_applicability"
    And User uncheck "salary_group_detail_pt_applicability"
    And User select "Lumpsum" from "salary_group_detail_calc_type"
    And User uncheck "salary_group_detail_esi_applicability"
    And User clicks "Create Salary group detail" button
    Then User should see the text "Salary group detail was successfully created."

#  Scenario: Editing the salary group detail
#    Given User have salary detail ESI created under Salary Group Manager
#    When User follow "Salary Group" link
#    And User follow "Settings" link
#    When User go to the Manager group salary page
#    And User follow "Edit" link
#    When User go to the Manager group ESI salary detail
#    And User select "ESI" from "salary_group_detail_salary_head_id"
#    And User enters "salary_group_detail_print_name" as "Basic"
#    And User enters "salary_group_detail_print_order" as "2"
#    And User select "Pay Days" from "salary_group_detail_based_on"
#    And User uncheck "salary_group_detail_pf_applicability"
#    And User uncheck "salary_group_detail_pt_applicability"
#    And User enters "salary_group_detail_effective_month" as "2012-01-01"
#    And User select "Lumpsum" from "salary_group_detail_calc_type"
#    And User uncheck "salary_group_detail_esi_applicability"
#    And User clicks "Update Salary group detail" button
#    Then User should see the text "Salary group detail was successfully updated."

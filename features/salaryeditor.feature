Feature: Web-SPP – Salary Editor

  Background:
    Given a valid user
    And Given valid state Karnakata created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Salary" link

  Scenario: Generate the salary for employee
    Given User have Employee Shivarudraiah created
    And User have paymonth jan/2012 created
    And user have required details created
    And User follow "Salary Editor" link
    And User select "Shivarudraiah" from "employee_id"
    And User select "jan/2012" from "month_year"
    And User clicks "Get Salary" button

#  Scenario: Viewing PF Group details
#    Given User have PF Group Rate 12 created under Kerala
#    When User follow "PF Group" link
#    And User follow "Details" link
#    When User go to the Kerala PF Group rate page
#    Then User should see the text "12"
#
#  Scenario: Adding new pf rate rate for PF Group
#    Given User have PF Group Tamilnadu created
#    And valid Feb/2012 month is created
#    When User follow "PF Group" link
#    And User follow "Details" link
#    When User go to the Tamilnadu PF Group page
#    And User follow "Add New PF Group Rate" link
#    And User select "Feb/2012" from "pf_group_rate_paymonth_id"
#    And User enters "pf_group_rate_epf" as "12"
#    And User enters "pf_group_rate_cutoff" as "1.23"
#    And User enters "pf_group_rate_account_number_22" as "12  "
#    And User enters "pf_group_rate_account_number_21" as "1.2"
#    And User enters "pf_group_rate_account_number_02" as "12"
#    And User enters "pf_group_rate_pension_fund" as "1.2"
#    And User select "Higher Rupee" from "pf_group_rate_round_off"
#    And User uncheck "pf_group_rate_restrict_employer_share"
#    And User uncheck "pf_group_rate_restrict_employee_share_to_employer_share"
#    And User clicks "Create Pf group rate" button
#    Then User should see the text "Pf group rate was successfully created."
#
#  Scenario: Editing PF Group rate details
#    Given User have PF Group Rate 12 created under Kerala
#    When User follow "PF Group" link
#    And User follow "Details" link
#    When User go to the Kerala PF Group rate page
#    And User follow "Edit" link
#    And User enters "pf_group_rate_epf" as "12"
#    And User enters "pf_group_rate_cutoff" as "1.23"
#    And User enters "pf_group_rate_account_number_22" as "12  "
#    And User enters "pf_group_rate_account_number_21" as "1.2"
#    And User enters "pf_group_rate_account_number_02" as "12"
#    And User enters "pf_group_rate_pension_fund" as "1.2"
#    And User select "Higher Rupee" from "pf_group_rate_round_off"
#    And User uncheck "pf_group_rate_restrict_employer_share"
#    And User uncheck "pf_group_rate_restrict_employee_share_to_employer_share"
#    And User clicks "Update Pf group rate" button
#    Then User should see the text "Pf group rate was successfully updated."
#
#  Scenario: Deleting PF Group Rate details
#    Given User have PF Group Rate 12 created under Kerala
#    When User follow "PF Group" link
#    And User follow "Details" link
#    When User go to the Kerala PF Group rate page
#    And follow "Delete" link
#    Then User should see the text "Pf group rate was successfully Destroyed."
#
#
#  Scenario: Creating an new PF Group
#    When User follow "PF Group" link
#    And User follow "Add New PF Group" link
#    And User enters "pf_group_pf_group" as "Karnataka"
#    And User enters "pf_group_db_file_code" as "123"
#    And User enters "pf_group_address" as "Bangalore"
#    And User enters "pf_group_pf_number" as "54327"
#    And User enters "pf_group_extension" as "1"
#    And User enters "pf_group_user_id" as "test"
#    And User enters "pf_group_password" as "123456"
#    And User clicks "Create Pf group" button
#    Then User should see the text "Karnataka"
#
#  Scenario: Editing  PF Group
#    When User follow "PF Group" link
#    And User follow "Edit" link
#    And User enters "pf_group_pf_group" as "Karnataka"
#    And User enters "pf_group_db_file_code" as "1234"
#    And User enters "pf_group_address" as "Bangalore"
#    And User enters "pf_group_pf_number" as "54327"
#    And User enters "pf_group_extension" as "1"
#    And User enters "pf_group_user_id" as "test"
#    And User enters "pf_group_password" as "123456"
#    And User clicks "Update Pf group" button
#    Then User should see the text "1234"
#
#  Scenario: Deleting an PF Group
#    When User follow "PF Group" link
#    And User should see the text "Operations"
#    When User follow "Delete" link
#    Then PF Group "Tamilnadu" should be deleted
#    And User should not see "Tamilnadu"

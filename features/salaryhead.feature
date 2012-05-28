Feature: Web-SPP – Salary Head

  Background:
    Given a valid user
    And User have Salary Head  Allowance created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Master" link

  Scenario: Creating an new Salary Head
    When User follow "Salary Head" link
    And User follow "Add New Salary Head" link
    And User enters "salary_head_head_name" as "Basic"
    And User enters "salary_head_short_name" as "BASIC"
    And User select "Earnings" from "salary_head_salary_type"
    And User clicks "Create Salary head" button
    Then User should see the text "Basic"

  Scenario: Editing Salary Head Detail
    When User follow "Salary Head" link
    And User follow "Edit" link
    And User enters "salary_head_head_name" as "Basic"
    And User enters "salary_head_short_name" as "BAS"
    And User select "Earnings" from "salary_head_salary_type"
    And User clicks "Update Salary head" button
    Then User should see the text "BAS"

  Scenario: Deleting an Salary Head
    When User follow "Salary Head" link
    And User follow "Delete" link
    Then Salary Head "Allowance" should be deleted
    And User should not see "Allowance"
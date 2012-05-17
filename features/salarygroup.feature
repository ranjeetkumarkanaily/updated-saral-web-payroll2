Feature: Web-SPP – Salary Group

  Background:
    Given a valid user
    And User have Salary Group  Manager created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "Salary Group"

  Scenario: Creating an new Salary Group
    When User follow "Salary Group" link
    Then User should see the text "Listing Salary Group"
    And User should see the text "Add New Salary Group"
    When User follow "Add New Salary Group" link
    Then User should see the text "New Salary Group"
    And User enters "salary_group_salary_group_name" as "WDO"
    And User check "salary_group_based_on_gross"
    And User clicks "Create Salary group" button
    Then User should see the text "WDO"

  Scenario: Editing Salary Head Group
    When User follow "Salary Group" link
    Then User should see the text "Listing Salary Group"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing Salary Group"
    And User enters "salary_group_salary_group_name" as "WDO"
        And User uncheck "salary_group_based_on_gross"
    And User clicks "Update Salary group" button
    Then User should see the text "No"

  Scenario: Deleting an Salary Group
    When User follow "Salary Group" link
    Then User should see the text "Listing Salary Group"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then Salary Group "Manager" should be deleted
    And User should not see "Manager"
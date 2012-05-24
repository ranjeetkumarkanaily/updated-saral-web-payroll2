Feature: Web-SPP – Branches

  Background:
    Given a valid user
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "Branch"


  Scenario: Creating an new Branch
    When User follow "Branch" link
    Then User should see the text "Listing Branches"
    And User should see the text "Add New Branch"
    When User follow "Add New Branch" link
    Then User should see the text "New Branch"
    And User enters "branch_branch_name" as "Bangalore"
    And User enters "branch_address" as "Rajajinagara"
    And User enters "branch_responsible_person" as "HSN"
    And User clicks "Create Branch" button
    Then User should see the text "Branch was successfully created."
    Then User should see the text "Rajajinagara"

  Scenario: Editing Branch Details
    Given User have Branch Bangalore created
    When User follow "Branch" link
    Then User should see the text "Listing Branches"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing Branch"
    And User enters "branch_branch_name" as "Bangalore"
    And User enters "branch_address" as "Vijayanagara"
    And User enters "branch_responsible_person" as "HSN"
    And User clicks "Update Branch" button
    Then User should see the text "Branch was successfully updated."

  Scenario: Deleting an Branch
    Given User have Branch Bangalore created
    When User follow "Branch" link
    Then User should see the text "Listing Branches"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then branch "Bangalore" should be deleted
    And User should not see "Bangalore"

  Scenario: Viewing Branch Details
    Given User have Branch Bangalore created
    When User follow "Branch" link
    Then User should see the text "Listing Branches"
    And User should see the text "Operations"
    When User follow "Show" link
    Then User should see the text "Showing Branch"
    And User should see paymonth "Bangalore" details
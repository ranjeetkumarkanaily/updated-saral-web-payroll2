Feature: Web-SPP – Branches

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Master" link

  Scenario: Creating an new Branch
    When User follow "Branch" link
    And User follow "Add New Branch" link
    And User enters "branch_branch_name" as "Bangalore"
    And User enters "branch_address" as "Rajajinagara"
    And User enters "branch_responsible_person" as "HSN"
    And User clicks "Create Branch" button
    Then User should see the text "Branch was successfully created."

  Scenario: Editing Branch Details
    Given User have Branch Bangalore created
    When User follow "Branch" link
    And User follow "Edit" link
    Then User should see the text "Editing Branch"
    And User enters "branch_branch_name" as "Bangalore"
    And User enters "branch_address" as "Vijayanagara"
    And User enters "branch_responsible_person" as "HSN"
    And User clicks "Update Branch" button
    Then User should see the text "Branch was successfully updated."

  Scenario: Deleting an Branch
    Given User have Branch Bangalore created
    When User follow "Branch" link
    And User follow "Delete" link
    Then branch "Bangalore" should be deleted
    And User should not see "Bangalore"

  Scenario: Viewing Branch Details
    Given User have Branch Bangalore created
    When User follow "Branch" link
    And User follow "Show" link
    Then User should see the text "Bangalore"

  Scenario: Assign PF Group for Branch
    Given User have Branch Bangalore created
    And User have PF Group Karnataka created
    When User follow "Branch" link
    And User follow "Show" link
    And User follow "Assign PF Group" link
    And User select "Karnataka" from "pf_detail_pf_group_id"
    And User enters "pf_effective_date" as "2012-05-25"
    And User clicks "Save" button
    Then User should see the text "Karnataka"

  Scenario: Assign ESI Group for Branch
    Given User have Branch Bangalore created
    And User have ESI Group Karnataka created
    When User follow "Branch" link
    And User follow "Show" link
    And User follow "Assign ESI Group" link
    And User select "Karnataka" from "esi_detail_esi_group_id"
    And User enters "esi_effective_date" as "2012-05-25"
    And User clicks "Save" button
    Then User should see the text "Karnataka"

  Scenario: Assign PT Group for Branch
    Given User have Branch Bangalore created
    And Given valid state Karnakata created
    And User have PT Group Karnataka created
    When User follow "Branch" link
    And User follow "Show" link
    And User follow "Assign PT Group" link
    And User select "Karnataka" from "pt_detail_pt_group_id"
    And User enters "pt_effective_date" as "2012-05-25"
    And User clicks "Save" button
    Then User should see the text "Karnataka"

  Scenario: Editing Assigned PF Group for branch
    Given Branch Bangalore created under PF Group Karnataka
    When User follow "Branch" link
    And User follow "Show" link
    And User follow "Change PF Group" link
    And User follow "Edit" link
    And User enters "pf_effective_date" as "2012-05-24"
    And User clicks "Save" button
    Then User should see the text "2012-05-24"

  Scenario: Editing Assigned PF Group for branch
    Given Branch Bangalore created under ESI Group Karnataka
    When User follow "Branch" link
    And User follow "Show" link
    And User follow "Change ESI Group" link
    And User follow "Edit" link
    And User enters "esi_effective_date" as "2012-05-24"
    And User clicks "Save" button
    Then User should see the text "2012-05-24"

  Scenario: Editing Assigned PT Group for branch
    Given Branch Bangalore created under PT Group Karnataka
    When User follow "Branch" link
    And User follow "Show" link
    And User follow "Change PT Group" link
    And User follow "Edit" link
    And User enters "pt_effective_date" as "2012-05-24"
    And User clicks "Save" button
    Then User should see the text "2012-05-24"
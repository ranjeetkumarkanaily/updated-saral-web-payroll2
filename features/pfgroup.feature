Feature: Web-SPP – PF Group

  Background:
    Given a valid user
    And User have PF Group Tamilnadu created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "PF Group"


  Scenario: Creating an new PF Group
    When User follow "PF Group" link
    Then User should see the text "Listing PF Groups"
    And User should see the text "Add New PF Group"
    When User follow "Add New PF Group" link
    Then User should see the text "New PF Group"
    And User enters "pf_group_pf_group" as "Karnataka"
    And User enters "pf_group_db_file_code" as "123"
    And User enters "pf_group_address" as "Bangalore"
    And User enters "pf_group_pf_number" as "54327"
    And User enters "pf_group_extension" as "1"
    And User enters "pf_group_user_id" as "test"
    And User enters "pf_group_password" as "123456"
    And User clicks "Create Pf group" button
    Then User should see the text "Karnataka"

  Scenario: Editing  PF Group
    When User follow "PF Group" link
    Then User should see the text "Listing PF Groups"
    And User should see the text "Operations"
    When User follow "Edit" link
    And User enters "pf_group_pf_group" as "Karnataka"
    And User enters "pf_group_db_file_code" as "1234"
    And User enters "pf_group_address" as "Bangalore"
    And User enters "pf_group_pf_number" as "54327"
    And User enters "pf_group_extension" as "1"
    And User enters "pf_group_user_id" as "test"
    And User enters "pf_group_password" as "123456"
    And User clicks "Update Pf group" button
    Then User should see the text "1234"

  Scenario: Deleting an PF Group
    When User follow "PF Group" link
    Then User should see the text "Listing PF Groups"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then PF Group "Tamilnadu" should be deleted
    And User should not see "Tamilnadu"

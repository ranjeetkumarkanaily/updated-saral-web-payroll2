Feature: Web-SPP – ESI Group

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Master" link

  Scenario: Creating an new ESI Group
    When User follow "ESI Group" link
    And User follow "Add New ESI Group" link
    And User enters "esi_group_esi_group_name" as "Karnataka"
    And User enters "esi_group_address" as "Bangalore"
    And User enters "esi_group_esi_no" as "123"
    And User enters "esi_group_esi_local_office" as "Bangalore"
    And User enters "esi_group_user_id" as "test"
    And User enters "esi_group_password" as "test123"
    And User clicks "Save ESI Group" button
    Then ESI group count should get increased by 1

  Scenario: Editing ESI Group
    Given User have ESI Group Karnakata created
    When User follow "ESI Group" link
    Then User should see the text "Listing ESI Groups"
    And User should see the text "Operations"
    When User follow "Edit" link
    And User enters "esi_group_esi_group_name" as "Karnataka"
    And User enters "esi_group_address" as "Mysore"
    And User enters "esi_group_esi_no" as "123"
    And User enters "esi_group_esi_local_office" as "Bangalore"
    And User enters "esi_group_user_id" as "test"
    And User enters "esi_group_password" as "test123"
    And User clicks "Save ESI Group" button
    Then User should see the text "Mysore"

  Scenario: Viewing ESI Group Details
    Given User have ESI Group Rate 12 created under Tamilnadu
    And User follow "ESI Group" link
    And User follow "Details" link
    When User go to the Tamilnadu ESI Group page
    Then User should see the text "12"

  Scenario: Adding new ESI Group Rate
    Given User have ESI Group jammu created
    When User follow "ESI Group" link
    And User follow "Details" link
    When User go to the jammu ESI Group new page
    And User enters "esi_group_rate_employee_rate" as "12"
    And User enters "esi_group_rate_cut_off" as "4"
    And User enters "esi_group_rate_minimum_limit_dailywage" as "12"
    And User enters "esi_group_rate_employer_rate" as "5"
    And User select "Higher Rupee" from "esi_group_rate_round_off"
    And User clicks "Create Esi group rate" button
    Then User should see the text "Esi group rate was successfully created."

  Scenario: Editing ESI Group Rate
    Given User have ESI Group Rate 12 created under Tamilnadu
    When User follow "ESI Group" link
    And User follow "Details" link
    And User follow "Edit" link
    When User go to the Tamilnadu ESI Group 12 ESIGroupRate edit page
    And User enters "esi_group_rate_employee_rate" as "11"
    And User enters "esi_group_rate_cut_off" as "4"
    And User enters "esi_group_rate_minimum_limit_dailywage" as "12"
    And User enters "esi_group_rate_employer_rate" as "5"
    And User select "Higher Rupee" from "esi_group_rate_round_off"
    And User clicks "Update Esi group rate" button
    Then User should see the text "Esi group rate was successfully updated."

  Scenario: Editing ESI Group Rate
    Given User have ESI Group Rate 12 created under Tamilnadu
    When User follow "ESI Group" link
    And User follow "Details" link
    And User follow "Delete" link
    Then ESI Group Rate count decreased by 1

  Scenario: Deleting an ESI Group
    Given User have ESI Group Karnakata created
    When User follow "ESI Group" link
    When User follow "Delete" link
    Then ESI Group "Karnataka" should be deleted
    And User should not see "Karnakata"
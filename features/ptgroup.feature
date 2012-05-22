Feature: Web-SPP – PT Group

  Background:
    Given a valid user
    And Given valid state Karnakata created
    And User have PT Group Karnakata created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "PT Group"


  Scenario: Creating an new PT Group
    When User follow "PT Group" link
    Then User should see the text "Listing PT Groups"
    And User should see the text "Add New PT Group"
    When User follow "Add New PT Group" link
    Then User should see the text "New PT Group"
    And User enters "pt_group_name" as "Karnataka"
    And User select "Karnakata" from "pt_group_state_id"
    And User enters "pt_group_address" as "Bangalore"
    And User enters "pt_group_certificate_no" as "123"
    And User enters "pt_group_pto_circle_no" as "123456"
    And User select "Monthly" from "pt_group_return_period"
    And User clicks "Save PT Group" button
    Then User should see the text "Karnakata"

  Scenario: Editing PT Group Detail
    Given User have PT Group Karnakata created
    When User follow "PT Group" link
    Then User should see the text "Listing PT Groups"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing PT Group"
    And User enters "pt_group_name" as "Karnataka"
    And User enters "pt_group_address" as "Mysore"
    And User enters "pt_group_certificate_no" as "123"
    And User enters "pt_group_pto_circle_no" as "123456"
    And User select "Monthly" from "pt_group_return_period"
    And User clicks "Save PT Group" button
    Then User should see the text "Showing test 's Rate"
    Then User should see the text "Add New PT Rate"

#    Scenario: Creating new PT rate
#    When User follow "Add New PT Rate" link

  Scenario: Deleting an PT Group
    When User follow "PT Group" link
    Then User should see the text "Listing PT Groups"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then PT Group "Family Details" should be deleted
    And User should not see "Karnakata"

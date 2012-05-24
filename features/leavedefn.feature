Feature: Web-SPP – Leave Definition

  Background:
    Given a valid user
    And a valid leave definition Compensatory Work Created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Leave" link
    Then User should see the text "Leave Definitions"


  Scenario: Creating an new Leave Definition
    When User follow "Leave Definitions" link
    Then User should see the text "Listing Leave Definitions"
    And User should see the text "Add New Leave definition"
    When User follow "Add New Leave definition" link
    Then User should see the text "New leave_definition"
    And User enters "leave_definition_leave_name" as "Loss Of Pay"
    And User enters "leave_definition_short_name" as "LP"
    And User clicks "Create Leave definition" button
    Then User should see the text "Leave definition was successfully created."
    And User should see the text "Loss Of Pay"

  Scenario: Editing Leave Definition Detail
    When User follow "Leave Definitions" link
    Then User should see the text "Listing Leave Definitions"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing Leave Definition"
    And User enters "leave_definition_leave_name" as "Compensatory Work"
    And User enters "leave_definition_short_name" as "CO"
    And User clicks "Update Leave definition" button
    Then User should see the text "Leave definition was successfully updated."

  Scenario: Deleting an Leave Definition
    When User follow "Leave Definitions" link
    Then User should see the text "Listing Leave Definitions"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then Leave definition "Compensatory Work" should be deleted
    And User should not see "Compensatory Work"

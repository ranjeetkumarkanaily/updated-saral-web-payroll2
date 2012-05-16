Feature: Web-SPP – States

  Background:
    Given a valid user
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Settings" link
    Then User should see the text "States"


  Scenario: Creating an new State
    When User follow "States" link
    Then User should see the text "Listing States"
    And User should see the text "Add New State"
    When User follow "Add New State" link
    Then User should see the text "New State"
    And User enters "state_state_name" as "Karnataka"
    And User clicks "Create State" button
    Then User should see the text "Karnataka"

  Scenario: Editing State Detail
    Given User have state Tamilnadu created
    When User follow "States" link
    Then User should see the text "Listing States"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing State"
    And User enters "state_state_name" as "Andra pradesh"
    And User clicks "Update State" button
    Then User should see the text "State was successfully updated."

  Scenario: Deleting an State
    Given User have state Tamilnadu created
    When User follow "States" link
    Then User should see the text "Listing States"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then state "Tamilnadu" should be deleted
    And User should not see "Tamilnadu"
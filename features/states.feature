Feature: Web-SPP – States

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" link

  Scenario: Creating an new State
    When User follow "States" link
    And User follow "Add New State" link
    And User enters "state_state_name" as "Karnataka"
    And User clicks "Create State" button
    Then state count should get increased by 1

  Scenario: Editing State Detail
    Given User have state Tamilnadu created
    When User follow "States" link
    And User follow "Edit" link
    And User enters "state_state_name" as "Andra pradesh"
    And User clicks "Update State" button
    Then User should see the text "State was successfully updated."

  Scenario: Deleting an State
    Given User have state Tamilnadu created
    When User follow "States" link
    And User follow "Delete" link
    Then state "Tamilnadu" should be deleted
    And User should not see "Tamilnadu"
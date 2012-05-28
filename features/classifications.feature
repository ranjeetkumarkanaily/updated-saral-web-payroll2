Feature: Web-SPP – Classifications

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" within "div.bluetabs" link

  Scenario: Creating an new Classification Heading
    When User follow "Classifications" link
    And User follow "Add New Classification Head" link
    And User enters "classification_heading_classification_heading_name" as "Grade"
    And User enters "classification_heading_display_order" as "1"
    And User clicks "Create Classification heading" button
    Then User should see the text "Grade"

  Scenario: Editing Classification Heading
    Given User have Classification Heading Designation created
    When User follow "Classifications" link
    And User follow "Edit" link
    And User enters "classification_heading_classification_heading_name" as "Hr Details"
    And User enters "classification_heading_display_order" as "2"
    And User clicks "Update Classification heading" button
    Then User should see the text "Classification heading was successfully updated."

  Scenario: Viewing Classification Details
    Given User have classification Developer created under Designation
    And User follow "Classifications" link
    And User follow "Details" link
    When User go to the Designation classifications page
    Then User should see the text "Developer"

  Scenario: Adding new classification Detail
    Given User have Classification Heading Designation created
    When User follow "Classifications" link
    And User follow "Details" link
    And User follow "Add New Classification" link
    And User enters "classification_classification_name" as "Children"
    And User clicks "Create Classification" button
    Then User should see the text "Classification was successfully created."

  Scenario: Editing classification Detail
    Given User have classification Developer created under Designation
    When User follow "Classifications" link
    And User follow "Details" link
    And User follow "Edit" link
    And User enters "classification_classification_name" as "Children"
    And  User clicks "Update Classification" button
    Then User should see the text "Classification was successfully updated."

  Scenario: Delete classification Detail
    Given User have classification Developer created under Designation
    When User follow "Classifications" link
    And User follow "Details" link
    And User follow "Delete" link
    Then User should see the text "Classification was successfully Destroyed."

  Scenario: Editing Classification Heading
    Given User have Classification Heading Designation created
    When User follow "Classifications" link
    And User follow "Delete" link
    Then User should not see "Designation"

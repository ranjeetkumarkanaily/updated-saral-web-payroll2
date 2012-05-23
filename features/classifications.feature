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
    And User enters "classification_heading_classification_heading_name" as "Hr Details"
    And User enters "classification_heading_display_order" as "1"
    And User clicks "Create Classification heading" button
    Then User should see the text "Hr Details"

  Scenario: Editing Classification Heading Detail
    Given User have Classification Heading Hr Details created
    When User follow "Classifications" link
    And User follow "Edit" link
    And User enters "classification_heading_classification_heading_name" as "Hr Details"
    And User enters "classification_heading_display_order" as "2"
    And User clicks "Update Classification heading" button
    Then User should see the text "Classification heading was successfully updated."

  Scenario: Viewing Classification Details
    Given User have classification Family Detail created under Hr Details
    And User follow "Classifications" link
    And User follow "Details" link
    When User go to the Hr Details classifications page
    Then User should see the text "Family Detail"

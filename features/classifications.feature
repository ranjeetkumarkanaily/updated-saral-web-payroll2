Feature: Web-SPP – Classifications

  Background:
    Given a valid user
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Settings"
    When User follow "Master" link
    Then User should see the text "Classifications"


  Scenario: Creating an new Classification Heading
    When User follow "Classifications" link
    Then User should see the text "Listing Classification Headings"
    And User should see the text "Add New Classification Head"
    When User follow "Add New Classification Head" link
    Then User should see the text "New Classification Heading"
    And User enters "classification_heading_classification_heading_name" as "Hr Details"
    And User enters "classification_heading_display_order" as "1"
    And User clicks "Create Classification heading" button
    Then User should see the text "Hr Details"

  Scenario: Editing Classification Heading Detail
    Given User have Classification Heading Hr Details created
    When User follow "Classifications" link
    Then User should see the text "Listing Classification Headings"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing Classification Heading"
    And User enters "classification_heading_classification_heading_name" as "Hr Details"
    And User enters "classification_heading_display_order" as "2"
    And User clicks "Update Classification heading" button
    Then User should see the text "Classification heading was successfully updated."

  Scenario: Viewing Classification Details
    Given User have Classification Heading Hr Details created
    And User have classification Family Detail created
    When User follow "Classifications" link
    Then User should see the text "Listing Classification Headings"
    And User should see the text "Operations"
    When User follow "Details" link
    Then User should go to the classifications page with id
#    Then User should see the text "Showing Pay Month"
#    And User should see paymonth "jan/2012" details

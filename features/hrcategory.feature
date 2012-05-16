Feature: Web-SPP – Hr Category

  Background:
    Given a valid user
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Settings" link
    Then User should see the text "HR Category"


  Scenario: Creating an new Hr Category
    When User follow "HR Category" link
    Then User should see the text "Listing HR Categories"
    And User should see the text "Add New HR Category"
    When User follow "Add New HR Category" link
    Then User should see the text "New HR Category"
    And User enters "hr_category_category_name" as "Family Details"
    And User clicks "Create Hr category" button
    Then User should see the text "Family Details"

  Scenario: Editing Hr Category Detail
    Given User have HR Category Family Details created
    When User follow "HR Category" link
    Then User should see the text "Listing HR Categories"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing HR Category"
    And User enters "hr_category_category_name" as "Educational Details"
    And User clicks "Update Hr category" button
    Then User should see the text "Educational Details"

  Scenario: Deleting an Hr Category
    Given User have HR Category Family Details created
    When User follow "HR Category" link
    Then User should see the text "Listing HR Categories"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then hr category "Family Details" should be deleted
    And User should not see "Family Details"
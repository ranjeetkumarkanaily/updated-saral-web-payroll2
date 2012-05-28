Feature: Web-SPP – Hr Category

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" within "div.bluetabs" link

  Scenario: Creating an new Hr Category
    When User follow "HR Category" link
    And User follow "Add New HR Category" link
    And User enters "hr_category_category_name" as "Family Details"
    And User clicks "Create Hr category" button
    Then User should see the text "Family Details"

  Scenario: Editing Hr Category Detail
    Given User have HR Category Family Details created
    When User follow "HR Category" link
    And User follow "Edit" link
    Then User should see the text "Editing HR Category"
    And User enters "hr_category_category_name" as "Educational Details"
    And User clicks "Update Hr category" button
    Then User should see the text "Educational Details"

  Scenario: Viewing Hr Category Detail
    Given User have Hr category Family Details created under HR Category
    And User follow "HR Category" link
    And User follow "Details" link
    When User go to the HR Category hr categories page
    Then User should see the text "Family Details"


  Scenario: Adding new HR category Detail
    Given User have HR Category Family Details created
    When User follow "HR Category" link
    And User follow "Details" link
    And User follow "Add New Label" link
    And User enters "hr_category_detail_name" as "Leave Details"
    And User uncheck "hr_category_detail_required"
    And  User clicks "Create Hr category detail" button
    Then User should see the text "Leave Details"

  Scenario: Editing HR category Detail
    Given User have Hr category Family Details created under HR Category
    When User follow "HR Category" link
    And User follow "Details" link
    And User follow "Edit" link
    And User enters "hr_category_detail_name" as "Educational Details"
    And User uncheck "hr_category_detail_required"
    And  User clicks "Update Hr category detail" button
    Then User should see the text "Educational Details"

  Scenario: Deleting an Hr Category
    Given User have HR Category Family Details created
    When User follow "HR Category" link
    And User follow "Delete" link
    Then hr category "Family Details" should be deleted
    And User should not see "Family Details"
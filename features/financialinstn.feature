Feature: Web-SPP – Financial Institutions

  Background:
    Given a valid user
    And valid Financial institution State Bank Created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Master" link

  Scenario: Creating an new Financial Institution
    When User follow "Financial Institution (Bank)" link
    And User follow "Add New Financial Inst." link
    And User enters "financial_institution_name" as "HDFC"
    And User enters "financial_institution_address_line1" as "Bangalore"
    And User enters "financial_institution_address_line2" as "Rajajinagara"
    And User enters "financial_institution_address_line3" as "WOC"
    And User enters "financial_institution_address_line4" as "service Road"
    And User enters "financial_institution_pincode" as "560040"
    And User enters "financial_institution_branch_code" as "12"
    And User enters "financial_institution_email" as "hdfc@bangalore.com"
    And User clicks "Create Financial institution" button
    Then User should see the text "HDFC"

  Scenario: Viewing Financial Institution Details
    When User follow "Financial Institution (Bank)" link
    And User follow "Show" link
    Then User should see the text "Showing Financial Institution (Bank)"
    And User should see the text "State Bank"

  Scenario: Editing Financial Institution Detail
    When User follow "Financial Institution (Bank)" link
    And User follow "Edit" link
    And User enters "financial_institution_name" as "HDFC"
    And User enters "financial_institution_address_line1" as "Bangalore"
    And User enters "financial_institution_address_line2" as "Rajajinagara"
    And User enters "financial_institution_address_line3" as "WOC"
    And User enters "financial_institution_address_line4" as "service Road"
    And User enters "financial_institution_pincode" as "560040"
    And User enters "financial_institution_branch_code" as "12"
    And User enters "financial_institution_email" as "hdfc@bangalore.com"
    And User clicks "Update Financial institution" button
    Then User should see the text "Financial institution was successfully updated."

  Scenario: Deleting an Financial Institution
    When User follow "Financial Institution (Bank)" link
    And User follow "Delete" link
    Then Financial Institution "State Bank" should be deleted
    And User should not see "State Bank"

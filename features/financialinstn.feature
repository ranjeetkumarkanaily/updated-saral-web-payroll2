Feature: Web-SPP – Financial Institutions

  Background:
    Given a valid user
    And valid Financial institution State Bank Created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "Financial Institution (Bank)"


  Scenario: Creating an new Financial Institution
    When User follow "Financial Institution (Bank)" link
    Then User should see the text "Listing Financial Institutions (Banks)"
    And User should see the text "Add New Financial Inst."
    When User follow "Add New Financial Inst." link
    Then User should see the text "New Financial Institution (Bank)"
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
    Then User should see the text "Listing Financial Institutions (Banks)"
    And User should see the text "Operations"
    When User follow "Show" link
    Then User should see the text "Showing Financial Institution (Bank)"
    And User should see the text "State Bank"

  Scenario: Editing Financial Institution Detail
    When User follow "Financial Institution (Bank)" link
    Then User should see the text "Listing Financial Institutions (Banks)"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing Financial Institution (Bank)"
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
    Then User should see the text "Listing Financial Institutions (Banks)"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then Financial Institution "State Bank" should be deleted
    And User should not see "State Bank"

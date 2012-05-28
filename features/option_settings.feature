Feature: Web-SPP – States

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" link

  Scenario: Viewing option setting Details
    Given option settings defined
    When User follow "Option Settings" link
    Then User should see the text "India"

  Scenario: Viewing module selection details
    Given option settings defined
    When User follow "Option Settings" link
    And User clicks on the ModuleSelection tab
    Then User should see the text "Recruitment: "

  Scenario: Viewing General Settings Detail
    Given option settings defined
    When User follow "Option Settings" link
    And User clicks on the General Settings tab
    Then User should see the text "PF Applicable: "

  Scenario: Viewing Sub Modules Detail
    Given option settings defined
    When User follow "Option Settings" link
    And User clicks on the Sub Modules tab
    Then User should see the text "Reimbursement: "

  Scenario: Editing Country Settings Details
    Given option settings defined
    When User follow "Option Settings" link
    And User follow "Edit" link
    And User clicks on the Country Settings tab
    And User select "India" from "option_setting_country_id"
    And User select "(GMT+05:30) Kolkata" from "option_setting_time_zone"
    And User clicks "Update Option setting" button
    Then User should see the text "Option setting was successfully updated."

  Scenario: Editing module selection Details
    Given option settings defined
    When User follow "Option Settings" link
    And User follow "Edit" link
    And User clicks on the ModuleSelection tab
    And User check "option_setting_recruitment"
    And User check "option_setting_lv_atdn_mgmt"
    And User check "option_setting_training"
    And User clicks "Update Option setting" button
    Then User should see the text "Option setting was successfully updated."

  Scenario: Editing General Settings Details
    Given option settings defined
    When User follow "Option Settings" link
    And User follow "Edit" link
    And User clicks on the General Settings tab
    And User check "option_setting_pf_applicable"
    And User check "option_setting_esi_applicable"
    And User check "option_setting_pt_applicable"
    And User clicks "Update Option setting" button
    Then User should see the text "Option setting was successfully updated."

  Scenario: Editing Sub Modules Details
    Given option settings defined
    When User follow "Option Settings" link
    And User follow "Edit" link
    And User clicks on the Sub Modules tab
    And User check "option_setting_remibursement"
    And User check "option_setting_gratuity"
    And User check "option_setting_loans_adv"
    And User clicks "Update Option setting" button
    Then User should see the text "Option setting was successfully updated."

Feature: Web-SPP – PT Group

  Background:
    Given a valid user
    And Given valid state Karnakata created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    When User follow "Master" link

  Scenario: Creating an new PT Group
    When User follow "PT Group" link
    When User follow "Add New PT Group" link
    And User enters "pt_group_name" as "Karnataka"
    And User select "Karnakata" from "pt_group_state_id"
    And User enters "pt_group_address" as "Bangalore"
    And User enters "pt_group_certificate_no" as "123"
    And User enters "pt_group_pto_circle_no" as "123456"
    And User select "Monthly" from "pt_group_return_period"
    And User clicks "Save PT Group" button
    Then User should see the text "Karnakata"

  Scenario: Editing PT Group Detail
    Given User have PT Group Karnakata created
    When User follow "PT Group" link
    And User follow "Edit" link
    And User enters "pt_group_name" as "Karnataka"
    And User enters "pt_group_address" as "Mysore"
    And User enters "pt_group_certificate_no" as "123"
    And User enters "pt_group_pto_circle_no" as "123456"
    And User select "Monthly" from "pt_group_return_period"
    And User clicks "Save PT Group" button
    Then User should see the text "Showing Karnataka 's Rate"

  Scenario: Deleting an PT Group
    Given User have PT Group Karnakata created
    When User follow "PT Group" link
    And User follow "Delete" link
    Then PT Group "Karnakata" should be deleted
    And User should not see "Karnakata"

  Scenario: Viewing PT Group
    Given User have PT Group Karnakata created
    When User follow "PT Group" link
    And User follow "Details" link
    Then User should see the text "Showing Karnakata 's Rate"

  Scenario: Adding New PT Group rate for PT Group
    Given User have PT Group Karnataka created
    And valid Feb/2012 month is created
    When User follow "PT Group" link
    And User follow "Details" link
    And User follow "Add New PT Rate" link
    When User go to the new PT Rate for Karnataka PT Group
    And User select "Feb/2012" from "pt_group_rate_paymonth_id"
    And User clicks "Save PT Group Rates" button
    Then User should see the text "2012-02-01"

  Scenario: Defining PT Rate for PT Group Month
    Given User have PT Group month Feb/2012 created under PT Group Karnataka
    When User follow "PT Group" link
    And User follow "Details" link
    And User follow "Settings" link
    When User go to the PT Rates Karnataka details for Feb/2012 month
    And User follow "Add New PT Rates" link
    And User enters "pt_rate_min_sal_range" as "20000"
    And User enters "pt_rate_pt" as "200"
    And User clicks "Save" button
    Then User should see the text "20000"

  Scenario: Editing PT Rate for PT Group Month
    Given User have PT Group month Feb/2012 created with PT Group Karnataka
    When User follow "PT Group" link
    And User follow "Details" link
    And User follow "Settings" link
    When User go to the PT Rates Karnataka details for Feb/2012 month
    And User follow "Edit" link
    When User go to the PT Rates Karnataka page
    And User enters "pt_rate_min_sal_range" as "10000"
    And User enters "pt_rate_pt" as "200"
    And User clicks "Save" button
    Then User should see the text "10000"

  Scenario: Deleting PT Rate for PT Group Month
    Given User have PT Group month Feb/2012 created with PT Group Karnataka
    When User follow "PT Group" link
    And User follow "Details" link
    And User follow "Settings" link
    When User go to the PT Rates Karnataka details for Feb/2012 month
    And User follow "Delete" link
    Then PtRates count decreased by 1


Feature: Web-SPP – Leave Definition

  Background:
    Given a valid user
    And a valid leave definition Compensatory Work Created
    And Given valid state Karnakata created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Leave" link

  Scenario: Creating an new Leave Definition
    Given User have Employee Shivarudraiah created
    When User follow "Leave Details" link
    And User follow "Add Leave Detail" link
    And User select "Shivarudraiah" from "leave_detail_employee_id"
    And User select "CW" from "leave_detail_leave_definition_id"
    And User enters "leave_date" as "2012-05-15"
    And User clicks "Create Leave detail" button
    Then Leave details should increse by 1

  Scenario: Editing Leave Detail
    Given User have a leave detail created under employee Shivarudraiah
    When User follow "Leave Details" link
    And User follow "Edit" link
    And User select "Shivarudraiah" from "leave_detail_employee_id"
    And User select "CH" from "leave_detail_leave_definition_id"
    And User enters "leave_date" as "2012-05-18"
    Then User should see the text "Shivarudraiah"

  Scenario: Deleting an Leave Detail
    Given User have a leave detail created under employee Shivarudraiah
    When User follow "Leave Details" link
    When User follow "Delete" link
    Then leave detail count should decreased by 1

  Scenario: Uploading leave opening balance
    When User follow "Leave Details" link
    And User follow "Upload Leave Opening Balance" link
    And User upload the leave opening balance excel file
    And User clicks "Upload File" button
    Then User should see the text "Leave opening balance was successfully uploaded."

  Scenario: leaves excel sample file
    When User follow "Leave Details" link
    And User follow "Generate Sample Template" link
    When User go to the leave sample template page
    Then User should redirect to leaves generate_sample_excel_template

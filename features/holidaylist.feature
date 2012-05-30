Feature: Web-SPP – Holiday Lists

  Background:
    Given a valid user
    And valid Attendance Normal Shift created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Master" link

  Scenario: Creating an new Holiday Lists
    When User follow "Holiday Lists" link
    And User follow "Add New Holiday" link
    And User select "Normal Shift" from "holiday_attendance_configuration_id"
    And User enters "holiday_description" as "test"
    And User enters "hdd" as "2012-05-12"
    And User uncheck "holiday_national_holiday"
    And User clicks "Create Holiday" button
    Then Holiday list count should increse by 1

  Scenario: Viewing Holiday Lists Details
    Given valid Holiday gandhi jayanthi created
    When User follow "Holiday Lists" link
    And User select "Normal Shift" from "attendance_configuration"
    And User clicks "Get List" button
    And User follow "Show" link
    Then User should see the text "gandhi jayanthi"

  Scenario: Editing Holiday Lists Detail
    Given valid Holiday gandhi jayanthi created
    When User follow "Holiday Lists" link
    And User select "Normal Shift" from "attendance_configuration"
    And User clicks "Get List" button
    And User follow "Edit" link
    Then User should see the text "Editing Holiday"
    And User select "Normal Shift" from "holiday_attendance_configuration_id"
    And User enters "holiday_description" as "test"
    And User enters "hdd" as "2012-05-12"
    And User uncheck "holiday_national_holiday"
    And User clicks "Update Holiday" button
    Then User should see the text "test"

  Scenario: Deleting an Holiday Lists
    Given valid Holiday gandhi jayanthi created
    When User follow "Holiday Lists" link
    And User select "Normal Shift" from "attendance_configuration"
    And User clicks "Get List" button
    And User should see the text "gandhi jayanthi"
    And User follow "Delete" link
    Then Holiday "gandhi jayanthi" should be deleted
    And User should not see "gandhi jayanthi"

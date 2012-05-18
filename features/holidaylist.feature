Feature: Web-SPP – Holiday Lists

  Background:
    Given a valid user
    And valid Attendance Normal Shift created
    And valid Holiday gandhi jayanthi created
    When User go to the login page
    Then User should see the text "Sign In"
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    Then User should see the text "Home"
    When User follow "Master" link
    Then User should see the text "Holiday Lists"


  Scenario: Creating an new Holiday Lists
    When User follow "Holiday Lists" link
    Then User should see the text "Listing Holidays"
    And User should see the text "Add New Holiday"
    When User follow "Add New Holiday" link
    Then User should see the text "New Holiday"
    And User select "Normal Shift" from "holiday_attendance_configuration_id"
    And User enters "holiday_description" as "test"
    And User enters "hdd" as "2012-05-12"
    And User uncheck "holiday_national_holiday"
    And User clicks "Create Holiday" button
    Then User should see the text "Showing Holiday"
    And User should see the text "Normal Shift"

  Scenario: Viewing Holiday Lists Details
    When User follow "Holiday Lists" link
    Then User should see the text "Listing Holidays"
    And User should see the text "Attendance"
    Then User select "Normal Shift" from "attendance_configuration"
    And User clicks "Get List" button
    And User should see the text "gandhi jayanthi"
    And User should see the text "Operations"
    When User follow "Show" link
    Then User should see the text "Showing Holiday"
    And User should see the text "gandhi jayanthi"

  Scenario: Editing Holiday Lists Detail
    When User follow "Holiday Lists" link
    Then User should see the text "Listing Holidays"
    And User should see the text "Attendance"
    Then User select "Normal Shift" from "attendance_configuration"
    And User clicks "Get List" button
    And User should see the text "gandhi jayanthi"
    And User should see the text "Operations"
    When User follow "Edit" link
    Then User should see the text "Editing Holiday"
    And User select "Normal Shift" from "holiday_attendance_configuration_id"
    And User enters "holiday_description" as "test"
    And User enters "hdd" as "2012-05-12"
    And User uncheck "holiday_national_holiday"
    And User clicks "Update Holiday" button
    Then User should see the text "Showing Holiday"
    Then User should see the text "test"

  Scenario: Deleting an Holiday Lists
    When User follow "Holiday Lists" link
    Then User should see the text "Listing Holidays"
    And User should see the text "Attendance"
    Then User select "Normal Shift" from "attendance_configuration"
    And User clicks "Get List" button
    And User should see the text "gandhi jayanthi"
    And User should see the text "Operations"
    When User follow "Delete" link
    Then Holiday "gandhi jayanthi" should be deleted
    And User should not see "gandhi jayanthi"

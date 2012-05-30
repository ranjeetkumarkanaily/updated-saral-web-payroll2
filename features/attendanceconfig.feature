Feature: Web-SPP – Attendance Configuration

  Background:
    Given a valid user
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Settings" link

  Scenario: Defining an new Attendance Configuration
    When User follow "Attendance Configuration" link
    And User follow "Add New Attn. Configuration" link
    And User enters "attendance_configuration_attendance" as "Normal Shift"
    And User enters "attendance_configuration_short_name" as "NS"
    And  User choose "attendance_configuration_salary_calendar_days_actual_days__month"
    And User clicks "Create Attendance configuration" button
    Then AttendanceConfiguration count should increase by 1

  Scenario: Editing Attendance Configuration
    Given User have Attendance Configuration First Shift created
    When User follow "Attendance Configuration" link
    And User follow "Edit" link
    And User enters "attendance_configuration_attendance" as "Normal Shift"
    And User enters "attendance_configuration_short_name" as "NS"
    And  User choose "attendance_configuration_salary_calendar_days_actual_days__month"
    And User clicks "Update Attendance configuration" button
    Then User should see the text "Attendance configuration was successfully updated."

  Scenario: Deleting an Attendance Configuration
    Given User have Attendance Configuration First Shift created
    When User follow "Attendance Configuration" link
    And User follow "Delete" link
    Then Attendance Configuration "First Shift" should be deleted
    And User should not see "First Shift"
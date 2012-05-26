Feature: Web-SPP – Employee Salary Detail

  Background:
    Given a valid user
    And Given valid state Karnakata created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Reports" link

  Scenario: Generate new the salary for employee
    Given User have Employee Shivarudraiah created
    And User have required details for employees created
    And User follow "Employee Master Report" link
    And User select "Developer" from "report_classification_Designation"
    And User choose "report_type_date_of_joining"
    And User clicks "Generate Report" button
    When User go to the employees Shivarudraiah report with date of joining
    Then User should redirect to employees report
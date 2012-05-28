Feature: Web-SPP – Employee Salary Detail

  Background:
    Given a valid user
    And Given valid state Karnakata created
    When User go to the login page
    And User enters "Username" as "admin"
    And User enters "Password" as "default"
    And User clicks "Sign In" button
    And User follow "Salary" link

  Scenario: Generate new the salary for employee
    Given user have required details created
    And User follow "Employee's - Salary Details" link
    And User select "Shivarudraiah" from "employee_id"
    And User select "jan/2012" from "month_year"
    And User clicks "Get Salary Detail" button
    Then User should see the text "Generate Payslip"

  Scenario: Generate new salary payslip for employee
    Given user have required details created
    And User follow "Employee's - Salary Details" link
    And User select "Shivarudraiah" from "employee_id"
    And User select "jan/2012" from "month_year"
    And User clicks "Get Salary Detail" button
    And User follow "Generate Payslip" link
    When User go to the Shivarudraiah salary pdf for jan/2012 month page
    Then Use should go to salary index page
Feature: Web-SPP – Salary Editor

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
    And User follow "Salary Editor" link
    And User select "Shivarudraiah" from "employee_id"
    And User select "jan/2012" from "month_year"
    And User clicks "Get Salary" button
    When User go to the Shivarudraiah employee salary for jan/2012 month
    Then User should see the text "Earnings"

  Scenario: Generate the salary for employee
    Given user have required details created
    And User follow "Salary Editor" link
    And User select "Shivarudraiah" from "employee_id"
    And User select "jan/2012" from "month_year"
    And User clicks "Get Salary" button
    When User go to the Shivarudraiah employee salary for jan/2012 month
    And User clicks "Generate Salary" button
    Then User should redirect to salaries index path